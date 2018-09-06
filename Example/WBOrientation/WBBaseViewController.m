//
//  WBBaseViewController.m
//  WBOrientation_Example
//
//  Created by penghui8 on 2018/9/6.
//  Copyright © 2018年 彭辉. All rights reserved.
//

#import "WBBaseViewController.h"
#import "UIImage+Ex.h"

@interface WBBaseViewController ()

@end

@implementation WBBaseViewController

- (void)dealloc {
    NSLog(@"dealloc:%@\n", self.debugDescription);
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self configDefaultNavigation];
    [self layoutNavigationBar];
}

/// 设置导航栏样式
- (void)configDefaultNavigation {
    self.navigationController.navigationBar.barTintColor = self.barTintColor;
}

- (void)layoutNavigationBar {
    if (self.ignoreNavigationBarShadow) {
        self.navigationController.navigationBar.shadowImage = UIImage.new;
    }
    else {
        UIColor *color = [UIColor colorWithRed:220.0f/255.0f green:226.0f/255.0f blue:234.0f/255.0f alpha:1.0f];
        self.navigationController.navigationBar.shadowImage = [UIImage imageWithSolidColor:color size:CGSizeMake([UIScreen mainScreen].bounds.size.width, 1.0 / [UIScreen mainScreen].scale)];
    }
    
    NSShadow *shadow = [NSShadow new];
    shadow.shadowColor = [UIColor clearColor];
    shadow.shadowOffset = CGSizeMake(1.0f, 0.0f);
    
    // 导航栏标题
    UIColor *titleColor = [UIColor colorWithRed:54.0f/255.0f green:54.0f/255.0f blue:54.0f/255.0f alpha:1.0f];
    NSDictionary *dict = @{NSForegroundColorAttributeName: titleColor,
                           NSFontAttributeName: [UIFont boldSystemFontOfSize:16.0f],
                           NSShadowAttributeName: shadow};
    self.navigationController.navigationBar.titleTextAttributes = dict;
    self.navigationController.navigationBar.tintColor = titleColor;
    [self.navigationController setNeedsStatusBarAppearanceUpdate];
}


#pragma mark --
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark --
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

- (BOOL)prefersStatusBarHidden {
    return _statusBarHidden;
}

- (void)setStatusBarHidden:(BOOL)statusBarHidden {
    if (_statusBarHidden != statusBarHidden) {
        _statusBarHidden = statusBarHidden;
    }
    
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
        [self prefersStatusBarHidden];
        [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
    }
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
    return UIStatusBarAnimationNone;
}

#pragma mark --
/// 是否自动旋转
- (BOOL)shouldAutorotate {
    return self.isAutoRotate;
}

/// 支持的方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return self.isAutoRotate ? UIInterfaceOrientationMaskAllButUpsideDown : UIInterfaceOrientationMaskPortrait;
}

@end
