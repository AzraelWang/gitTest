//
//  UIImage+XZResize.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/17.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import "UIImage+XZResize.h"

@implementation UIImage (XZResize)

/// 裁切圆形图片
- (UIImage *)xz_cutCircle
{
    CGFloat imageW = self.size.width;
    CGFloat imageH = self.size.height;
    CGFloat diameter = imageW < imageH ? imageW : imageH;// 直径
    CGSize imageSize = CGSizeMake(diameter, diameter);
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, [UIScreen mainScreen].scale);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGFloat radius = diameter * 0.5; // 半径
    CGFloat centerX = radius; // 圆心
    CGFloat centerY = radius;
    CGContextAddArc(ctx, centerX, centerY, radius, 0, M_PI * 2, 0);
    CGContextClip(ctx);
    CGRect drawRect = CGRectZero;
    if (imageW > imageH) {
        drawRect = CGRectMake(-(imageW - imageH)*0.5, 0, imageW, imageH);
    } else {
        drawRect = CGRectMake(0, -(imageH - imageW)*0.5, imageW, imageH);
    }
    [self drawInRect:drawRect];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

/// 裁切矩形
- (UIImage *)xz_cutRectImageWithFrame:(CGRect)frame
{
    UIGraphicsBeginImageContextWithOptions(frame.size, NO, [UIScreen mainScreen].scale);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect clipRect = (CGRect){{0, 0}, frame.size};
    CGContextAddRect(ctx, clipRect);
    CGContextClip(ctx);
    [self drawInRect:CGRectMake(-frame.origin.x,
                                -frame.origin.y,
                                self.size.width,
                                self.size.height)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


///生成圆角矩形图片
- (UIImage *)xz_imageWithRoundedCornersAndSize:(CGSize)sizeToFit andCornerRadius:(CGFloat)radius
{
    CGRect rect = (CGRect){0.f, 0.f, sizeToFit};
    
    UIGraphicsBeginImageContextWithOptions(sizeToFit, NO, UIScreen.mainScreen.scale);
    CGContextAddPath(UIGraphicsGetCurrentContext(),
                     [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius].CGPath);
    CGContextClip(UIGraphicsGetCurrentContext());
    
    [self drawInRect:rect];
    UIImage *output = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return output;
}

@end
