#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#include <CoreFoundation/CoreFoundation.h>
#include <CoreServices/CoreServices.h>
#include <QuickLook/QuickLook.h>

OSStatus GenerateThumbnailForURL(void *thisInterface, QLThumbnailRequestRef thumbnail, CFURLRef url, CFStringRef contentTypeUTI, CFDictionaryRef options, CGSize maxSize);
void CancelThumbnailGeneration(void *thisInterface, QLThumbnailRequestRef thumbnail);

/* -----------------------------------------------------------------------------
    Generate a thumbnail for file

   This function's job is to create thumbnail for designated file as fast as possible
   ----------------------------------------------------------------------------- */

OSStatus GenerateThumbnailForURL(void *thisInterface, QLThumbnailRequestRef thumbnail, CFURLRef url, CFStringRef contentTypeUTI, CFDictionaryRef options, CGSize maxSize)
{
//    @autoreleasepool {
//        NSString *dataType = (__bridge NSString *)contentTypeUTI;
//        if(![dataType isEqualToString:@"net.sourceforge.xournal"])
//            return noErr;
//
//        NSURL *iconURL = [[NSBundle bundleWithIdentifier:@"org.leetspeak.XournalQL"] URLForResource:@"icon" withExtension:@"png"];
//        NSImage *appIcon = [[NSImage alloc] initWithContentsOfURL:iconURL];
//        
//        if (QLThumbnailRequestIsCancelled(thumbnail)) {
//            return noErr;
//        }
//        
//        NSSize canvasSize = appIcon.size;
//        NSRect renderRect = NSMakeRect(0.0, 0.0, appIcon.size.width, appIcon.size.height);
//        CGContextRef _context = QLThumbnailRequestCreateContext(thumbnail, canvasSize, false, NULL);
//        if (_context) {
//            NSGraphicsContext* _graphicsContext = [NSGraphicsContext graphicsContextWithGraphicsPort:(void *)_context flipped:NO];
//            
//            [NSGraphicsContext setCurrentContext:_graphicsContext];
//            [appIcon drawInRect:renderRect];
//            //draw anything you want here
//            
//            QLThumbnailRequestFlushContext(thumbnail, _context);
//            CFRelease(_context);
//        }
//    }
    
    return noErr;
}

void CancelThumbnailGeneration(void *thisInterface, QLThumbnailRequestRef thumbnail)
{
}
