//
//  RETableViewCustomOptionsController.m
//  YiCeTong
//
//  Created by youyoujushi on 15/9/29.
//  Copyright (c) 2015年 cellcom. All rights reserved.
//

#import "RETableViewCustomOptionsController.h"

@interface RETableViewCustomOptionsController ()

@end

@implementation RETableViewCustomOptionsController

- (void)viewDidLoad {
    [super viewDidLoad];

}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    CGRect rect = self.tableView.frame;
    rect.origin.y       = NAVBAR_BOTTOM;
    rect.size.height    = SCREEN_HEIGHT - NAVBAR_BOTTOM;
    self.tableView.frame = rect;
    
    UIView *bgView = [[UIView alloc]initWithFrame:SCREEN_RECT];
    
    //创建导航栏背景视图
    UIImageView *navBarBgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH, NAVBAR_BOTTOM)];
    navBarBgView.image  =   [UIImage imageNamed:@"nav_bgImg"];
    navBarBgView.userInteractionEnabled = YES;
    
    //标题视图
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, STATUSBAR_HEIGHT, SCREEN_WIDTH,NAVBAR_HEIGHT)];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment    = NSTextAlignmentCenter;
    titleLabel.text             = _titleText;
    
    //返回按钮
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(5, 27, 20, 30)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"ic_back"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backBarClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [navBarBgView addSubview:titleLabel];
    [navBarBgView addSubview:backBtn];
    [bgView addSubview:navBarBgView];
    [bgView addSubview:self.tableView];
    self.view   =   bgView;

    self.tableView.sectionHeaderHeight = 10;
    [self.tableView reloadData];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}


- (void)backBarClicked:(UIButton*)btn{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
