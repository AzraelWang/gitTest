//
//  UIView+XZLayoutConstraint.h
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/16.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XZLayoutConstraint)


- (NSLayoutConstraint *)xz_constraintForAttribute:(NSLayoutAttribute)attribute;

- (NSLayoutConstraint *)xz_leftConstraint;
- (NSLayoutConstraint *)xz_rightConstraint;
- (NSLayoutConstraint *)xz_topConstraint;
- (NSLayoutConstraint *)xz_bottomConstraint;
- (NSLayoutConstraint *)xz_leadingConstraint;
- (NSLayoutConstraint *)xz_trailingConstraint;
- (NSLayoutConstraint *)xz_widthConstraint;
- (NSLayoutConstraint *)xz_heightConstraint;
- (NSLayoutConstraint *)xz_centerXConstraint;
- (NSLayoutConstraint *)xz_centerYConstraint;
- (NSLayoutConstraint *)xz_baseLineConstraint;



/**
 *  注意，这个分类里面的方法要在addsubview之后调用！！！
 */

/**
 *  把子视图放置在view的中心。
 *
 *  @param subview 子视图
 */
- (void)xz_addCenterPointConstraintForSubview:(UIView *)subview;


/**
 *  用于固定第一个不限高度的子视图
 *
 *  @param subview 子视图
 *  @param left    左边距
 *  @param top     上边距
 *  @param right   右边距
 */
- (void)xz_addConstraintForSubview:(UIView *)subview
                     leftMargin:(CGFloat)left
                      topMargin:(CGFloat)top
                          right:(CGFloat)right;

/**
 *  设置一个有上边距、x坐标居中的子视图
 *
 *  @param subview 需要自动布局的视图
 *  @param top     上边距
 */
- (void)xz_addCenterXConstraintForSubview:(UIView *)subview
                             topMargin:(CGFloat)top;

/**
 *  设置一个有上边距和左边距的子视图
 *
 *  @param subview 子视图
 *  @param left    左边距
 *  @param top     上边距
 */
- (void)xz_addConstraintForSubview:(UIView *)subview
                     leftMargin:(CGFloat)left
                      topMargin:(CGFloat)top;

/**
 *  设置一个有上边距、x坐标居中并且有宽高限制的子视图
 *
 *  @param subview 需要自动布局的视图
 *  @param top     上边距
 *  @param width   宽度
 *  @param height  高度
 */
- (void)xz_addCenterXConstraintForSubview:(UIView *)subview
                             topMargin:(CGFloat)top
                                 width:(CGFloat)width
                                height:(CGFloat)height;


/**
 *  设置有上边距并且距leftTargetView为horizontalSpace的子视图
 *
 *  @param subview         子视图
 *  @param top             上边距
 *  @param leftTargetView  左视图
 *  @param horizontalSpace 水平间距
 */
- (void)xz_addConstraintForSubview:(UIView *)subview
                      topMargin:(CGFloat)top
                 leftTargetView:(UIView *)leftTargetView
                horizontalSpace:(CGFloat)horizontalSpace;


/**
 *  设置有上边距并且距leftTargetView为horizontalSpace的子视图,限制宽度
 *
 *  @param subview         子视图
 *  @param top             上边距
 *  @param leftTargetView  左视图
 *  @param horizontalSpace 水平间距
 *  @param width           宽度
 *  @param height          高度
 */
- (void)xz_addConstraintForSubview:(UIView *)subview
                      topMargin:(CGFloat)top
                 leftTargetView:(UIView *)leftTargetView
                horizontalSpace:(CGFloat)horizontalSpace
                          width:(CGFloat)width
                         height:(CGFloat)height;


/**
 *  设置水平居中子视图到目标视图的垂直间距
 *
 *  @param subview       子视图
 *  @param targetView    目标视图
 *  @param verticalSpace 垂直间距
 */
- (void)xz_addCenterXConstraintForSubview:(UIView *)subview
                            targetView:(UIView *)targetView
                         verticalSpace:(CGFloat)verticalSpace;


/**
 *  设置距topTargetView间距为vertiacalSpace，距leftTargetView间距为horizontalSpace的子视图
 *
 *  @param subview         子视图
 *  @param topTargetView   上视图
 *  @param leftTargetView  左视图
 *  @param verticalSpace   垂直间距
 *  @param horizontalSpace 水平间距
 */
- (void)xz_addConstraintForSubview:(UIView *)subview
                  topTargetView:(UIView *)topTargetView
                 leftTargetView:(UIView *)leftTargetView
                  verticalSpace:(CGFloat)verticalSpace
                horizontalSpace:(CGFloat)horizontalSpace;


/**
 *  用于固定最后一个不限高度的子视图
 *
 *  @param subview 子视图
 *  @param left    左边距
 *  @param bottom  下边距
 *  @param right   右边距
 */
- (void)xz_addConstraintForSubview:(UIView *)subview
                     leftMargin:(CGFloat)left
                   bottomMargin:(CGFloat)bottom
                          right:(CGFloat)right;

/**
 *  设置一个有下边距、x坐标居中的子视图
 *
 *  @param subview 需要自动布局的视图
 *  @param bottom     下边距
 */
- (void)xz_addCenterXConstraintForSubview:(UIView *)subview
                          bottomMargin:(CGFloat)bottom;

/**
 *  设置一个有下边距、x坐标居中并且有宽高限制的子视图
 *
 *  @param subview 需要自动布局的视图
 *  @param bottom  下边距
 *  @param width   宽度
 *  @param height  高度
 */
- (void)xz_addCenterXConstraintForSubview:(UIView *)subview
                          bottomMargin:(CGFloat)bottom
                                 width:(CGFloat)width
                                height:(CGFloat)height;

/**
 *  自定义自动布局
 *
 *  @param horizontal      水平约束
 *  @param vertical        竖直约束
 *  @param viewsDictionary views字典
 */
- (void)xz_addConstraintWithVisualFormatHorizontal:(NSString *)horizontal
                                       vertical:(NSString *)vertical
                              subviewDictionary:(NSDictionary *)viewsDictionary;

@end
