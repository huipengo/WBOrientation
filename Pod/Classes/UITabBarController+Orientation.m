//
//  UITabBarController+Orientation.m
//  WBKit
//
//  Created by huipeng on 2018/1/15.
//  Copyright © 2018年 weibo. All rights reserved.
//

#import "UITabBarController+Orientation.h"

@implementation UITabBarController (Orientation)

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return [self.selectedViewController supportedInterfaceOrientations];
}

- (BOOL)shouldAutorotate {
    return self.selectedViewController.shouldAutorotate;
}

@end
