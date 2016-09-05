//
//  UIBarButtonItem+CustomItem.m
//  YYQ2
//
//  Created by 郭锐 on 16/1/12.
//  Copyright © 2016年 Garry. All rights reserved.
//

#import "UIBarButtonItem+Custom.h"

@implementation UIBarButtonItem (Custom)
+(UIBarButtonItem *)backBarItemWithAction:(void (^)(void))action{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:[UIImage imageNamed:@"btn_nav_back"] forState:UIControlStateNormal];
    [backButton sizeToFit];
    [backButton bk_addEventHandler:^(id sender) {
        if (action) action();
    } forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    return backItem;
}
+(UIBarButtonItem *)barItemWithTitle:(NSString *)title action:(void (^)(void))action{
    UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [titleButton setTitle:title forState:UIControlStateNormal];
    [titleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    titleButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [titleButton sizeToFit];
    [titleButton bk_addEventHandler:^(id sender) {
        if (action) action();
    } forControlEvents:UIControlEventTouchUpInside];
    
    [titleButton setTitleColor:[UIColor colorWithHex:0xFFFFFF alpha:0.5] forState:UIControlStateHighlighted];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:titleButton];
    return leftItem;
}
+(UIBarButtonItem *)barItemWithIco:(NSString *)ico action:(void (^)(void))action{
    UIButton *icoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [icoButton setImage:[UIImage imageNamed:ico] forState:UIControlStateNormal];
    [icoButton sizeToFit];
    [icoButton bk_addEventHandler:^(id sender) {
        if (action) action();
    } forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *icoItem = [[UIBarButtonItem alloc] initWithCustomView:icoButton];
    return icoItem;
}
@end
