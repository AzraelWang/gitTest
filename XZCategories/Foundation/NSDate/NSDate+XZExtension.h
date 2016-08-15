//
//  NSDate+XZExtension.h
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/12.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (XZExtension)

/**
 * 获取日、月、年、小时、分钟、秒、
 */
- (NSUInteger)xz_day;
- (NSUInteger)xz_month;
- (NSUInteger)xz_year;
- (NSUInteger)xz_hour;
- (NSUInteger)xz_minute;
- (NSUInteger)xz_second;

+ (NSUInteger)xz_day:(NSDate *)date;
+ (NSUInteger)xz_month:(NSDate *)date;
+ (NSUInteger)xz_year:(NSDate *)date;
+ (NSUInteger)xz_hour:(NSDate *)date;
+ (NSUInteger)xz_minute:(NSDate *)date;
+ (NSUInteger)xz_second:(NSDate *)date;

/**
 *  周(年内）、周几、周(月内）
 *  【注意】这几项均以当前日历下的默认起始星期为一周的第一天进行的计算
 */
- (NSUInteger)xz_weekDay;
- (NSUInteger)xz_weekOfYear;
- (NSUInteger)xz_weekOfMonth;

+ (NSUInteger)xz_weekDay:(NSDate *)date;
+ (NSUInteger)xz_weekOfYear:(NSDate *)date;
+ (NSUInteger)xz_weekOfMonth:(NSDate *)date;



/**
 * 获取一年中的总天数
 */
- (NSUInteger)xz_daysInYear;
+ (NSUInteger)xz_daysInYear:(NSDate *)date;


/**
 * 获取指定月份的天数
 */
- (NSUInteger)xz_daysInMonthNumber:(NSUInteger)month;
+ (NSUInteger)xz_daysInMonth:(NSDate *)date monthNumber:(NSUInteger)month;

/**
 * 获取当前月份的天数
 */
- (NSUInteger)xz_daysInMonth;
+ (NSUInteger)xz_daysInMonth:(NSDate *)date;


/**
 * 返回当前月一共有几周(可能为4,5,6)
 */
- (NSUInteger)xz_weeksOfMonth;
+ (NSUInteger)xz_weeksOfMonth:(NSDate *)date;





/**
 * 获取该月的第一天的日期
 */
- (NSDate *)xz_begindayOfMonth;
+ (NSDate *)xz_begindayOfMonth:(NSDate *)date;

/**
 * 获取该月的最后一天的日期
 */
- (NSDate *)xz_lastdayOfMonth;
+ (NSDate *)xz_lastdayOfMonth:(NSDate *)date;

/**
 *  获取X个月后第一天的日期
 */
- (NSDate *)xz_firstDayOffsetMonths:(NSInteger)offsetMonths;
+ (NSDate *)xz_firstDayOffsetMonths:(NSInteger)offsetMonths fromDate:(NSDate *)fromDate;

/**
 *  获取X个月后最后一天的日期
 */
- (NSDate *)xz_lastDayOffsetMonths:(NSInteger)offsetMonths;
+ (NSDate *)xz_lastDayOffsetMonths:(NSInteger)offsetMonths fromDate:(NSDate *)fromDate;



/**
 * 返回numYears年后的日期
 */
- (NSDate *)xz_offsetYears:(NSInteger)numYears;
+ (NSDate *)xz_offsetYears:(NSInteger)numYears fromDate:(NSDate *)fromDate;

/**
 * 返回numMonths月后的日期
 */
- (NSDate *)xz_offsetMonths:(NSInteger)numMonths;
+ (NSDate *)xz_offsetMonths:(NSInteger)numMonths fromDate:(NSDate *)fromDate;

/**
 * 返回numWeeks月后的日期
 */
- (NSDate *)xz_offsetWeeks:(NSInteger)numWeeks;
+ (NSDate *)xz_offsetWeeks:(NSInteger)numWeeks fromDate:(NSDate *)fromDate;

/**
 * 返回numDays天后的日期
 */
- (NSDate *)xz_offsetDays:(NSInteger)numDays;
+ (NSDate *)xz_offsetDays:(NSInteger)numDays fromDate:(NSDate *)fromDate;

/**
 * 返回numHours小时后的日期
 */
- (NSDate *)xz_offsetHours:(NSInteger)hours;
+ (NSDate *)xz_offsetHours:(NSInteger)numHours fromDate:(NSDate *)fromDate;



/**
 * 某日期距离今天共几天
 */
- (NSUInteger)xz_daysAgo;
+ (NSUInteger)xz_daysAgo:(NSDate *)date;

/**
 *  几天距离某日期共几天
 */
- (NSUInteger)xz_daysAfter;
+ (NSUInteger)xz_dayAfter:(NSDate *)date;


@end
