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

#import <Foundation/Foundation.h>


@interface TModel : NSObject

@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *cloumn;
@property(nonatomic, copy) NSString *icon;



-(instancetype) initWithDict:(NSDictionary *)dict;
+(instancetype) getInstance:(NSDictionary *)dict;
@end