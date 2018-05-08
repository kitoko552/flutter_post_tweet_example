#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"

#import <Social/Social.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [GeneratedPluginRegistrant registerWithRegistry:self];
    
    FlutterViewController* controller = (FlutterViewController*)self.window.rootViewController;
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                            methodChannelWithName:@"com.kitoko552.flutter_post_tweet_example/tweet"
                                            binaryMessenger:controller];
    
    __weak AppDelegate* wself = self;
    [channel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
        [wself tweet];
    }];
    
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

- (void)tweet {
    // tweet by using TwitterKit or other service
}

@end
