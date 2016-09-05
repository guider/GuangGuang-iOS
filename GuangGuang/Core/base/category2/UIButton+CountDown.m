//
//  UIButton+CountDown.m
//  YYQ2
//
//  Created by 郭锐 on 16/1/13.
//  Copyright © 2016年 Garry. All rights reserved.
//

#import "UIButton+CountDown.h"

static char kTimer;

@implementation UIButton (CountDown)
-(void)startCountDown{
    NSString *title = self.titleLabel.text;
    int time_ = 60;
    __block int _timeout = time_;
    @weakify(self);
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    objc_setAssociatedObject(self, &kTimer, _timer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        @strongify(self);
        if(_timeout <= 0){
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setTitle:title forState:UIControlStateNormal];
                self.userInteractionEnabled = YES;
            });
        }else{
            int seconds = (_timeout) % (time_ + 1);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setTitle:[NSString stringWithFormat:@"%.2ds后重试", seconds] forState:UIControlStateNormal];
                self.userInteractionEnabled = NO;
            });
            _timeout --;
        }
    });
    dispatch_resume(_timer);
}
-(void)endTimer{
    dispatch_source_t _timer = objc_getAssociatedObject(self, &kTimer);
    if (_timer) {
        dispatch_source_cancel(_timer);
    }
}
@end
