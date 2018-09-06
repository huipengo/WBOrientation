//
//  UINavigationController+Orientation.m
//  WBKit
//
//  Created by huipeng on 2018/1/15.
//  Copyright © 2018年 weibo. All rights reserved.
//

#import "UINavigationController+Orientation.h"

@implementation UINavigationController (Orientation)

/// 是否自动旋转
- (BOOL)shouldAutorotate
{
    return [[self.viewControllers lastObject] shouldAutorotate];
}

/// 支持的方向
- (NSUInteger)supportedInterfaceOrientations
{
    return [[self.viewControllers lastObject] supportedInterfaceOrientations];
}

@end
