//
//  XZCountDown.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/17.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import "XZCountDown.h"

@interface XZCountDown ()
@property(nonatomic,retain) dispatch_source_t timer;
@property(nonatomic,retain) NSDateFormatter *dateFormatter;
@end

@implementation XZCountDown

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dateFormatter = [[NSDateFormatter alloc] init];
        [self.dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
        NSTimeZone *localTimeZone = [NSTimeZone localTimeZone];
        [self.dateFormatter setTimeZone:localTimeZone];
    }
    return self;
}

/// 用NSDate日期倒计时
-(void)countDownWithStratDate:(NSDate *)startDate
                   finishDate:(NSDate *)finishDate
                completeBlock:(void (^)(NSInteger day,NSInteger hour,NSInteger minute,NSInteger second))completeBlock
{
    if (_timer==nil) {
        
        NSTimeInterval timeInterval =[finishDate timeIntervalSinceDate:startDate];
        __block int timeout = timeInterval; //倒计时时间
        
        if (timeout!=0) {
            dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            
            _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
            
            dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
            
            dispatch_source_set_event_handler(_timer, ^{
                
                if(timeout<=0){ //倒计时结束，关闭
                    dispatch_source_cancel(_timer);
                    _timer = nil;
                    dispatch_async(dispatch_get_main_queue(), ^{
                        completeBlock(0,0,0,0);
                    });
                    
                }else{
                    
                    int days = (int)(timeout/(3600*24));
                    int hours = (int)((timeout-days*24*3600)/3600);
                    int minute = (int)(timeout-days*24*3600-hours*3600)/60;
                    int second = timeout-days*24*3600-hours*3600-minute*60;
                    dispatch_async(dispatch_get_main_queue(), ^{
                        completeBlock(days,hours,minute,second);
                    });
                    timeout--;
                    
                }
            });
            dispatch_resume(_timer);
        }
    }
}

/// 用时间戳倒计时
-(void)countDownWithStratTimeStamp:(long long)starTimeStamp
                   finishTimeStamp:(long long)finishTimeStamp
                     completeBlock:(void (^)(NSInteger day,NSInteger hour,NSInteger minute,NSInteger second))completeBlock
{
    if (_timer==nil) {
        
        NSDate *finishDate = [self dateWithLongLong:finishTimeStamp];
        NSDate *startDate  = [self dateWithLongLong:starTimeStamp];
        NSTimeInterval timeInterval =[finishDate timeIntervalSinceDate:startDate];
        
        __block int timeout = timeInterval; //倒计时时间
        
        if (timeout!=0) {
            dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            
            _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
            
            dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
            
            dispatch_source_set_event_handler(_timer, ^{
                
                if(timeout<=0){ //倒计时结束，关闭
                    
                    dispatch_source_cancel(_timer);
                    _timer = nil;
                    dispatch_async(dispatch_get_main_queue(), ^{
                        completeBlock(0,0,0,0);
                    });
                    
                }else{
                    
                    int days = (int)(timeout/(3600*24));
                    int hours = (int)((timeout-days*24*3600)/3600);
                    int minute = (int)(timeout-days*24*3600-hours*3600)/60;
                    int second = timeout-days*24*3600-hours*3600-minute*60;
                    dispatch_async(dispatch_get_main_queue(), ^{
                        completeBlock(days,hours,minute,second);
                    });
                    timeout--;
                }
            });
            dispatch_resume(_timer);
        }
    }
}


- (void)getTimeIntervalDurationWithTime:(NSDate *)aDate
                            resultBlock:(void (^)(NSInteger day,NSInteger hour,NSInteger minute,NSInteger second))resultBlock
{
    // 截止时间date格式
    NSDate  *expireDate = aDate;
    NSDate  *nowDate = [NSDate date];
    
    NSTimeInterval timeInterval =[expireDate timeIntervalSinceDate:nowDate];
    
    NSInteger days      = (NSInteger)(timeInterval/(3600*24));
    NSInteger hours     = (NSInteger)((timeInterval-days*24*3600)/3600);
    NSInteger minutes   = (NSInteger)(timeInterval-days*24*3600-hours*3600)/60;
    NSInteger seconds   = (NSInteger)timeInterval-days*24*3600-hours*3600-minutes*60;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        resultBlock(days,hours,minutes,seconds);
    });
}

/// 销毁计时器
-(void)destoryTimer
{
    if (_timer) {
        dispatch_source_cancel(_timer);
        _timer = nil;
    }
}

-(void)dealloc{
    NSLog(@"%@ dealloc",NSStringFromClass([self class]));
}

/// 时间戳转换成NSDate
-(NSDate *)dateWithLongLong:(long long)longlongValue
{
    long long value = longlongValue/1000;
    NSNumber *time = [NSNumber numberWithLongLong:value];
    //转换成NSTimeInterval
    NSTimeInterval nsTimeInterval = [time longValue];
    NSDate *date = [[NSDate alloc] initWithTimeIntervalSince1970:nsTimeInterval];
    return date;
}

@end
