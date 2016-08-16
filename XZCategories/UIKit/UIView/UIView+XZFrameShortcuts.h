//
//  UIView+XZFrameShortcuts.h
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/16.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XZFrameShortcuts)

@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

@property (nonatomic) CGPoint origin;
@property (nonatomic) CGSize size;

@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;

- (CGFloat)left;
- (CGFloat)top;
- (CGFloat)bottom;
- (CGFloat)right;

- (void)setX:(CGFloat)x;
- (void)setY:(CGFloat)y;
- (void)setWidth:(CGFloat)width;
- (void)setHeight:(CGFloat)height;

- (void)setLeft:(CGFloat)left;
- (void)setTop:(CGFloat)top;

- (void)setCenterX:(CGFloat)centerX;
- (void)setCenterY:(CGFloat)centerY;

- (void)setOrigin:(CGPoint)origin;
- (void)setSize:(CGSize)size;

- (void)centerXEqualToView:(UIView *)view;
- (void)centerYEqualToView:(UIView *)view;
- (void)heightEqualToView:(UIView *)view;
- (void)widthEqualToView:(UIView *)view;
- (void)sizeEqualToView:(UIView *)view;

// imbueset
- (void)fillWidth;
- (void)fillHeight;
- (void)fill;


@property (nonatomic, readonly) UIView *xz_topSuperView;

@property (nonatomic, readonly) UIViewController *xz_viewController;


@end
