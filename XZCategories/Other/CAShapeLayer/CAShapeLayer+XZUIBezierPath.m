//
//  CAShapeLayer+XZUIBezierPath.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/15.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import "CAShapeLayer+XZUIBezierPath.h"

// 【UIBezierPath的属性介绍】

// bounds               - 和view的bounds是不一样的，它获取path的X坐标、Y坐标、宽度，但是高度为0
// currentPoint         - 当前path的位置，可以理解为path的终点

// kCGLineCapButt       - 不绘制端点,线条结尾处直接结束。这是默认值。
// kCALineCapRound      - 圆形端点,线条结尾处绘制一个直径为线条宽度的半圆
// kCGLineCapSquare     - 方形端点,线条结尾处绘制半个边长为线条宽度的正方形

// kCGLineJoinMiter     - 拐角样式,尖角
// kCGLineJoinRound     - 拐角样式,圆角
// kCGLineJoinBevel     - 拐角样式,缺角

// miterLimit           - 最大斜接长度（只有在使用kCGLineJoinMiter是才有效）,边角的角度越小，斜接长度就会越大。为了避免斜接长度过长，使用lineLimit属性限制，如果斜接长度超过miterLimit，边角就会以KCALineJoinBevel类型来显示.

// flatness             - 弯曲路径的渲染精度，默认为0.6，越小精度越高，相应的更加消耗性能
// usesEvenOddFillRule  - 单双数圈规则是否用于绘制路径，默认是NO。


@implementation CAShapeLayer (XZUIBezierPath)

-(void)xz_updateWithBezierPath:(UIBezierPath *)path
{
    self.path = [path CGPath];
    self.lineWidth = path.lineWidth;
    self.miterLimit = path.miterLimit;
    
    self.lineCap = [[self class] lineCapFromCGLineCap:path.lineCapStyle];
    self.lineJoin = [[self class] lineJoinFromCGLineJoin:path.lineJoinStyle];
    
    self.fillRule = path.usesEvenOddFillRule ? kCAFillRuleEvenOdd : kCAFillRuleNonZero;
    
    NSInteger count;
    [path getLineDash:NULL count:&count phase:NULL];
    CGFloat pattern[count], phase;
    [path getLineDash:pattern count:NULL phase:&phase];
    
    NSMutableArray *lineDashPattern = [NSMutableArray array];
    for (NSUInteger i = 0; i < count; i++) {
        [lineDashPattern addObject:@(pattern[i])];
    }
    
    self.lineDashPattern = [lineDashPattern copy];
    self.lineDashPhase = phase;
}

-(UIBezierPath *)xz_bezierPath
{
    UIBezierPath * path = [UIBezierPath bezierPathWithCGPath:self.path];
    path.lineWidth = self.lineWidth;
    path.miterLimit = self.miterLimit;
    
    path.lineCapStyle = [[self class] lineCapFromCALineCap:self.lineCap];
    path.lineJoinStyle = [[self class] lineJoinFromCALineJoin:self.lineJoin];
    
    path.usesEvenOddFillRule = (self.fillRule == kCAFillRuleEvenOdd);
    
    CGFloat phase = self.lineDashPhase;
    NSInteger count = self.lineDashPattern.count;
    CGFloat pattern[count];
    for (NSUInteger i = 0; i < count; i++) {
        pattern[i] = [[self.lineDashPattern objectAtIndex:i] floatValue];
    }
    [path setLineDash:pattern count:count phase:phase];
    
    return path;
}


+(NSDictionary *)CGtoCALineCaps
{
    return @{
             @(kCGLineCapSquare) :kCALineCapSquare,
             @(kCGLineCapButt) : kCALineCapButt,
             @(kCGLineCapRound) : kCALineCapRound
             };
}

+(NSDictionary *)CGtoCALineJoins
{
    return @{
             @(kCGLineJoinRound) : kCALineJoinRound,
             @(kCGLineJoinMiter) : kCALineJoinMiter,
             @(kCGLineJoinBevel) : kCALineJoinBevel
             };
}

+(NSDictionary *)CAtoCGLineCaps
{
    return @{
             kCALineCapSquare : @(kCGLineCapSquare),
             kCALineCapButt : @(kCGLineCapButt),
             kCALineCapRound : @(kCGLineCapRound)
             };
}

+(NSDictionary *)CAtoCGLineJoins
{
    return @{
             kCALineJoinRound : @(kCGLineJoinRound),
             kCALineJoinMiter : @(kCGLineJoinMiter),
             kCALineJoinBevel : @(kCGLineJoinBevel)
             };
}

+(NSString *)lineCapFromCGLineCap:(CGLineCap)lineCap
{
    return [self CGtoCALineCaps][@(lineCap)];
}

+(NSString *)lineJoinFromCGLineJoin:(CGLineJoin)lineJoin
{
    return [self CGtoCALineJoins][@(lineJoin)];
}

+(CGLineCap)lineCapFromCALineCap:(NSString *)lineCap
{
    return [[self CAtoCGLineCaps][lineCap] intValue];
}

+(CGLineJoin)lineJoinFromCALineJoin:(NSString *)lineJoin
{
    return [[self CAtoCGLineJoins][lineJoin] intValue];
}

@end
