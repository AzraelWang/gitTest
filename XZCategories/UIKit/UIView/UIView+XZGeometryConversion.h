//
//  UIView+XZGeometryConversion.h
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/16.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (XZGeometryConversion)

/// 将像素point由point所在视图转换到目标视图view中，返回在目标视图view中的像素值
- (CGPoint)xz_convertPoint:(CGPoint)point toViewOrWindow:(nullable UIView *)view;

/// 将像素point从view中转换到当前视图中，返回在当前视图中的像素值
- (CGPoint)xz_convertPoint:(CGPoint)point fromViewOrWindow:(nullable UIView *)view;

/// 将rect由rect所在视图转换到目标视图view中，返回在目标视图view中的rect
- (CGRect)xz_convertRect:(CGRect)rect toViewOrWindow:(nullable UIView *)view;

/// 将rect从view中转换到当前视图中，返回在当前视图中的rect
- (CGRect)xz_convertRect:(CGRect)rect fromViewOrWindow:(nullable UIView *)view;

@end

NS_ASSUME_NONNULL_END