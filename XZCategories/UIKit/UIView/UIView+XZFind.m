//
//  UIView+XZFind.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/17.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import "UIView+XZFind.h"

@implementation UIView (XZFind)

/**
 *  @brief  找到并且resign第一响应者
 *  @return 结果
 */
- (BOOL)xz_findAndResignFirstResponder
{
    if (self.isFirstResponder) {
        [self resignFirstResponder];
        return YES;
    }
    
    for (UIView *v in self.subviews) {
        if ([v xz_findAndResignFirstResponder]) {
            return YES;
        }
    }
    
    return NO;
}
/**
 *  @brief  找到第一响应者
 *  @return 第一响应者
 */
- (UIView *)xz_findFirstResponder
{
    if (([self isKindOfClass:[UITextField class]] || [self isKindOfClass:[UITextView class]])
        && (self.isFirstResponder)) {
        return self;
    }
    
    for (UIView *v in self.subviews) {
        UIView *fv = [v xz_findFirstResponder];
        if (fv) {
            return fv;
        }
    }
    
    return nil;
}

- (UIViewController *)xz_viewController {
    
    for (UIView *view = self; view; view = view.superview) {
        UIResponder *nextResponder = [view nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

@end
