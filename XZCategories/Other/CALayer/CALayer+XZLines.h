//
//  CALayer+XZLines.h
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/15.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface CALayer (XZLines)

/// 矩形分割线（颜色为RGB(224,224,224)）
+ (CALayer *)xz_lineLayerRect:(CGRect)rect;

/// 颜色背景矩形分割线
+ (CALayer *)xz_lineLayerRect:(CGRect)rect
                        color:(UIColor *)color;

/// 虚线分隔线(默认线宽为1)
+ (CALayer *)xz_dottedLineWithLength:(CGFloat)length
                           lineColor:(UIColor *)lineColor;

/// 虚线分隔线
+ (CALayer *)xz_dottedLineWithLength:(CGFloat)length
                           lineWidth:(CGFloat)lineWidth
                           lineColor:(UIColor *)lineColor;



/// 圆角矩形虚线(默认线宽为1，颜色为RGB(251, 214, 219),dashPattern为@[@5, @3.5])
+ (CALayer *)xz_squareShapeLayerRect:(CGRect)rect
                        cornerRadius:(CGFloat)cornerRadius;

/// 圆角矩形虚线
+ (CAShapeLayer *)xz_dottedLineBorderRect:(CGRect)rect
                                    color:(UIColor *)color
                             cornerRadius:(CGFloat)cornerRadius
                                lineWidth:(CGFloat)lineWidth
                              dashPattern:(NSArray *)dashPattern;

/// 圆角矩形
+ (CALayer *)xz_shapeLayerRect:(CGRect)rect
                  cornerRadius:(CGFloat)cornerRadius
                         color:(UIColor *)color;

@end
