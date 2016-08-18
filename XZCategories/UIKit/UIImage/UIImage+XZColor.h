//
//  UIImage+XZColor.h
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/17.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (XZColor)

/// 用上下文生成颜色为color的图片
+ (UIImage *)xz_createImageWithColor:(UIColor *)color size:(CGSize)size;

@end
