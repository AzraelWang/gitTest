//
//  UIView+XZLayoutConstraint.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/16.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import "UIView+XZLayoutConstraint.h"

@implementation UIView (XZLayoutConstraint)

-(NSLayoutConstraint *)xz_constraintForAttribute:(NSLayoutAttribute)attribute {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"firstAttribute = %d && (firstItem = %@ || secondItem = %@)", attribute, self, self];
    NSArray *constraintArray = [self.superview constraints];
    
    if (attribute == NSLayoutAttributeWidth || attribute == NSLayoutAttributeHeight) {
        constraintArray = [self constraints];
    }
    
    NSArray *fillteredArray = [constraintArray filteredArrayUsingPredicate:predicate];
    if(fillteredArray.count == 0) {
        return nil;
    } else {
        return fillteredArray.firstObject;
    }
}

- (NSLayoutConstraint *)xz_leftConstraint {
    return [self xz_constraintForAttribute:NSLayoutAttributeLeft];
}

- (NSLayoutConstraint *)xz_rightConstraint {
    return [self xz_constraintForAttribute:NSLayoutAttributeRight];
}

- (NSLayoutConstraint *)xz_topConstraint {
    return [self xz_constraintForAttribute:NSLayoutAttributeTop];
}

- (NSLayoutConstraint *)xz_bottomConstraint {
    return [self xz_constraintForAttribute:NSLayoutAttributeBottom];
}

- (NSLayoutConstraint *)xz_leadingConstraint {
    return [self xz_constraintForAttribute:NSLayoutAttributeLeading];
}

- (NSLayoutConstraint *)xz_trailingConstraint {
    return [self xz_constraintForAttribute:NSLayoutAttributeTrailing];
}

- (NSLayoutConstraint *)xz_widthConstraint {
    return [self xz_constraintForAttribute:NSLayoutAttributeWidth];
}

- (NSLayoutConstraint *)xz_heightConstraint {
    return [self xz_constraintForAttribute:NSLayoutAttributeHeight];
}

- (NSLayoutConstraint *)xz_centerXConstraint {
    return [self xz_constraintForAttribute:NSLayoutAttributeCenterX];
}

- (NSLayoutConstraint *)xz_centerYConstraint {
    return [self xz_constraintForAttribute:NSLayoutAttributeCenterY];
}

- (NSLayoutConstraint *)xz_baseLineConstraint {
    return [self xz_constraintForAttribute:NSLayoutAttributeBaseline];
}






#pragma mark -顶视图
/**
 *  把subview放置在view的中心,该方法要用在addsubview之后。
 *
 *  @param subview 子视图
 */
- (void)xz_addCenterPointConstraintForSubview:(UIView *)subview
{
    subview.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *constraintX = [NSLayoutConstraint constraintWithItem:subview
                                                                   attribute:NSLayoutAttributeCenterX
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self
                                                                   attribute:NSLayoutAttributeCenterX
                                                                  multiplier:1
                                                                    constant:0];
    
    NSLayoutConstraint *constraintY = [NSLayoutConstraint constraintWithItem:subview
                                                                   attribute:NSLayoutAttributeCenterY
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self
                                                                   attribute:NSLayoutAttributeCenterY
                                                                  multiplier:1
                                                                    constant:0];
    
    [self addConstraints:@[constraintX, constraintY]];
}

/**
 *  用于固定第一个不限高度的视图
 *
 *  @param subview 需要自动布局的视图
 *  @param left    左边距
 *  @param top     上边距
 *  @param right   右边距
 */
- (void)xz_addConstraintForSubview:(UIView *)subview
                     leftMargin:(CGFloat)left
                      topMargin:(CGFloat)top
                          right:(CGFloat)right
{
    subview.translatesAutoresizingMaskIntoConstraints = NO;
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(subview);
    NSMutableArray *result = [NSMutableArray array];
    
    NSString *const kHorizontal = [NSString stringWithFormat:@"H:|-%f-[subview]-%f-|",left,right];
    NSString *const kVertical = [NSString stringWithFormat:@"V:|-%f-[subview]",top];
    
    [result addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:kHorizontal options:0 metrics:nil views:viewsDictionary]];
    [result addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:kVertical options:0 metrics:nil views:viewsDictionary]];
    
    [self addConstraints:result];
    
}

/**
 *  设置一个有上边距、x坐标居中的子视图
 *
 *  @param subview 需要自动布局的视图
 *  @param top     上边距
 */
