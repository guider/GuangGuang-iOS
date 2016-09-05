//
//  UIImage+Common.h
//  YYQ2
//
//  Created by 郭锐 on 16/1/11.
//  Copyright © 2016年 Garry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Common)
+(UIImage *)imageWithColor:(UIColor *)aColor;
+(UIImage *)imageWithColor:(UIColor *)aColor withFrame:(CGRect)aFrame;
+(UIImage *)drawRoundRectImageWithColor:(UIColor *)color size:(CGSize)size;
+(void)clipMediaCenterThumbnail:(UIImage *)image isVideo:(BOOL)isVideo completion:(void (^)(UIImage *image))completion;
+(UIImage *)zoomWithImageNamed:(NSString *)imageNamed scale:(CGFloat)scale;
+(UIImage *)zoomWithImageNamed:(NSString *)imageNamed size:(CGSize)size;
@end
