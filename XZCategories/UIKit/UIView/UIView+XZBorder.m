//
//  UIView+XZBorder.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/16.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import "UIView+XZBorder.h"

@implementation UIView (XZBorder)

- (void)addBorderWithColor:(UIColor *)borderColor width:(CGFloat)borderWidth
{
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = borderWidth;
}

@end
