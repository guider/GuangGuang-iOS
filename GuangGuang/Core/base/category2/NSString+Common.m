//
//  NSString+Common.m
//  YYQ2
//
//  Created by 郭锐 on 16/1/4.
//  Copyright © 2016年 Garry. All rights reserved.
//

#import "NSString+Common.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Common)
-(NSString *)md5{
    if ([self length] <= 0) return nil;
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}
-(BOOL)checkStringWithRegular:(NSString *)regular{
    if (!regular || [regular isEqualToString:@""]) {
        return [self length] ? YES : NO;
    }
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regular options:NSRegularExpressionCaseInsensitive error:nil];
    NSArray *array = [regex matchesInString:self options:0 range:NSMakeRange(0, self.length)];
    return [array count];
}
/**
 *    以base64格式进行归档
 */
-(NSString *)encodeBase64{
    NSData *Data = [self dataUsingEncoding:NSUTF8StringEncoding];
    Data = [GTMBase64 encodeData:Data];
    NSString *codestr = [[NSString alloc] initWithData:Data encoding:NSUTF8StringEncoding];
    return codestr;
}
-(NSString *)removeSpaces{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}
@end
