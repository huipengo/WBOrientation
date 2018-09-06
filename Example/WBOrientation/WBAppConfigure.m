//
//  WBAppConfigure.m
//  WBOrientation_Example
//
//  Created by penghui8 on 2018/9/6.
//  Copyright © 2018年 彭辉. All rights reserved.
//

#import "WBAppConfigure.h"

#import "WBHomeViewController.h"
#import "WBTabBar.h"
#import "WBTabBarItem.h"

@implementation WBAppConfigure

/**
 tabbar控制器
 
 @return tabbar控制器
 */
UITabBarController * _Nonnull wb_tabBarController() {
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        wb_configureTabBarAppearence();
    });
    
    wb_valueForTabBarController(tabBarController);
    
    tabBarController.viewControllers = wb_tabBarViewControllers();
    
    return tabBarController;
}

NSArray<WBBaseViewController *> * _Nonnull wb_tabBarViewControllers() {
    // 主页
    WBHomeViewController *viewController0 = [[WBHomeViewController alloc] init];
    UINavigationController *nav0 = [[UINavigationController alloc] initWithRootViewController:viewController0];
    WBTabBarItem *tabBar0 = WBTabBarItem.new;
    [tabBar0 title:@"主页" image:@"wb_tabbar_home" selectedImage:@"wb_tabbar_home_selected"];
    nav0.tabBarItem = tabBar0;
    
    WBHomeViewController *viewController1 = [[WBHomeViewController alloc] init];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:viewController1];
    WBTabBarItem *tabBar1 = WBTabBarItem.new;
    [tabBar1 title:@"主页" image:@"wb_tabbar_home" selectedImage:@"wb_tabbar_home_selected"];
    nav1.tabBarItem = tabBar1;
    
    NSArray *vcArray = @[nav0, nav1];
    return vcArray;
}

@end
