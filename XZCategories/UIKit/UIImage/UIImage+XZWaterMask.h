//
//  UIImage+XZWaterMask.h
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/17.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (XZWaterMask)



- (UIImage *)xz_addImage:(UIImage*)image toImageInRect:(CGRect)rect;

- (UIImage *)xz_addImageToImageCenter:(UIImage*)image;

@end
