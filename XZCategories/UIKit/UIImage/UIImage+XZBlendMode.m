//
//  UIImage+XZBlendMode.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/18.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import "UIImage+XZBlendMode.h"

@implementation UIImage (XZBlendMode)

- (UIImage *)xz_imageWithTintColor:(UIColor *)tintColor
{
    return [self xz_imageWithTintColor:tintColor blendMode:kCGBlendModeDestinationIn];
}

- (UIImage *)xz_imageWithGradientTintColor:(UIColor *)tintColor
{
    return [self xz_imageWithTintColor:tintColor blendMode:kCGBlendModeOverlay];
}

- (UIImage *)xz_imageWithTintColor:(UIColor *)tintColor blendMode:(CGBlendMode)blendMode
{
    // NO - keep alpha, 0.0f - 使用设备scale
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    [tintColor setFill];
    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(bounds);
    
    [self drawInRect:bounds blendMode:blendMode alpha:1.0f];
    
    if (blendMode != kCGBlendModeDestinationIn) {
        [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0f];
    }
    
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return tintedImage;
}

@end
