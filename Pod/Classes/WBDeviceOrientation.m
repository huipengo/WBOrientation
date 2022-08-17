//
//  WBDeviceOrientation.m
//  WBKit
//
//  Created by huipeng on 2018/1/12.
//  Copyright © 2018年 weibo. All rights reserved.
//

#import "WBDeviceOrientation.h"

@implementation WBDeviceOrientation

+ (void)registerDeviceOrientationObserver:(id)observer selector:(SEL)aSelector {
    /**
     *  开始生成 设备旋转 通知
     */
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    
    /**
     *  添加 设备旋转 通知
     *
     *  - (void)handleDeviceOrientationDidChange:(UIInterfaceOrientation)interfaceOrientation
     *
     *  @return return value description
     */
    [[NSNotificationCenter defaultCenter] addObserver:observer
                                             selector:aSelector
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];
}

+ (void)removeDeviceOrientationObserver:(id)observer  {
    
    /**
     *  销毁 设备旋转 通知
     *
     *  @return return value description
     */
    [[NSNotificationCenter defaultCenter] removeObserver:observer
                                                    name:UIDeviceOrientationDidChangeNotification
                                                  object:nil];
    
    
    /**
     *  结束 设备旋转通知
     *
     *  @return return value description
     */
    [[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
}

/// 设备方向
+ (UIInterfaceOrientation)interfaceOrientation {
    UIDeviceOrientation deviceOrientation = [[UIDevice currentDevice] orientation];
    UIInterfaceOrientation _interfaceOrientation;
    if (deviceOrientation == UIDeviceOrientationPortrait) {
        _interfaceOrientation = UIInterfaceOrientationPortrait;
    }
    else if (deviceOrientation == UIDeviceOrientationPortraitUpsideDown) {
        _interfaceOrientation = UIInterfaceOrientationPortraitUpsideDown;
    }
    else if (deviceOrientation == UIDeviceOrientationLandscapeLeft) {
        _interfaceOrientation = UIInterfaceOrientationLandscapeRight;
    }
    else if (deviceOrientation == UIDeviceOrientationLandscapeRight) {
        _interfaceOrientation = UIInterfaceOrientationLandscapeLeft;
    }
    else {
        _interfaceOrientation = UIInterfaceOrientationUnknown;
    }
    return _interfaceOrientation;
}

+ (UIInterfaceOrientation)statusBarOrientation {
    return [[UIApplication sharedApplication] statusBarOrientation];
}

/// 强制转屏
+ (void)interfaceOrientation:(UIInterfaceOrientation)orientation viewController:(UIViewController *)viewController
{
    if (@available(iOS 16.0, *)) {
        UINavigationController *nav = viewController.navigationController;
        SEL selUpdateSupportedMethod = NSSelectorFromString(@"setNeedsUpdateOfSupportedInterfaceOrientations");
        if ([nav respondsToSelector:selUpdateSupportedMethod]) {
            (((void (*)(id, SEL))[nav methodForSelector:selUpdateSupportedMethod])(nav, selUpdateSupportedMethod));
        }
        
        /// 以下代码可注释或不注释都行
//        NSArray *array = [[[UIApplication sharedApplication] connectedScenes] allObjects];
//        UIWindowScene *ws = (UIWindowScene *)array.firstObject;
//        Class GeometryPreferences = NSClassFromString(@"UIWindowSceneGeometryPreferencesIOS");
//        id geometryPreferences = [[GeometryPreferences alloc] init];
//        [geometryPreferences setValue:@([self interfaceOrientationMask:orientation]) forKey:@"interfaceOrientations"];
//        SEL selGeometryUpdateMethod = NSSelectorFromString(@"requestGeometryUpdateWithPreferences:errorHandler:");
//        void (^ErrorBlock)(NSError *error) = ^(NSError *error){
//              NSLog(@"iOS 16 转屏Error: %@",error);
//        };
//        if ([ws respondsToSelector:selGeometryUpdateMethod]) {
//            (((void (*)(id, SEL,id,id))[ws methodForSelector:selGeometryUpdateMethod])(ws, selGeometryUpdateMethod,geometryPreferences,ErrorBlock));
//        }
//
//        return;
    }
    
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        SEL selector  = NSSelectorFromString(@"setOrientation:");
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget:[UIDevice currentDevice]];
        int val = (int)orientation;
        // 从 2 开始是因为 0 1 两个参数已经被 selector 和 target 占用
        [invocation setArgument:&val atIndex:2];
        [invocation invoke];
    }
}

+ (UIInterfaceOrientationMask)interfaceOrientationMask:(UIInterfaceOrientation)orientation {
    if (orientation == UIInterfaceOrientationLandscapeLeft) {
        return UIInterfaceOrientationMaskLandscapeLeft;
    }
    else if (orientation == UIInterfaceOrientationLandscapeRight) {
        return UIInterfaceOrientationMaskLandscapeRight;
    }
    else if (orientation == UIInterfaceOrientationPortrait) {
        return UIInterfaceOrientationMaskPortrait;
    }
    else {
        return UIInterfaceOrientationMaskPortrait;
    }
}


/// 强制设备旋转到某个方向
+ (void)forceToDeviceOrientation:(UIDeviceOrientation)orientation
{
    UIDevice *device = [UIDevice currentDevice];
    if (orientation == UIDeviceOrientationUnknown)
    {
        return;
    }
    else if ([device orientation] == orientation)
    {
        [UIViewController attemptRotationToDeviceOrientation];
    }
    else
    {
        if ([device respondsToSelector:@selector(setOrientation:)])
        {
            [device setValue:@(orientation) forKey:@"orientation"];
        }
    }
}

@end
