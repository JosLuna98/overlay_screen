#import "LoadingScreenPlugin.h"
#if __has_include(<loading_screen/loading_screen-Swift.h>)
#import <loading_screen/loading_screen-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "loading_screen-Swift.h"
#endif

@implementation LoadingScreenPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftLoadingScreenPlugin registerWithRegistrar:registrar];
}
@end
