//
//  UIControl+XZTouchArea.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/16.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import "UIControl+XZTouchArea.h"
#import <objc/runtime.h>

@implementation UIControl (XZTouchArea)

- (UIEdgeInsets)xz_touchAreaInsets{
    return [objc_getAssociatedObject(self, @selector(xz_touchAreaInsets)) UIEdgeInsetsValue];
}

- (void)setXz_touchAreaInsets:(UIEdgeInsets)xz_touchAreaInsets{
    objc_setAssociatedObject(self, @selector(xz_touchAreaInsets), [NSValue valueWithUIEdgeInsets:xz_touchAreaInsets], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    CGRect bounds = UIEdgeInsetsInsetRect(self.bounds, self.xz_touchAreaInsets);
    return CGRectContainsPoint(bounds, point);
}

@end
