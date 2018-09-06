//
//  WBAppDelegate.m
//  WBOrientation
//
//  Created by 彭辉 on 09/06/2018.
//  Copyright (c) 2018 彭辉. All rights reserved.
//

#import "WBAppDelegate.h"
#import "WBAppConfigure.h"

@implementation WBAppDelegate

+ (WBAppDelegate * _Nonnull)appDelegate {
    return (WBAppDelegate *)[UIApplication sharedApplication].delegate;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _window.backgroundColor = [UIColor whiteColor];
    
    self.window.rootViewController = wb_tabBarController();
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

@end
