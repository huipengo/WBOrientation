//
//  WBHomeViewController.m
//  WBOrientation_Example
//
//  Created by penghui8 on 2018/9/6.
//  Copyright © 2018年 彭辉. All rights reserved.
//

#import "WBHomeViewController.h"
#import "WBAutorotateViewController.h"

@interface WBHomeViewController ()

@end

@implementation WBHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)autorotateAction:(id)sender {
    WBAutorotateViewController *viewController = [WBAutorotateViewController new];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
