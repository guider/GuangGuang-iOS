//
//  UIBarButtonItem+Custom.h
//  YYQ2
//
//  Created by 郭锐 on 16/1/12.
//  Copyright © 2016年 Garry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (CustomItem)
+(UIBarButtonItem *)backBarItemWithAction:(void(^)(void))action;
+(UIBarButtonItem *)barItemWithTitle:(NSString *)title action:(void (^)(void))action;
+(UIBarButtonItem *)barItemWithIco:(NSString *)ico action:(void (^)(void))action;
@end
