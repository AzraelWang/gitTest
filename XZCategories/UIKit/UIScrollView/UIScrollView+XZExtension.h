//
//  UIScrollView+XZExtension.h
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/17.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (XZExtension)

@property (assign, nonatomic) CGFloat xz_insetTop;
@property (assign, nonatomic) CGFloat xz_insetBottom;
@property (assign, nonatomic) CGFloat xz_insetLeft;
@property (assign, nonatomic) CGFloat xz_insetRight;

@property (assign, nonatomic) CGFloat xz_contentOffsetX;
@property (assign, nonatomic) CGFloat xz_contentOffsetY;

@property (assign, nonatomic) CGFloat xz_contentW;
@property (assign, nonatomic) CGFloat xz_contentH;


- (void)xz_scrollToTopAnimated:(BOOL)animated;
- (void)xz_scrollToBottomAnimated:(BOOL)animated;
- (void)xz_scrollToLeftAnimated:(BOOL)animated;
- (void)xz_scrollToRightAnimated:(BOOL)animated;

@end
