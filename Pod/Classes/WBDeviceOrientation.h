//
//  WBDeviceOrientation.h
//  WBKit
//
//  Created by huipeng on 2018/1/12.
//  Copyright © 2018年 weibo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBDeviceOrientation : NSObject

/// 添加 设备旋转 通知
+ (void)registerDeviceOrientationObserver:(id)observer selector:(SEL)aSelector;

/// 销毁 设备旋转 通知
+ (void)removeDeviceOrientationObserver:(id)observer;

/// 设备方向
+ (UIInterfaceOrientation)interfaceOrientation;

+ (UIInterfaceOrientation)statusBarOrientation;

/// 强制转屏
+ (void)interfaceOrientation:(UIInterfaceOrientation)orientation;


/**
 强制设备旋转到某个方向
 
 @param orientation 要旋转到的方向
 */
+ (void)forceToDeviceOrientation:(UIDeviceOrientation)orientation;

@end