- (void)xz_addCenterXConstraintForSubview:(UIView *)subview
                             topMargin:(CGFloat)top
{
    subview.translatesAutoresizingMaskIntoConstraints = NO;
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(subview);
    NSMutableArray *result = [NSMutableArray array];
    
    NSString *const kVertical = [NSString stringWithFormat:@"V:|-%f-[subview]",top];
    
    [result addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:kVertical options:0 metrics:nil views:viewsDictionary]];
    
    NSLayoutConstraint *constraintX = [NSLayoutConstraint constraintWithItem:subview
                                                                   attribute:NSLayoutAttributeCenterX
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self
                                                                   attribute:NSLayoutAttributeCenterX
                                                                  multiplier:1
                                                                    constant:0];
    [result addObject:constraintX];
    
    [self addConstraints:result];
}

/**
 *  设置一个有上边距和左边距的子视图
 *
 *  @param subview 子视图
 *  @param left    左边距
 *  @param top     上边距
 */
- (void)xz_addConstraintForSubview:(UIView *)subview
                     leftMargin:(CGFloat)left
                      topMargin:(CGFloat)top
{
    subview.translatesAutoresizingMaskIntoConstraints = NO;
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(subview);
    NSMutableArray *result = [NSMutableArray array];
    
    NSString *const kHorizontal = [NSString stringWithFormat:@"H:|-%f-[subview]",left];
    NSString *const kVertical = [NSString stringWithFormat:@"V:|-%f-[subview]",top];
    
    [result addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:kHorizontal options:0 metrics:nil views:viewsDictionary]];
    [result addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:kVertical options:0 metrics:nil views:viewsDictionary]];
    
    [self addConstraints:result];
}

/**
 *  设置一个有上边距、x坐标居中并且有宽高限制的视图
 *
 *  @param subview 需要自动布局的视图
 *  @param top     上边距
 *  @param width   宽度
 *  @param height  高度
 */
- (void)xz_addCenterXConstraintForSubview:(UIView *)subview
                             topMargin:(CGFloat)top
                                 width:(CGFloat)width
                                height:(CGFloat)height
{
    subview.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(subview);
    NSMutableArray *result = [NSMutableArray array];
    
    NSString *widthConstraint = (width == CGFLOAT_MAX) ? @"" : [NSString stringWithFormat:@"(<=%f)",width];
    NSString *heightConstraint = (height == CGFLOAT_MAX) ? @"" : [NSString stringWithFormat:@"(<=%f)",height];
    
    NSString *const kHorizontal = [NSString stringWithFormat:@"H:[subview%@]",widthConstraint];
    NSString *const kVertical = [NSString stringWithFormat:@"V:|-%f-[subview%@]",top,heightConstraint];
    
    [result addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:kHorizontal options:0 metrics:nil views:viewsDictionary]];
    [result addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:kVertical options:0 metrics:nil views:viewsDictionary]];
    
    NSLayoutConstraint *constraintX = [NSLayoutConstraint constraintWithItem:subview
                                                                   attribute:NSLayoutAttributeCenterX
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self
                                                                   attribute:NSLayoutAttributeCenterX
                                                                  multiplier:1
                                                                    constant:0];
    [result addObject:constraintX];
    
    [self addConstraints:result];
}

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
                horizontalSpace:(CGFloat)horizontalSpace
{
    subview.translatesAutoresizingMaskIntoConstraints = NO;
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(subview,leftTargetView);
    NSMutableArray *result = [NSMutableArray array];
    
    NSString *const kHorizontal = [NSString stringWithFormat:@"H:[leftTargetView]-%f-[subview]",horizontalSpace];
    NSString *const kVertical = [NSString stringWithFormat:@"V:|-%f-[subview]",top];
    
    [result addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:kHorizontal options:0 metrics:nil views:viewsDictionary]];
    [result addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:kVertical options:0 metrics:nil views:viewsDictionary]];
    
    [self addConstraints:result];
}

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
                         height:(CGFloat)height
{
    subview.translatesAutoresizingMaskIntoConstraints = NO;
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(subview,leftTargetView);
    NSMutableArray *result = [NSMutableArray array];
    
    NSString *widthConstraint = (width == CGFLOAT_MAX) ? @"" : [NSString stringWithFormat:@"(<=%f)",width];
    NSString *heightConstraint = (height == CGFLOAT_MAX) ? @"" : [NSString stringWithFormat:@"(<=%f)",height];
    
    NSString *const kHorizontal = [NSString stringWithFormat:@"H:[leftTargetView]-%f-[subview%@]",horizontalSpace,widthConstraint];
    NSString *const kVertical = [NSString stringWithFormat:@"V:|-%f-[subview%@]",top,heightConstraint];
    
    [result addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:kHorizontal options:0 metrics:nil views:viewsDictionary]];
    [result addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:kVertical options:0 metrics:nil views:viewsDictionary]];
    
    [self addConstraints:result];
}


#pragma mark -中间视图
/**
 *  设置子视图到目标视图的垂直间距
 *
 *  @param subview       子视图
 *  @param targetView    目标视图
 *  @param verticalSpace 垂直间距
 */
