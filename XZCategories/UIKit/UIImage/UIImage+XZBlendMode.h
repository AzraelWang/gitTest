//
//  UIImage+XZBlendMode.h
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/18.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (XZBlendMode)

/// 以tintColor来混合当前图片（不保留灰度信息）
- (UIImage *)xz_imageWithTintColor:(UIColor *)tintColor;

/// 以tintColor来混合当前图片（保留灰度信息）
- (UIImage *)xz_imageWithGradientTintColor:(UIColor *)tintColor;

@end
