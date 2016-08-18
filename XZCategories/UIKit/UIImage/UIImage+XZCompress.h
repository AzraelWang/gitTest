//
//  UIImage+XZCompress.h
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/17.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (XZCompress)
/**
 *  按质量图片压缩
 *  @scale 图片压缩比例 0~1;
 */
- (UIImage *)xz_compressWithScale:(CGFloat)scale;

/**
 *  按尺寸图片压缩
 *  @size  图片尺寸;
 */
- (UIImage *)xz_compressWithSize:(CGSize)size;
@end