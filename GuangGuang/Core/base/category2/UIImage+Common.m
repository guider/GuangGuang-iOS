//
//  UIImage+Common.m
//  YYQ2
//
//  Created by 郭锐 on 16/1/11.
//  Copyright © 2016年 Garry. All rights reserved.
//

#import "UIImage+Common.h"

@implementation UIImage (Common)
+(UIImage *)imageWithColor:(UIColor *)aColor{
    return [UIImage imageWithColor:aColor withFrame:CGRectMake(0, 0, 1, 1)];
}

+(UIImage *)imageWithColor:(UIColor *)aColor withFrame:(CGRect)aFrame{
    UIGraphicsBeginImageContext(aFrame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [aColor CGColor]);
    CGContextFillRect(context, aFrame);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}
+ (UIImage *)drawRoundRectImageWithColor:(UIColor *)color size:(CGSize)size{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    //去锯齿处理
    CGContextSetAllowsAntialiasing(context, true);
    CGContextSetShouldAntialias(context, true);
    CGContextSetFillColorWithColor(context, [color CGColor]);
    //切圆角
    [[UIBezierPath bezierPathWithRoundedRect:rect
                                cornerRadius:5] addClip];
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
+(void)clipMediaCenterThumbnail:(UIImage *)image isVideo:(BOOL)isVideo completion:(void (^)(UIImage *))completion{
    dispatch_async( dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        CGFloat imageWidth  = isVideo ? (kScreen_Width - 15) / 2 : (kScreen_Width - 25) / 4;
        CGFloat imageHeight = isVideo ? (kScreen_Width - 15) / 4 : (kScreen_Width - 25) / 4;
        CGRect rect = CGRectMake(0, 0, imageWidth,imageHeight);
        
        UIGraphicsBeginImageContextWithOptions(rect.size, NO, image.scale);
        
        [[UIBezierPath bezierPathWithRoundedRect:rect
                                    cornerRadius:4] addClip];
        [image drawInRect:rect];
        
        if (isVideo) {
            [[UIImage drawRoundRectImageWithColor:[UIColor colorWithHex:0x000000 alpha:0.15] size:rect.size] drawInRect:rect];
        }
        
        UIImage *roundedImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        dispatch_async( dispatch_get_main_queue(), ^{
            if (completion) {
                completion(roundedImage);
            }
        });
    });
}
+(UIImage *)zoomWithImageNamed:(NSString *)imageNamed scale:(CGFloat)scale{
    UIImage *image = [UIImage imageNamed:imageNamed];
    CGSize size = CGSizeMake(image.size.width * scale, image.size.height *scale);
    return [UIImage image:image size:size];
}
+(UIImage *)zoomWithImageNamed:(NSString *)imageNamed size:(CGSize)size{
    UIImage *image = [UIImage imageNamed:imageNamed];
    return [UIImage image:image size:size];
}
+(UIImage *)image:(UIImage *)image size:(CGSize)size{
    CGFloat screenScale = [[UIScreen mainScreen] scale];
    if(screenScale != 1.0){
        UIGraphicsBeginImageContextWithOptions(size, NO, screenScale);
    }else{
        UIGraphicsBeginImageContext(size);
    }
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}
@end
