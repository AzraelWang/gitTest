//
//  NSAttributedString+XZBestSize.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/11.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import "NSAttributedString+XZBestSize.h"

@implementation NSAttributedString (XZBestSize)

- (CGSize)xz_sizeConstrainedToMaxSize:(CGSize)maxSize
{
    CGRect bounds = [self boundingRectWithSize:maxSize
                                       options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                       context:nil];
    return bounds.size;
}


- (CGSize)xz_sizeConstrainedToWidth:(CGFloat)width
{
    CGRect bounds = [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                       options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                       context:nil];
    return bounds.size;
}

- (CGSize)xz_sizeConstrainedToHeight:(CGFloat)height
{
    CGRect bounds = [self boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height)
                                       options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                       context:nil];
    return bounds.size;
}

- (CGFloat)xz_heightConstrainedToWidth:(CGFloat)width
{
    return [self xz_sizeConstrainedToWidth:width].height;
}

- (CGFloat)xz_widthConstrainedToHeight:(CGFloat)height
{
    return [self xz_sizeConstrainedToHeight:height].width;
}

@end
