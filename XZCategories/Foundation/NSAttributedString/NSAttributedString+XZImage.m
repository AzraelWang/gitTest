//
//  NSAttributedString+XZImage.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/11.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import "NSAttributedString+XZImage.h"

@implementation NSAttributedString (XZImage)

+ (NSAttributedString *)xz_attributedStringWithImage:(nonnull UIImage *)image
{
    if (image == nil) return nil;
    
    NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
    attachment.image = image;
    attachment.bounds = CGRectMake(0, -2, attachment.image.size.width, attachment.image.size.height); 
    return [NSAttributedString attributedStringWithAttachment:attachment];
}

+ (NSAttributedString *)xz_attributedStringWithImage:(nonnull UIImage *)image
                                              bounds:(CGRect)bounds
{
    if (image == nil) return nil;
    
    NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
    attachment.image = image;
    attachment.bounds = bounds;
    return [NSAttributedString attributedStringWithAttachment:attachment];
}

@end
