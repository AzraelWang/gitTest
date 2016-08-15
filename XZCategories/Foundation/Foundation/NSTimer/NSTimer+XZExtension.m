//
//  NSTimer+XZExtension.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/14.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import "NSTimer+XZExtension.h"
#import <objc/runtime.h>

static const void *s_private_currentCountTime = "s_private_currentCountTime";


@implementation NSTimer (XZExtension)

+(NSTimer *)xz_scheduledTimerWithTimeInterval:(NSTimeInterval)ti
                               repeats:(BOOL)inRepeats
                                 block:(XZTimerCallBack )callBack
{
    XZTimerCallBack block = [callBack copy];
   NSTimer * timer = [self scheduledTimerWithTimeInterval:ti
                                                   target:self
                                                 selector:@selector(executeBlock:)
                                                 userInfo:block
                                                  repeats:inRepeats];
    return timer;
    
}

+(NSTimer *)xz_timerWithTimeInterval:(NSTimeInterval)ti
                      repeats:(BOOL)inRepeats
                        block:(XZTimerCallBack )callBack
{
    XZTimerCallBack block = [callBack copy];
    NSTimer * timer = [self timerWithTimeInterval:ti
                                           target:self
                                         selector:@selector(executeBlock:)
                                         userInfo:block
                                          repeats:inRepeats];
    return timer;
}

+ (void)executeBlock:(NSTimer *)timer{
    if ([timer userInfo]){
        XZTimerCallBack block = (XZTimerCallBack)[timer userInfo];
        block(timer);
    }
}








+ (NSTimer *)xz_scheduledTimerWithTimeInterval:(NSTimeInterval)ti
                                         count:(NSInteger)count
                                         block:(XZTimerCallBack )callBack
{
    if (count <= 0) {
        return [self xz_scheduledTimerWithTimeInterval:ti
                                               repeats:YES
                                                 block:callBack];
    }
    XZTimerCallBack block = [callBack copy];
    
    NSDictionary *userInfo = @{@"callback"     : block,
                               @"count"        : @(count)};
    NSTimer *timer = [self scheduledTimerWithTimeInterval:ti
                                                      target:self
                                                    selector:@selector(executeCountBlock:)
                                                    userInfo:userInfo
                                                     repeats:YES];
    return timer;
}


+ (NSTimer *)xz_timerWithTimeInterval:(NSTimeInterval)ti
                                count:(NSInteger)count
                                block:(XZTimerCallBack )callBack
{
    if (count <= 0) {
        return [self xz_timerWithTimeInterval:ti
                                      repeats:YES
                                        block:callBack];
    }
    XZTimerCallBack block = [callBack copy];
    
    NSDictionary *userInfo = @{@"callback"     : block,
                               @"count"        : @(count)};
    
    NSTimer *timer = [self timerWithTimeInterval:ti
                                          target:self
                                        selector:@selector(executeCountBlock:)
                                        userInfo:userInfo
                                         repeats:YES];
    return timer;
}




+ (void)executeCountBlock:(NSTimer *)timer {
    
    NSInteger currentCount = [[timer private_currentCountTime] integerValue];
    
    NSDictionary *userInfo = timer.userInfo;
    XZTimerCallBack callback = userInfo[@"callback"];
    NSNumber *count = userInfo[@"count"];
    
    if (currentCount < count.integerValue) {
        currentCount++;
        [timer set_private_currentCountTime:@(currentCount)];
        
        if (callback) {
            callback(timer);
        }
    } else {
        currentCount = 0;
        [timer set_private_currentCountTime:@(currentCount)];
        
        [timer xz_pauseTimer];
        [timer xz_invalidate];
    }
}

- (NSNumber *)private_currentCountTime {
    NSNumber *obj = objc_getAssociatedObject(self, s_private_currentCountTime);
    
    if (obj == nil) {
        obj = @(0);
        [self set_private_currentCountTime:obj];
    }
    return obj;
}

- (void)set_private_currentCountTime:(NSNumber *)time {
    objc_setAssociatedObject(self,
                             s_private_currentCountTime,
                             time, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}



- (void)xz_openTimer
{
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate distantPast]];
}


- (void)xz_resumeTimer {
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate date]];
}

- (void)xz_pauseTimer {
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate distantFuture]];
}

- (void)xz_invalidate {
    if (self.isValid) {
        [self invalidate];
    }
}

- (void)xz_resumeTimerAfterTimeInterval:(NSTimeInterval)interval
{
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:interval]];
}

@end
