//
//  WVMHUD.m
//  WBLiveBox
//
//  Created by 刘洋洋 on 2018/7/24.
//  Copyright © 2018年 58. All rights reserved.
//

#import "WVMHUD.h"
#import "WVMRProgressHUD.h"


static inline void dispatch_main_wvm_hud_async_safe(void (^ _Nullable block)(void)) {
    if (dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL) == dispatch_queue_get_label(dispatch_get_main_queue())) {
        if (block) { block(); }
    } else {
        dispatch_async(dispatch_get_main_queue(), block);
    }
}


@interface WVMHUD ()

@property (nonatomic, strong) WVMRProgressHUD *hudProgress;

@end

@implementation WVMHUD

+ (instancetype)HUD {
    static WVMHUD *s_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s_instance = [[self alloc] init];
    });
    
    return s_instance;
}

+ (void)showHUDInView:(UIView *)view
              message:(NSString *)message
             duration:(NSTimeInterval)duration
             animated:(BOOL)animated
              complete:(void(^)(void))complete {
    [self showHUDInView:view message:message duration:duration animated:YES dissabled:NO complete:complete];
}

+ (void)showHUDInView:(UIView *)view
              message:(NSString *)message
             duration:(NSTimeInterval)duration
             animated:(BOOL)animated
            dissabled:(BOOL)dissabled
             complete:(void(^)(void))complete
{
	if (message == nil ) { return; }
	if (!view) {
		view = [UIApplication sharedApplication].keyWindow;
	}
    
    if (view == nil) {
        NSLog(@"hud view must not be nil.");
        return;
    }
    
	dispatch_main_wvm_hud_async_safe(^{
        WVMRProgressHUD *hud = [WVMRProgressHUD showHUDAddedTo:view animated:YES];
        hud.bezelView.style = WVMRProgressHUDBackgroundStyleSolidColor;
        hud.bezelView.color = [UIColor colorWithWhite:0.f alpha:0.86];
        hud.contentColor = UIColor.whiteColor;
		hud.label.text = message;
		hud.label.numberOfLines = 0;
		hud.mode = WVMRProgressHUDModeText;
		hud.margin = 10.f;
        hud.userInteractionEnabled = dissabled;
		hud.removeFromSuperViewOnHide = YES;
		hud.completionBlock = ^{
			if (complete) {
				complete();
			}
		};
		[hud hideAnimated:animated afterDelay:duration];
	});
}

+ (void)show:(NSString *)message
{
    [self show:message inView:nil];
}

+ (void)show:(NSString * _Nullable)message inView:(UIView * _Nullable)view {
    [self showHUDInView:view message:message duration:2.0 animated:YES dissabled:NO complete:nil];
}

+ (void)hide:(BOOL)animated
{
    [self hideInView:nil animated:animated];
}

+ (void)hideInView:(UIView *)view animated:(BOOL)animated
{
    if (!view) {
        view = [UIApplication sharedApplication].keyWindow;
    }
    
    [WVMRProgressHUD hideHUDForView:view animated:animated];
}

- (void)showInView:(UIView *)view message:(NSString *)message progress:(CGFloat)progress
{
	__block UIView *inView = view;
    dispatch_main_wvm_hud_async_safe(^{
		if (!inView) {
            inView = [UIApplication sharedApplication].keyWindow;
		}
		
		if (!self.hudProgress) {
			self.hudProgress = [[WVMRProgressHUD alloc] initWithView:inView];
			self.hudProgress.removeFromSuperViewOnHide = YES;
			self.hudProgress.label.text = message;
			self.hudProgress.mode = WVMRProgressHUDModeAnnularDeterminate;
			[view addSubview:self.hudProgress];
			[self.hudProgress showAnimated:YES];
		}
		
		self.hudProgress.progress = progress;
	});
}

- (void)resetProgress
{
    self.hudProgress = nil;
}

@end
