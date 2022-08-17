//
//  WVMHUD.h
//  WBLiveBox
//
//  Created by 刘洋洋 on 2018/7/24.
//  Copyright © 2018年 58. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WVMHUD: NSObject

+ (instancetype)HUD NS_SWIFT_NAME(HUD());

+ (void)showHUDInView:(UIView * _Nullable)view
              message:(NSString * _Nullable)message
             duration:(NSTimeInterval)duration
             animated:(BOOL)animated
             complete:(void(^ _Nullable)(void))complete;

/// 背景可点击 Toast
+ (void)show:(NSString * _Nullable)message;
+ (void)show:(NSString * _Nullable)message inView:(UIView * _Nullable)view;

+ (void)hide:(BOOL)animated;

+ (void)hideInView:(UIView * _Nullable)view animated:(BOOL)animated;

/// 设置完进度后需手动 resetProgress
- (void)showInView:(UIView * _Nullable)view message:(NSString * _Nullable)message progress:(CGFloat)progress;
- (void)resetProgress;

@end

NS_ASSUME_NONNULL_END
