//
//  WBAutorotateViewController.m
//  WBOrientation_Example
//
//  Created by penghui8 on 2018/9/6.
//  Copyright © 2018年 彭辉. All rights reserved.
//

#import "WBAutorotateViewController.h"
#import "WBAppDelegate.h"
#import <WBOrientation/WBDeviceOrientation.h>
#import "WVMHUD.h"

@interface WBAutorotateViewController ()

@property (nonatomic, assign) UIInterfaceOrientation orientation;

@end

@implementation WBAutorotateViewController

- (void)dealloc {
    NSLog(@"%s", __func__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.orientation = UIInterfaceOrientationPortrait;
    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(orientationChange:)
//                                                 name:UIDeviceOrientationDidChangeNotification
//                                               object:nil];
}

//- (void)orientationChange:(NSNotification *)notification {
//    [WVMHUD show:[NSString stringWithFormat:@"orientationChange"]];
//    CGSize size = [UIScreen mainScreen].bounds.size;
//    [WVMHUD show:[NSString stringWithFormat:@"orientationChange %f, %f", size.width, size.height]];
//}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    NSString *message = nil;
    if (size.width < size.height) {
        message = @"竖屏";
    } else if (size.width > size.height) {
        message = @"横屏";
    }
    
    // 翻转的时间
    CGFloat duration = [coordinator transitionDuration];
        
    [UIView animateWithDuration:duration animations:^{
        
    } completion:^(BOOL finished) {
        CGSize _size = [UIScreen mainScreen].bounds.size;
        [WVMHUD show:[NSString stringWithFormat:@"viewWillTransitionToSize %f, %f, %@, %f, %f", size.width, size.height, message, _size.width, _size.height]];
    }];
}

- (IBAction)rotateAction:(id)sender {
    UIInterfaceOrientation orientation;
    if ([self isLandscape]) {
        orientation = UIInterfaceOrientationPortrait;
    } else {
        orientation = UIInterfaceOrientationLandscapeRight;
    }
    
    self.orientation = orientation;
    WBAppDelegate *delegate = [WBAppDelegate appDelegate];
    delegate.orientation = orientation;
    
    [WBDeviceOrientation interfaceOrientation:orientation viewController:self];
}

// MARK: 是否是横屏
- (BOOL)isLandscape {
    return CGRectGetWidth(self.view.frame) > CGRectGetHeight(self.view.frame);
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    UIInterfaceOrientationMask orientationMask = [self interfaceOrientationMask:self.orientation];
    return orientationMask;
}

- (UIInterfaceOrientationMask)interfaceOrientationMask:(UIInterfaceOrientation)orientation {
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

@end
