#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"

#import <Accounts/Accounts.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [GeneratedPluginRegistrant registerWithRegistry:self];
    
    FlutterViewController* controller = (FlutterViewController*)self.window.rootViewController;
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                            methodChannelWithName:@"com.kitoko552.flutter_post_tweet_example/tweet"
                                            binaryMessenger:controller];
    
    __weak AppDelegate* wself = self;
    [channel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
        if ([call.method isEqualToString:@"tweet"]) {
            [wself openActivity];
        } else {
            result(FlutterMethodNotImplemented);
        }
    }];
    
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

- (void)openActivity {
    UIActivityViewController* controller = [[UIActivityViewController alloc] initWithActivityItems:@[@"This tweet is posted on Flutter app!"] applicationActivities:NULL];
    [self.window.rootViewController presentViewController:controller animated:true completion:NULL];
}

@end
