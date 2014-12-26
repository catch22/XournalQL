#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#include <CoreFoundation/CoreFoundation.h>
#include <CoreServices/CoreServices.h>
#include <QuickLook/QuickLook.h>

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
        [task setLaunchPath:@"/usr/local/bin/xoj2html"];
        NSPipe *pipe = [NSPipe pipe];
        [task setStandardOutput:pipe];
        [task setArguments:@[path]];
        [task launch];
        NSData *htmlData =  [[pipe fileHandleForReading] readDataToEndOfFile];
        [task waitUntilExit];
        //NSString *html = [[NSString alloc] initWithData:htmlData encoding:NSUTF8StringEncoding];
        
        // canceled in the meanwhile?
        if(QLPreviewRequestIsCancelled(preview))
            return noErr;
        
        // preview HTML
        //htmlData = [@"testing..." dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *props =
        @{
          (__bridge NSString *)kQLPreviewPropertyTextEncodingNameKey: @"UTF-8",
          (__bridge NSString *)kQLPreviewPropertyMIMETypeKey: @"text/html",
          (__bridge NSString *)kQLPreviewPropertyAttachmentsKey: @{}
        };
        QLPreviewRequestSetDataRepresentation(preview, (__bridge CFDataRef)htmlData, kUTTypeHTML, (__bridge CFDictionaryRef)props);
        return noErr;
    }
}

void CancelPreviewGeneration(void *thisInterface, QLPreviewRequestRef preview)
{
}
