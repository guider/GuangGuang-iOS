//
//  UIImageView+QNCache.h
//  YYQ2
//
//  Created by 郭锐 on 16/1/5.
//  Copyright © 2016年 Garry. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CompleteBlock)(UIImage *image, NSURL * url, NSError *error);
typedef void(^LoadingProgress)(CGFloat);

@interface UIImageView (QNCache)
-(void)imageWithURL:(NSURL*)url;
-(void)imageWithURL:(NSURL*)url placeHolderImage:(UIImage *)placeHolderImage;
/**
 *  当图片加载完成后的回调函数
 */
-(void)imageWithURL:(NSURL*)url placeHolderImage:(UIImage *)placeHolderImage completion:(CompleteBlock)block;
@end
