//
//  NSObject+CheckNetWork.m
//  YYQ2
//
//  Created by 郭锐 on 16/1/4.
//  Copyright © 2016年 Garry. All rights reserved.
//

#import "NSObject+Info.h"
#import <SystemConfiguration/SystemConfiguration.h>
#import "AppDelegate.h"
#import <sys/utsname.h>

@implementation NSObject (Info)
/**
 *  获取设备信息
 */
+ (NSString *)deviceInfo{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *model = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    NSString *version = [[UIDevice currentDevice] systemVersion];
    return [NSString stringWithFormat:@"iPhone_%@_%@",model,version];
}
/**
 *  获取当前版本
 */
+ (NSString *)currentVersion{
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    return [NSString stringWithFormat:@"%@_%@_ios",infoDic[@"CFBundleShortVersionString"],infoDic[@"CFBundleVersion"]];
}
@end
