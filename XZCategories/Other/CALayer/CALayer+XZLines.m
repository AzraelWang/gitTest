//
//  CALayer+XZLines.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/15.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import "CALayer+XZLines.h"

@implementation CALayer (XZLines)

+ (CALayer *)xz_lineLayerRect:(CGRect)rect
{
    return [self xz_lineLayerRect:rect color:[UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1.0]];
}

+ (CALayer *)xz_lineLayerRect:(CGRect)rect
                        color:(UIColor *)color
{
    CALayer *lineLayer = [CALayer layer];
    lineLayer.backgroundColor = [color CGColor];
    lineLayer.frame = rect;
    return lineLayer;
}


+ (CALayer *)xz_dottedLineWithLength:(CGFloat)length
                           lineColor:(UIColor *)lineColor
{
    return [self xz_dottedLineWithLength:length
                               lineWidth:1.0
                               lineColor:lineColor];
}

+ (CALayer *)xz_dottedLineWithLength:(CGFloat)length
                           lineWidth:(CGFloat)lineWidth
                           lineColor:(UIColor *)lineColor
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointZero];
    [path addLineToPoint:CGPointMake(length, 0)];
    
    CAShapeLayer *line = [CAShapeLayer layer];
    line.strokeColor = lineColor.CGColor;
    line.path = path.CGPath;
    line.lineWidth = lineWidth;
    line.lineDashPattern = @[@7.0, @2.0];
    return line;
}



+ (CALayer *)xz_squareShapeLayerRect:(CGRect)rect
                        cornerRadius:(CGFloat)cornerRadius{
    
    CAShapeLayer *border = [CAShapeLayer layer];
    border.strokeColor = [UIColor colorWithRed:251/255.0f green:214/255.0f blue:219/255.0f alpha:1.0].CGColor;
    border.fillColor = nil;
    border.path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius].CGPath;
    border.frame = rect;
    border.lineWidth = 1.f;
    border.lineCap = @"square";
    border.lineDashPattern = @[@5, @3.5];
    
    return border;
}

+ (CAShapeLayer *)xz_dottedLineBorderRect:(CGRect)rect
                                    color:(UIColor *)color
                             cornerRadius:(CGFloat)cornerRadius
                                lineWidth:(CGFloat)lineWidth
                              dashPattern:(NSArray *)dashPattern {
    CAShapeLayer *border = [CAShapeLayer layer];
    border.strokeColor = color.CGColor;
    border.fillColor = nil;
    border.path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius].CGPath;
    border.frame = rect;
    border.lineWidth = lineWidth;
    border.lineCap = @"square";
    border.lineDashPattern = dashPattern;
    return border;
}


+ (CALayer *)xz_shapeLayerRect:(CGRect)rect
                  cornerRadius:(CGFloat)cornerRadius
                         color:(UIColor *)color
{
    CALayer *sublayer = [CALayer layer];
    sublayer.backgroundColor = color.CGColor;
    sublayer.frame = rect;
    sublayer.cornerRadius = cornerRadius;
    return sublayer;
}


@end
