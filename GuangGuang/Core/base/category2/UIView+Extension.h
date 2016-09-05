//
//  UIView+Extension.h
//  Toshow
//
//  Created by Garry on 15/7/28.
//  Copyright (c) 2015年 FAN LING. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGSize  size;
@property (nonatomic, assign) CGPoint origin;
//获得当前视图的视图控制器
-(UIViewController *)getCurrentViewController;
@end