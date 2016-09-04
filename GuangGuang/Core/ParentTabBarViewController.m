//
//
//                            _ooOoo_
//                           o8888888o
//                           88" . "88
//                           (| -_- |)
//                            O\ = /O
//                        ____/`---'\____
//                      .   ' \\| |// `.
//                       / \\||| : |||// \
//                     / _||||| -:- |||||- \
//                       | | \\\ - /// | |
//                     | \_| ''\---/'' | |
//                      \ .-\__ `-` ___/-. /
//                   ___`. .' /--.--\ `. . __
//                ."" '< `.___\_<|>_/___.' >'"".
//               | | : `- \`.;`\ _ /`;.`/ - ` : | |
//                 \ \ `-. \_ __\ /__ _/ .-` / /
//         ======`-.____`-.___\_____/___.-`____.-'======
//                            `=---='
//
//                  佛祖保佑             永无BUG
//         .............................................
//
//
//  YYQSplashViewController.h
//  YYQ-Broker-iOS
//
//   github https://github.com/guider
//

//
// Created by apple on 16/9/3.
// Copyright (c) 2016 apple. All rights reserved.
//

#import "ParentTabBarViewController.h"
#import "HomeViewController.h"
#import "HotViewController.h"
#import "ForeignViewController.h"

@interface ParentTabBarViewController ()
@end

@implementation ParentTabBarViewController {

}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initChild];

}

- (void)initChild {
    [self addController:[HomeViewController new] title:@"首页" normalImage:@"tabbar_home" selectImage:@"tabbar_home_select"];
    [self addController:[ForeignViewController new] title:@"海淘" normalImage:@"tabbar_abroad.png" selectImage:@"tabbar_abroad_select.png"];
    [self addController:[HotViewController new] title:@"热门" normalImage:@"tabbar_rank.png" selectImage:@"tabbar_home_select.png"];
    [self addController:[HomeViewController new] title:@"我" normalImage:@"tabbar_home.png" selectImage:@"tabbar_home_select.png"];
}

- (void)addController:(HomeViewController *)home title:(NSString *)title normalImage:(NSString *)image selectImage:(NSString *)image1 {
    home.tabBarItem.title = title;
    home.tabBarItem.image = [UIImage imageNamed:image];
    home.tabBarItem.selectedImage = [UIImage imageNamed:image1];
    [self addChildViewController:home];
    // 设置文字正常状态属性
//    NSDictionary *textAttrNormal = @{NSForegroundColorAttributeName : [UIColor colorWithHexString: WTNormalColor]};
    //[vc.tabBarItem setTitleTextAttributes: textAttrNormal forState: UIControlStateNormal];

    // 设置文字选中状态下属性
    //NSDictionary *textAttrSelected = @{NSForegroundColorAttributeName : [UIColor orangeColor]};
    //[vc.tabBarItem setTitleTextAttributes: textAttrSelected forState: UIControlStateSelected];}
}

@end