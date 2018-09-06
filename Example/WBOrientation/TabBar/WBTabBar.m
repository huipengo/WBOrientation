//
//  WBTabBar.m
//  Fanstong
//
//  Created by penghui8 on 2018/4/26.
//  Copyright © 2018年 penghui. All rights reserved.
//

#import "WBTabBar.h"
//#import <UIImage+Ex.h>

#define isiPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125.0f, 2436.0f), [[UIScreen mainScreen] currentMode].size) : NO)

void wb_valueForTabBarController(UITabBarController *tabBarController) {
#ifdef __IPHONE_11_0
    if (isiPhoneX) {
        WBTabBar *tabBar = [[WBTabBar alloc] init];
        [tabBarController setValue:tabBar forKey:@"tabBar"];
    }
#endif
}

/// 设置TabBar UI
void wb_configureTabBarAppearence() {
    UIColor *normal_color = [UIColor colorWithRed:142.0f/255.0f green:144.0f/255.0f blue:145.0f/255.0f alpha:1.0f];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: normal_color} forState:UIControlStateNormal];
    UIColor *selected_color = [UIColor colorWithRed:0.0f/255.0f green:57.0f/255.0f blue:204.0f/255.0f alpha:1.0f];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: selected_color} forState:UIControlStateSelected];
    [[UITabBarItem appearance] setTitlePositionAdjustment:UIOffsetMake(0.0f, -3.0f)];
    
    /** 去上面的阴影线*/
    /*
    [UITabBar appearance].translucent = YES;
    [[UITabBar appearance] setShadowImage:[UIImage imageWithSolidColor:[UIColor wb_lineColor] size:CGSizeMake(MAINWIDTH, OnePixel())]];
    [[UITabBar appearance] setBackgroundImage:[UIImage imageWithSolidColor:[UIColor clearColor] size:CGSizeMake(MAINWIDTH, kTabBarHeight)]];*/
}

@interface WBTabBar ()
{
    UIEdgeInsets _oldSafeAreaInsets;
}
@end

@implementation WBTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _oldSafeAreaInsets = UIEdgeInsetsZero;
        /*
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        blurEffectView.frame = self.bounds;
        [[UITabBar appearance] insertSubview:blurEffectView atIndex:0];
         */
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _oldSafeAreaInsets = UIEdgeInsetsZero;
}

- (void)safeAreaInsetsDidChange {
    [super safeAreaInsetsDidChange];
    
    if (!UIEdgeInsetsEqualToEdgeInsets(_oldSafeAreaInsets, self.safeAreaInsets)) {
        [self invalidateIntrinsicContentSize];
        
        if (self.superview) {
            [self.superview setNeedsLayout];
            [self.superview layoutSubviews];
        }
    }
}

- (CGSize)sizeThatFits:(CGSize)size {
    size = [super sizeThatFits:size];
    
#ifdef __IPHONE_11_0
    if (@available(iOS 11.0, *)) {
        float bottomInset = self.safeAreaInsets.bottom;
        if (bottomInset > 0 && size.height < 50 && (size.height + bottomInset < 90)) {
            size.height += bottomInset;
        }
    }
#endif
    
    return size;
}


- (void)setFrame:(CGRect)frame {
    if (self.superview) {
        if (frame.origin.y + frame.size.height != self.superview.frame.size.height) {
            frame.origin.y = self.superview.frame.size.height - frame.size.height;
        }
    }
    [super setFrame:frame];
}

@end
