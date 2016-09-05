//
//  UIAlertController+Common.m
//  YYQ2
//
//  Created by SNW on 16/3/21.
//  Copyright © 2016年 Garry. All rights reserved.
//

#import "UIAlertController+Common.h"

@implementation UIAlertController (Common)
+(void)alertInController:(UIViewController *)controller title:(NSString *)title message:(NSString *)message confrimBtn:(NSString *)confrimBtn confrimStyle:(UIAlertActionStyle)confrimStyle confrimAction:(void (^)(void))confrimAction cancelBtn:(NSString *)cancelBtn cancelStyle:(UIAlertActionStyle)cancelStyle cancelAction:(void (^)(void))cancelAction{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    if (confrimBtn) {
        [alert addAction:[UIAlertAction actionWithTitle:confrimBtn style:confrimStyle handler:^(UIAlertAction * _Nonnull action) {
            if (confrimAction) confrimAction();
        }]];
    }
    if (cancelBtn) {
        [alert addAction:[UIAlertAction actionWithTitle:cancelBtn style:cancelStyle handler:^(UIAlertAction * _Nonnull action) {
            if (cancelAction) cancelAction();
        }]];
    }
    [controller presentViewController:alert animated:YES completion:nil];
}
@end
