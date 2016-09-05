//
//  UIImageView+QNCache.m
//  YYQ2
//
//  Created by 郭锐 on 16/1/5.
//  Copyright © 2016年 Garry. All rights reserved.
//

#import "UIImageView+QNCache.h"
#import "EGOCache.h"
#import "NSString+Common.h"
#import "UIView+WebCacheOperation.h"
#import "SDWebImageDownloader.h"
#import "UIView+WebCacheOperation.h"

#define kImageCacheTimeoutValue 5.0f

@implementation UIImageView (QNCache)

-(void)imageWithURL:(NSURL *)url{
    [self imageWithURL:url placeHolderImage:nil completion:nil];
}
-(void)imageWithURL:(NSURL *)url placeHolderImage:(UIImage *)placeHolderImage{
    [self imageWithURL:url placeHolderImage:placeHolderImage completion:nil];
}
-(void)imageWithURL:(NSURL *)url placeHolderImage:(UIImage *)placeHolderImage completion:(CompleteBlock)block{
    self.image = nil;
    [self sd_cancelCurrentImageLoad];
    self.image = placeHolderImage;
    if (!url || [url.absoluteString isEqualToString:@""]) {
        return;
    }
    
    UIImage *image = [[EGOCache globalCache] imageForKey:[self imageCacheNameWithURL:url]];
    if (image) {
        if (block) block(image,url,nil);
        self.image = image;
        //        if ([[self.window.rootViewController.childViewControllers.lastObject class] isEqual:@"YYQBoardViewController"]) {
        //            [[NSNotificationCenter defaultCenter]postNotificationName:kNotificationImageHeight object:self];
        //  }
        return;
    }
    
    __weak typeof(self)weakSelf = self;
    id <SDWebImageOperation> operation = [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:url options:SDWebImageDownloaderHighPriority progress:^(NSInteger receivedSize, NSInteger expectedSize) {
    } completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
        __strong UIImageView *strongSelf = weakSelf;
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                if (block) block(nil,url,error);
                return;
            }
            if (image) {
                self.image = image;
                [strongSelf setNeedsLayout];
                
            }
            if (block && finished) {
                block(image, url, error);
            }
        });
        /**
         *  EGOCache缓存存储
         */
        [[EGOCache globalCache] setImage:image forKey:[self imageCacheNameWithURL:url]];
        /**
         *  发出通知 重新布局imageView
         */
        [[NSNotificationCenter defaultCenter]postNotificationName:kNotificationImageHeight object:self];
    }];
    if (operation) {
        [self sd_setImageLoadOperation:operation forKey:@"UIImageViewImageLoad"];
    }
}
- (void)sd_cancelCurrentImageLoad {
    [self sd_cancelImageLoadOperationWithKey:@"UIImageViewImageLoad"];
}
-(NSString *)imageCacheNameWithURL:(NSURL *)URL{
    NSString *urlString = [URL absoluteString];
    NSString *cacheUrl = ([[urlString componentsSeparatedByString:@"&e="] count] == 2) ? [[urlString componentsSeparatedByString:@"&e="] firstObject] : [[urlString componentsSeparatedByString:@"?e="] firstObject];
    return [cacheUrl md5];
}
@end
