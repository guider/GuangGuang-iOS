//
//  NSDate+Common.h
//  YYQ2
//
//  Created by 郭锐 on 16/1/21.
//  Copyright © 2016年 Garry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Common)
+(NSString *)dateStringWithTimeStamp:(NSTimeInterval)timeStamp;
+(NSString *)durationStringWithTimeStamp:(NSTimeInterval)timeStamp;
+(NSString *)nowTimeStampString;
+(NSTimeInterval)currentTimeStamp;
@end
