//
//  CAShapeLayer+XZUIBezierPath.h
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/15.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface CAShapeLayer (XZUIBezierPath)

/**
 *  根据贝塞尔路径来根据shapeLayer
 */
- (void)xz_updateWithBezierPath:(UIBezierPath *)path;

/**
 *  获取当前贝塞尔路径
 */
- (UIBezierPath*)xz_bezierPath;

@end
