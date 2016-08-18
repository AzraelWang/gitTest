//
//  UIScrollView+XZExtension.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/17.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import "UIScrollView+XZExtension.h"

@implementation UIScrollView (XZExtension)
- (void)setXz_insetTop:(CGFloat)xz_insetT
{
    UIEdgeInsets inset = self.contentInset;
    inset.top = xz_insetT;
    self.contentInset = inset;
}

- (CGFloat)xz_insetTop
{
    return self.contentInset.top;
}

- (void)setXz_insetBottom:(CGFloat)xz_insetB
{
    UIEdgeInsets inset = self.contentInset;
    inset.bottom = xz_insetB;
    self.contentInset = inset;
}

- (CGFloat)xz_insetBottom
{
    return self.contentInset.bottom;
}

- (void)setXz_insetLeft:(CGFloat)xz_insetL
{
    UIEdgeInsets inset = self.contentInset;
    inset.left = xz_insetL;
    self.contentInset = inset;
}

- (CGFloat)xz_insetLeft
{
    return self.contentInset.left;
}

- (void)setXz_insetRight:(CGFloat)xz_insetR
{
    UIEdgeInsets inset = self.contentInset;
    inset.right = xz_insetR;
    self.contentInset = inset;
}

- (CGFloat)xz_insetRight
{
    return self.contentInset.right;
}

- (void)setXz_contentOffsetX:(CGFloat)xz_contentOffsetX
{
    CGPoint offset = self.contentOffset;
    offset.x = xz_contentOffsetX;
    self.contentOffset = offset;
}

- (CGFloat)xz_contentOffsetX
{
    return self.contentOffset.x;
}

- (void)setXz_contentOffsetY:(CGFloat)xz_contentOffsetY
{
    CGPoint offset = self.contentOffset;
    offset.y = xz_contentOffsetY;
    self.contentOffset = offset;
}

- (CGFloat)xz_contentOffsetY
{
    return self.contentOffset.y;
}

- (void)setXz_contentW:(CGFloat)xz_contentW
{
    CGSize size = self.contentSize;
    size.width = xz_contentW;
    self.contentSize = size;
}

- (CGFloat)xz_contentW
{
    return self.contentSize.width;
}

- (void)setXz_contentH:(CGFloat)xz_contentH
{
    CGSize size = self.contentSize;
    size.height = xz_contentH;
    self.contentSize = size;
}

- (CGFloat)xz_contentH
{
    return self.contentSize.height;
}



- (void)xz_scrollToTopAnimated:(BOOL)animated
{
    [self setContentOffset:CGPointMake(0, self.xz_insetTop) animated:animated];
}
- (void)xz_scrollToBottomAnimated:(BOOL)animated
{
    [self setContentOffset:CGPointMake(0, self.xz_insetBottom) animated:animated];
}
- (void)xz_scrollToLeftAnimated:(BOOL)animated
{
    [self setContentOffset:CGPointMake(self.xz_insetLeft, 0) animated:animated];
}

- (void)xz_scrollToRightAnimated:(BOOL)animated
{
    [self setContentOffset:CGPointMake(self.xz_insetRight, 0) animated:animated];
}
@end
