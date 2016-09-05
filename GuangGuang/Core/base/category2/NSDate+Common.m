//
//  NSDate+Common.m
//  YYQ2
//
//  Created by 郭锐 on 16/1/21.
//  Copyright © 2016年 Garry. All rights reserved.
//

#import "NSDate+Common.h"

@implementation NSDate (Common)
+(NSString *)dateStringWithTimeStamp:(NSTimeInterval)timeStamp{
    if (!timeStamp) {
        return @"";
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY年MM月dd日"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    return [formatter stringFromDate:date];
}

+(NSString *)durationStringWithTimeStamp:(NSTimeInterval)timeStamp{
    if (!timeStamp) {
        return @"";
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"mm:ss"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    return [formatter stringFromDate:date];
}
+(NSString *)nowTimeStampString{
    return [NSString stringWithFormat:@"%lf",[[NSDate date] timeIntervalSince1970]];
}
+(NSTimeInterval)currentTimeStamp{
    return [[NSDate date] timeIntervalSince1970];
}
@end
