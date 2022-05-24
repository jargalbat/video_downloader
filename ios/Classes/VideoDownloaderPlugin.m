#import "VideoDownloaderPlugin.h"
#if __has_include(<video_downloader/video_downloader-Swift.h>)
#import <video_downloader/video_downloader-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "video_downloader-Swift.h"
#endif

@implementation VideoDownloaderPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftVideoDownloaderPlugin registerWithRegistrar:registrar];
}
@end
