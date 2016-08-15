//
//  NSDate+XZFormatString.h
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/14.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (XZFormatString)

/**
 * 获取格式化为YYYY-MM-dd格式的日期字符串
 */
- (NSString *)xz_formatYMD;
+ (NSString *)xz_formatYMD:(NSDate *)date;


/**
 * 根据日期返回字符串
 */
+ (NSString *)xz_stringWithDate:(NSDate *)date format:(NSString *)format;
- (NSString *)xz_stringWithFormat:(NSString *)format;
+ (NSDate *)xz_dateWithString:(NSString *)string format:(NSString *)format;


/**
 * 分别获取yyyy-MM-dd/HH:mm:ss/yyyy-MM-dd HH:mm:ss格式的字符串
 */
- (NSString *)xz_ymdFormat;
+ (NSString *)xz_ymdFormat;

- (NSString *)xz_hmsFormat;
+ (NSString *)xz_hmsFormat;

- (NSString *)xz_ymdHmsFormat;
+ (NSString *)xz_ymdHmsFormat;

/**
 *  转换成时间戳
 */
- (NSString *)xz_toTimeStamp;
@end
