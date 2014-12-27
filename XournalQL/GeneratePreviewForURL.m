#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#include <CoreFoundation/CoreFoundation.h>
#include <CoreServices/CoreServices.h>
#include <QuickLook/QuickLook.h>


#define XOURNALQL_USE_PDF 1


OSStatus GeneratePreviewForURL(void *thisInterface, QLPreviewRequestRef preview, CFURLRef url, CFStringRef contentTypeUTI, CFDictionaryRef options);
void CancelPreviewGeneration(void *thisInterface, QLPreviewRequestRef preview);


OSStatus GeneratePreviewForURL(void *thisInterface, QLPreviewRequestRef preview, CFURLRef url, CFStringRef contentTypeUTI, CFDictionaryRef options)
{
    @autoreleasepool
    {
        // wrong data type?
        NSString *dataType = (__bridge NSString *)contentTypeUTI;
        if(![dataType isEqualToString:@"net.sourceforge.xournal"])
            return noErr;
        
        // generate HTML preview
        NSURL *URL = (__bridge NSURL *)url;
        NSString *path = [URL path];
        NSTask *task = [NSTask new];
#if XOURNALQL_USE_PDF
        [task setLaunchPath:@"/usr/local/bin/xoj2pdf"];
#else
        [task setLaunchPath:@"/usr/local/bin/xoj2html"];
#endif
        NSPipe *pipe = [NSPipe pipe];
        [task setStandardOutput:pipe];
        [task setArguments:@[path]];
        [task launch];
        NSData *data =  [[pipe fileHandleForReading] readDataToEndOfFile];
        [task waitUntilExit];
        
        // canceled in the meanwhile?
        if(QLPreviewRequestIsCancelled(preview))
            return noErr;
        
        // preview HTML
#if XOURNALQL_USE_PDF
        QLPreviewRequestSetDataRepresentation(preview, (__bridge CFDataRef)data, kUTTypePDF, NULL);
#else
        NSDictionary *props =
        @{
          (__bridge NSString *)kQLPreviewPropertyTextEncodingNameKey: @"UTF-8",
          (__bridge NSString *)kQLPreviewPropertyMIMETypeKey: @"text/html",
          (__bridge NSString *)kQLPreviewPropertyAttachmentsKey: @{}
        };
        QLPreviewRequestSetDataRepresentation(preview, (__bridge CFDataRef)data, kUTTypeHTML, (__bridge CFDictionaryRef)props);
#endif
        return noErr;
    }
}

void CancelPreviewGeneration(void *thisInterface, QLPreviewRequestRef preview)
{
}
