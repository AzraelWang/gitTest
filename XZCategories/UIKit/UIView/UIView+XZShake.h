//
//  UIView+XZShake.h
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/17.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, XZShakeDirection) {
    XZShakeDirectionHorizontal = 0,
    XZShakeDirectionVertical
};

@interface UIView (XZShake)
/**
 *
 * 以自定义速度来 Shake UIView
 *
 * @param shakes次数
 * @param delta 增量
 * @param interval 时间
 * @param direction 方向
 * @param completion 回调
 */
- (void)xz_shake:(int)times
       withDelta:(CGFloat)delta
           speed:(NSTimeInterval)interval
  shakeDirection:(XZShakeDirection)shakeDirection
      completion:(void(^)(void))completion;

@end
