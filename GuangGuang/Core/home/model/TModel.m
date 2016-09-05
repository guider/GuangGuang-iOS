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

#import "TModel.h"


@implementation TModel {

}

- (instancetype)initWithDict:(NSDictionary *)dict {
    return nil;
}

+ (instancetype)getInstance:(NSDictionary *)dict {
    return nil;
}

- (instancetype)initWithName:(NSString *)name and:(NSString *)cloumn and:(NSString *)icon {
    if (self = [super init]){
        self.name = name;
        self.cloumn =cloumn;
        self.icon =icon;
    }

    return self;
}

+ (instancetype)getInstance:(NSString *)name and:(NSString *)cloumn and:(NSString *)icon {
    return [[self alloc] initWithName:name and :cloumn and :icon];
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
    [description appendFormat:@"self.name=%@", self.name];
    [description appendFormat:@", self.cloumn=%@", self.cloumn];
    [description appendFormat:@", self.icon=%@", self.icon];
    [description appendString:@">"];
    return description;
}


@end