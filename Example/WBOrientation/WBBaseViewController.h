//
//  WBBaseViewController.h
//  WBOrientation_Example
//
//  Created by penghui8 on 2018/9/6.
//  Copyright © 2018年 彭辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WBBaseViewController : UIViewController

/// 是否支持旋转
@property (nonatomic, assign, getter=isAutoRotate) BOOL autoRotate;

/// 隐藏statusBar
@property (nonatomic, assign) BOOL statusBarHidden;

/// 忽略导航条阴影线
@property (nonatomic, assign) BOOL ignoreNavigationBarShadow;

/// default is nil
@property(nullable, nonatomic, strong) UIColor *barTintColor;

@end
