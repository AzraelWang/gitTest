//
//  NSTimer+XZExtension.h
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/14.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^XZTimerCallBack)(NSTimer *timer);

@interface NSTimer (XZExtension)

+ (NSTimer *)xz_scheduledTimerWithTimeInterval:(NSTimeInterval)ti
                                       repeats:(BOOL)inRepeats
                                         block:(XZTimerCallBack )callBack;

+ (NSTimer *)xz_timerWithTimeInterval:(NSTimeInterval)ti
                              repeats:(BOOL)inRepeats
                                block:(XZTimerCallBack )callBack;


+ (NSTimer *)xz_scheduledTimerWithTimeInterval:(NSTimeInterval)ti
                                         count:(NSInteger)count
                                         block:(XZTimerCallBack )callBack;


+ (NSTimer *)xz_timerWithTimeInterval:(NSTimeInterval)ti
                                count:(NSInteger)count
                                block:(XZTimerCallBack )callBack;


/// 开启NSTimer
- (void)xz_openTimer;

/// 继续NSTimer
- (void)xz_resumeTimer;

/// 暂停NSTimer
- (void)xz_pauseTimer;

/// 终止NSTimer
- (void)xz_invalidate;

/// 延时interval继续NSTimer
- (void)xz_resumeTimerAfterTimeInterval:(NSTimeInterval)interval;

@end
