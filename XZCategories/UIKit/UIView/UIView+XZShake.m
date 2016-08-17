//
//  UIView+XZShake.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/17.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import "UIView+XZShake.h"

@implementation UIView (XZShake)

- (void)xz_shake:(int)times
       withDelta:(CGFloat)delta
           speed:(NSTimeInterval)interval
  shakeDirection:(XZShakeDirection)shakeDirection
      completion:(void(^)(void))completion
{
    [self _xz_shake:times
          direction:1
       currentTimes:0
          withDelta:delta
              speed:interval
     shakeDirection:shakeDirection
         completion:completion];
}



- (void)_xz_shake:(int)times
        direction:(int)direction
     currentTimes:(int)current
        withDelta:(CGFloat)delta
            speed:(NSTimeInterval)interval
   shakeDirection:(XZShakeDirection)shakeDirection
       completion:(void (^)(void))completionHandler
{
    [UIView animateWithDuration:interval animations:^{
        self.layer.affineTransform = (shakeDirection == XZShakeDirectionHorizontal) ? CGAffineTransformMakeTranslation(delta * direction, 0) : CGAffineTransformMakeTranslation(0, delta * direction);
    } completion:^(BOOL finished) {
        if(current >= times) {
            [UIView animateWithDuration:interval animations:^{
                self.layer.affineTransform = CGAffineTransformIdentity;
            } completion:^(BOOL finished){
                if (completionHandler != nil) {
                    completionHandler();
                }
            }];
            return;
        }
        [self _xz_shake:(times - 1)
              direction:direction * -1
           currentTimes:current + 1
              withDelta:delta
                  speed:interval
         shakeDirection:shakeDirection
             completion:completionHandler];
    }];
}

@end
