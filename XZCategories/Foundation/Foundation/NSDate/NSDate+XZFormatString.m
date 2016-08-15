//
//  NSDate+XZFormatString.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/14.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import "NSDate+XZFormatString.h"
#import "NSDate+XZExtension.h"
@implementation NSDate (XZFormatString)
/**
 * 获取格式化为YYYY-MM-dd格式的日期字符串
 */
- (NSString *)xz_formatYMD
{
    return [NSDate xz_formatYMD:self];
}
+ (NSString *)xz_formatYMD:(NSDate *)date
{
    return [NSString stringWithFormat:@"%lu-%02lu-%02lu",[date xz_year],[date xz_month], [date xz_day]];
}


/**
 * 根据日期返回字符串
 */
+ (NSString *)xz_stringWithDate:(NSDate *)date format:(NSString *)format
{
    return [date xz_stringWithFormat:format];
}
- (NSString *)xz_stringWithFormat:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:format];
    return [formatter stringFromDate:self];
}

+ (NSDate *)xz_dateWithString:(NSString *)string format:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:format];
    return [formatter dateFromString:string];
}


/**
 * 分别获取yyyy-MM-dd/HH:mm:ss/yyyy-MM-dd HH:mm:ss格式的字符串
 */
- (NSString *)xz_ymdFormat
{
    return [NSDate xz_ymdFormat];
}
+ (NSString *)xz_ymdFormat
{
    return @"yyyy-MM-dd";
}

- (NSString *)xz_hmsFormat
{
    return [NSDate xz_hmsFormat];
}
+ (NSString *)xz_hmsFormat
{
    return @"HH:mm:ss";
}

- (NSString *)xz_ymdHmsFormat
{
    return [NSDate xz_ymdHmsFormat];
}
+ (NSString *)xz_ymdHmsFormat
{
    return [NSString stringWithFormat:@"%@ %@",[NSDate xz_ymdFormat],[NSDate xz_hmsFormat]];
}



- (NSString *)xz_toTimeStamp {
    return [NSString stringWithFormat:@"%lf", [self timeIntervalSince1970]];
}

@end
