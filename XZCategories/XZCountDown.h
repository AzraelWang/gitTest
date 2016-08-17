//
//  XZCountDown.h
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/17.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XZCountDown : NSObject

/// 用NSDate日期倒计时
-(void)countDownWithStratDate:(NSDate *)startDate
                   finishDate:(NSDate *)finishDate
                completeBlock:(void (^)(NSInteger day,NSInteger hour,NSInteger minute,NSInteger second))completeBlock;

/// 用时间戳倒计时
-(void)countDownWithStratTimeStamp:(long long)starTimeStamp
                   finishTimeStamp:(long long)finishTimeStamp
                     completeBlock:(void (^)(NSInteger day,NSInteger hour,NSInteger minute,NSInteger second))completeBlock;

/// 主动销毁计时器
-(void)destoryTimer;


/// 获取当前时间与某个时间间的（天数、小时数、分钟数、秒数）之间的间隔
- (void)getTimeIntervalDurationWithTime:(NSDate *)aDate
                            resultBlock:(void (^)(NSInteger day,NSInteger hour,NSInteger minute,NSInteger second))resultBlock;

@end
