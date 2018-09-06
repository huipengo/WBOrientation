//
//  WBTabBarItem.m
//  Fanstong
//
//  Created by penghui8 on 2018/4/17.
//  Copyright © 2018年 penghui. All rights reserved.
//

#import "WBTabBarItem.h"

@implementation WBTabBarItem

- (void)title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    self.title = title;
    self.image = [UIImage imageNamed:image];
    UIImage *imageHome = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self setSelectedImage:imageHome];
    // 设置 tabbarItem 选中状态下的文字颜色(不被系统默认渲染,显示文字自定义颜色)
//    NSDictionary *dictHome = [NSDictionary dictionaryWithObject:[UIColor orangeColor] forKey:NSForegroundColorAttributeName];
//    [controller.tabBarItem setTitleTextAttributes:dictHome forState:UIControlStateSelected];
}

@end
