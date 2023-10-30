//
//  HYUkVideoBaseViewController.m
//  HYVideoSDK_Example
//
//  Created by oceanMAC on 2023/3/31.
//  Copyright © 2023 admin@buzzmsg.com. All rights reserved.
//

#import "HYUkVideoBaseViewController.h"
#import <HYText/YYText.h>
#import "UIColor+UkPublicUse.h"
#import "UIImage+uk_bundleImage.h"

@interface HYUkVideoBaseViewController ()<UIGestureRecognizerDelegate>

@end

@implementation HYUkVideoBaseViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
    self.tabBarController.tabBar.hidden = YES;
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
        self.navigationController.interactivePopGestureRecognizer.delegate = self;
    }
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [UIView animateWithDuration:0.2 animations:^{
        self.navigationController.view.transform = CGAffineTransformMakeRotation(0);
        [[UIApplication sharedApplication] setStatusBarHidden:false];
    }];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    
    if ([self.navigationController.viewControllers count] == 1) {
        return NO;
    }else{
        return YES;
    }
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor bgColorFF];
    
    [self initSubviews];
    [self initData];

}

- (void)initData
{
}
- (void)initSubviews {
    
}
#pragma mark 懒加载
-(UIView *)navBar {
    
    if (!_navBar) {
        _navBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, NAV_HEIGHT)];
        _navBar.backgroundColor = [UIColor mainColor];
        [self.view addSubview:_navBar];
    }
    return _navBar;
}

-(UILabel *)navTitleLabel {
    if (!_navTitleLabel) {
        _navTitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
//        _navTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, IS_IPAD ? 48 : (IS_iPhoneX?48:24), SCREEN_WIDTH, 40)];
        _navTitleLabel.textColor = [UIColor bgColorFF];
        _navTitleLabel.font = [UIFont boldSystemFontOfSize:IS_IPAD ? 24 : 17];
        _navTitleLabel.textAlignment = NSTextAlignmentCenter;
        [self.navBar addSubview:_navTitleLabel];
        
        [_navTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.navBar.mas_bottom).offset(-4);
            make.width.mas_offset(300);
            make.height.mas_offset(40);
            make.centerX.equalTo(self.navBar);
        }];
    }
    return _navTitleLabel;
}

-(UIButton *)navBackButton {
    if (!_navBackButton) {
        _navBackButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        _navBackButton.frame = CGRectMake(0, IS_IPAD ? 48 : (IS_iPhoneX?48:24), 40, 40);
        [_navBackButton addTarget:self action:@selector(clickedBackButton:) forControlEvents:UIControlEventTouchUpInside];
        [_navBackButton setImage:[UIImage uk_bundleImage:@"p_back"] forState:UIControlStateNormal];
        [self.navBar addSubview:_navBackButton];
        
        [_navBackButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.navBar.mas_bottom).offset(-4);
            make.height.width.mas_offset(40);
            make.left.equalTo(self.navBar.mas_left).offset(0);
        }];
    }
    return _navBackButton;
}

- (UIImageView *)bgImageView {
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH)];
        _bgImageView.image = [UIImage uk_bundleImage:@"uk_bg_Img"];
        _bgImageView.contentMode = UIViewContentModeScaleAspectFill;
        [self.view addSubview:self.bgImageView];
        [self.view sendSubviewToBack:self.bgImageView];
    }
    return _bgImageView;
}

-(void)clickedBackButton:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
