#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#include "FlutterNativePlugin.h"
#include "NativeViewPlugin.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
    [FlutterNativePlugin registerWithRegistrar: [self registrarForPlugin:@"FlutterNativePlugin"]];
    
    [NativeViewPlugin registerWithRegistry:self];

  // Override point for customization after application launch.
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
