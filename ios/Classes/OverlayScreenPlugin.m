#import "OverlayScreenPlugin.h"
#if __has_include(<overlay_screen/overlay_screen-Swift.h>)
#import <overlay_screen/overlay_screen-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "overlay_screen-Swift.h"
#endif

@implementation OverlayScreenPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftOverlayScreenPlugin registerWithRegistrar:registrar];
}
@end
