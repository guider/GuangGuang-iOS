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
// Created by apple on 16/9/6.
// Copyright (c) 2016 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"

typedef NS_ENUM(NSInteger, RequestMethod) {
    GET, POST
};

@interface HttpManager : AFHTTPSessionManager

+ (HttpManager *)shareInstance;

- (void)requestWith:(NSString *)path
             params:(id *)params
             method:(RequestMethod)method
          showError:(BOOL)showError
       showProgress:(BOOL)showProgress
          onSuccess:(void (^)(id result))success
             onFail:(void (^)(NSError *error))fail;

@end