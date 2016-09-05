//
//  UIAlertController+Common.h
//  YYQ2
//
//  Created by SNW on 16/3/21.
//  Copyright © 2016年 Garry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (Common)
+(void)alertInController:(UIViewController *)controller title:(NSString *)title message:(NSString *)message confrimBtn:(NSString *)confrimBtn confrimStyle:(UIAlertActionStyle)confrimStyle confrimAction:(void(^)(void))confrimAction cancelBtn:(NSString *)cancelBtn cancelStyle:(UIAlertActionStyle)cancelStyle cancelAction:(void(^)(void))cancelAction;
@end
