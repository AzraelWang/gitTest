//
//  UIImage+XZWaterMask.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/17.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import "UIImage+XZWaterMask.h"

@implementation UIImage (XZWaterMask)

- (UIImage *)xz_addImageToImageCenter:(UIImage*)image{
    
    CGFloat x = (self.size.width - image.size.width) * 0.5;
    CGFloat y = (self.size.height - image.size.height) * 0.5;
    CGRect rect = CGRectMake(x, y, image.size.width, image.size.height);
    return [self xz_addImage:image toImageInRect:rect];
}


- (UIImage *)xz_addImage:(UIImage*)image toImageInRect:(CGRect)rect
{
    UIGraphicsBeginImageContextWithOptions([self size], NO, 0.0);
    //原图
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    //水印图
    [image drawInRect:rect];
    UIImage *newPic = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newPic;
}

@end
