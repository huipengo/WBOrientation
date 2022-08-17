//
//  WBAppDelegate.h
//  WBOrientation
//
//  Created by 彭辉 on 09/06/2018.
//  Copyright (c) 2018 彭辉. All rights reserved.
//

@import UIKit;

@interface WBAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow * _Nullable window;

//@property (nonatomic, assign) UIInterfaceOrientationMask orientation;
@property (nonatomic, assign) UIInterfaceOrientation orientation;

+ (WBAppDelegate * _Nonnull)appDelegate;

@end
