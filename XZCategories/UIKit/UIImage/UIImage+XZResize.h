//
//  UIImage+XZResize.h
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/17.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (XZResize)

/**
 *  裁切圆形图片(以图片的宽高较短的为直径，裁切图片的中间部分)
 */
- (UIImage *)xz_cutCircle;

/**
 *  裁切矩形
 */
- (UIImage *)xz_cutRectImageWithFrame:(CGRect)frame;

/**
 *  生成圆角矩形图片
 */
- (UIImage *)xz_imageWithRoundedCornersAndSize:(CGSize)sizeToFit andCornerRadius:(CGFloat)radius;

@end
