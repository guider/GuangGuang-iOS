//
//  UILabel+Common.m
//  YYQ2
//
//  Created by 郭锐 on 16/3/4.
//  Copyright © 2016年 Garry. All rights reserved.
//

#import "UILabel+Common.h"

@implementation UILabel (Common)
+(UILabel *)labelWithSize:(CGFloat)size textColor:(UIColor *)textColor{
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:size];
    label.textColor = textColor;
    return label;
}


- (void) textLeftTopAlign
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:12.f], NSParagraphStyleAttributeName:paragraphStyle.copy};
    CGSize labelSize = [self.text boundingRectWithSize:CGSizeMake(207, 999) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    
    CGRect dateFrame =CGRectMake(2, 140, CGRectGetWidth(self.frame)-5, labelSize.height);
    self.frame = dateFrame;
}


-(BOOL)canBecomeFirstResponder
{
    return YES;
}



@end