- (void)xz_addCenterXConstraintForSubview:(UIView *)subview
                            targetView:(UIView *)targetView
                         verticalSpace:(CGFloat)verticalSpace
{
    subview.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(subview,targetView);
    NSMutableArray *result = [NSMutableArray array];
    
    NSString *const kVertical = [NSString stringWithFormat:@"V:[targetView]-%f-[subview]",verticalSpace];
    
    [result addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:kVertical options:0 metrics:nil views:viewsDictionary]];
    
    NSLayoutConstraint *constraintX = [NSLayoutConstraint constraintWithItem:subview
                                                                   attribute:NSLayoutAttributeCenterX
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self
                                                                   attribute:NSLayoutAttributeCenterX
                                                                  multiplier:1
                                                                    constant:0];
    [result addObject:constraintX];
    
    [self addConstraints:result];
}

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
                horizontalSpace:(CGFloat)horizontalSpace
{
    subview.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(subview,topTargetView,leftTargetView);
    NSMutableArray *result = [NSMutableArray array];
    
    NSString *const kHorizontal = [NSString stringWithFormat:@"H:[leftTargetView]-%f-[subview]",horizontalSpace];
    NSString *const kVertical = [NSString stringWithFormat:@"V:[topTargetView]-%f-[subview]",verticalSpace];
    
    [result addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:kHorizontal options:0 metrics:nil views:viewsDictionary]];
    [result addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:kVertical options:0 metrics:nil views:viewsDictionary]];
    
    [self addConstraints:result];
}

#pragma mark -底视图
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
                          right:(CGFloat)right
{
    subview.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(subview);
    NSMutableArray *result = [NSMutableArray array];
    
    NSString *const kHorizontal = [NSString stringWithFormat:@"H:|-%f-[subview]-%f-|",left,right];
    NSString *const kVertical = [NSString stringWithFormat:@"V:[subview]-%f-|",bottom];
    
    [result addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:kHorizontal options:0 metrics:nil views:viewsDictionary]];
    [result addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:kVertical options:0 metrics:nil views:viewsDictionary]];
    
    [self addConstraints:result];
}

/**
 *  设置一个有下边距、x坐标居中的子视图
 *
 *  @param subview 需要自动布局的视图
 *  @param bottom     下边距
 */
- (void)xz_addCenterXConstraintForSubview:(UIView *)subview
                          bottomMargin:(CGFloat)bottom
{
    subview.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(subview);
    NSMutableArray *result = [NSMutableArray array];
    
    NSString *const kVertical = [NSString stringWithFormat:@"V:[subview]-%f-|",bottom];
    
    [result addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:kVertical options:0 metrics:nil views:viewsDictionary]];
    
    NSLayoutConstraint *constraintX = [NSLayoutConstraint constraintWithItem:subview
                                                                   attribute:NSLayoutAttributeCenterX
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self
                                                                   attribute:NSLayoutAttributeCenterX
                                                                  multiplier:1
                                                                    constant:0];
    [result addObject:constraintX];
    
    [self addConstraints:result];
}

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
                                height:(CGFloat)height
{
    subview.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(subview);
    NSMutableArray *result = [NSMutableArray array];
    
    NSString *widthConstraint = (width == CGFLOAT_MAX) ? @"" : [NSString stringWithFormat:@"(<=%f)",width];
    NSString *heightConstraint = (height == CGFLOAT_MAX) ? @"" : [NSString stringWithFormat:@"(<=%f)",height];
    
    NSString *const kHorizontal = [NSString stringWithFormat:@"H:[subview%@]",widthConstraint];
    NSString *const kVertical = [NSString stringWithFormat:@"V:[subview%@]-%f-|",heightConstraint,bottom];
    
    [result addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:kHorizontal options:0 metrics:nil views:viewsDictionary]];
    [result addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:kVertical options:0 metrics:nil views:viewsDictionary]];
    
    NSLayoutConstraint *constraintX = [NSLayoutConstraint constraintWithItem:subview
                                                                   attribute:NSLayoutAttributeCenterX
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self
                                                                   attribute:NSLayoutAttributeCenterX
                                                                  multiplier:1
                                                                    constant:0];
    [result addObject:constraintX];
    
    [self addConstraints:result];
}
/**
 *  自定义自动布局
 *
 *  @param horizontal      水平约束
 *  @param vertical        竖直约束
 *  @param viewsDictionary views字典
 */
- (void)xz_addConstraintWithVisualFormatHorizontal:(NSString *)horizontal
                                       vertical:(NSString *)vertical
                              subviewDictionary:(NSDictionary *)viewsDictionary
{
    
    NSMutableArray *result = [NSMutableArray array];
    
    [result addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:horizontal options:0 metrics:nil views:viewsDictionary]];
    [result addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:vertical options:0 metrics:nil views:viewsDictionary]];
    
    [self addConstraints:result];
}


@end
