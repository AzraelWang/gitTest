//
//  UIView+XZFind.h
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/17.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XZFind)
/**
 *  找到并且resign第一响应者
 *  @return 结果
 */
- (BOOL)xz_findAndResignFirstResponder;
/**
 *  找到第一响应者
 *  @return 第一响应者
 */
- (UIView *)xz_findFirstResponder;

/**
 *  找到当前view所在的viewcontroler
 */
@property (nonatomic, readonly) UIViewController *xz_viewController;

@end
