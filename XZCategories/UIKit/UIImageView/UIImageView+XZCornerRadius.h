//
//  UIImageView+XZCornerRadius.h
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/15.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (XZCornerRadius)

/// 创建圆角半径为cornerRadius的UIImageView
- (instancetype)initWithCornerRadiusAdvance:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType;

/// 创建圆角半径为cornerRadius的UIImageView
- (void)xz_cornerRadiusAdvance:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType;

/// 创建圆形的UIImageView
- (instancetype)initWithRoundingRectImageView;

/// 创建圆形的UIImageView
- (void)xz_cornerRadiusRoundingRect;

/// 为UIImageView的图片附加边框
- (void)xz_attachBorderWidth:(CGFloat)width color:(UIColor *)color;

@end
