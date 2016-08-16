//
//  NSDate+XZExtension.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/12.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import "NSDate+XZExtension.h"
#import "NSDate+XZUtilities.h"

@implementation NSDate (XZExtension)

- (NSUInteger)xz_day {
    return [NSDate xz_day:self];
}

- (NSUInteger)xz_month {
    return [NSDate xz_month:self];
}

- (NSUInteger)xz_year {
    return [NSDate xz_year:self];
}

- (NSUInteger)xz_hour {
    return [NSDate xz_hour:self];
}

- (NSUInteger)xz_minute {
    return [NSDate xz_minute:self];
}

- (NSUInteger)xz_second {
    return [NSDate xz_second:self];
}

- (NSUInteger)xz_weekOfYear
{
    return [NSDate xz_weekOfYear:self];
}

- (NSUInteger)xz_weekDay
{
    return [NSDate xz_weekDay:self];
}

- (NSUInteger)xz_weekOfMonth
{
    return [NSDate xz_weekOfMonth:self];
}

+ (NSUInteger)xz_day:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitDay) fromDate:date];
    return [dayComponents day];
}

+ (NSUInteger)xz_month:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitMonth) fromDate:date];
    return [dayComponents month];
}

+ (NSUInteger)xz_year:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitYear) fromDate:date];
    return [dayComponents year];
}

+ (NSUInteger)xz_hour:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitHour) fromDate:date];
    return [dayComponents hour];
}

+ (NSUInteger)xz_minute:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitMinute) fromDate:date];
    return [dayComponents minute];
}

+ (NSUInteger)xz_second:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitSecond) fromDate:date];
    return [dayComponents second];
}

+ (NSUInteger)xz_weekOfYear:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dayComponents = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekOfYear
                                                  fromDate:date];
    return [dayComponents weekOfYear];
}


+ (NSUInteger)xz_weekDay:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dayComponents = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday
                                                  fromDate:date];
    return [dayComponents weekday];
}


+ (NSUInteger)xz_weekOfMonth:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dayComponents = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekOfMonth
                                                  fromDate:date];
    return [dayComponents weekOfMonth];
}


/**
 * 获取一年中的总天数
 */
- (NSUInteger)xz_daysInYear
{
    return [NSDate xz_daysInYear:self];
}

+ (NSUInteger)xz_daysInYear:(NSDate *)date
{
    return [self xz_isLeapYear:date] ? 366 : 365;
}


/**
 * 获取指定月份的天数
 */
- (NSUInteger)xz_daysInMonthNumber:(NSUInteger)month
{
    return [NSDate xz_daysInMonth:self monthNumber:month];
}
+ (NSUInteger)xz_daysInMonth:(NSDate *)date monthNumber:(NSUInteger)month
{
    switch (month) {
        case 1: case 3: case 5: case 7: case 8: case 10: case 12:
            return 31;
        case 2:
            return [date xz_isLeapYear] ? 29 : 28;
    }
    return 30;
}

/**
 * 获取当前月份的天数
 */
- (NSUInteger)xz_daysInMonth
{
    return [NSDate xz_daysInMonth:self];
}
+ (NSUInteger)xz_daysInMonth:(NSDate *)date
{
    return [self xz_daysInMonth:date monthNumber:[date xz_month]];
}


/**
 * 返回当前月一共有几周(可能为4,5,6)
 */
- (NSUInteger)xz_weeksOfMonth
{
    return [NSDate xz_weeksOfMonth:self];
}
+ (NSUInteger)xz_weeksOfMonth:(NSDate *)date
{
    return [[NSCalendar currentCalendar] ordinalityOfUnit:NSCalendarUnitWeekOfMonth inUnit:NSCalendarUnitMonth forDate:[date xz_lastdayOfMonth]];
}


/**
 * 获取该月的第一天的日期
 */
- (NSDate *)xz_begindayOfMonth
{
    return [NSDate xz_begindayOfMonth:self];
}
+ (NSDate *)xz_begindayOfMonth:(NSDate *)date
{
    return [self xz_offsetDays:(-[date xz_day] + 1) fromDate:date];
}

/**
 * 获取该月的最后一天的日期
 */
- (NSDate *)xz_lastdayOfMonth
{
    return [NSDate xz_lastdayOfMonth:self];

}
+ (NSDate *)xz_lastdayOfMonth:(NSDate *)date
{
    NSDate *firstDayOfMonth = [self xz_begindayOfMonth:date];
    return [[firstDayOfMonth xz_offsetMonths:1] xz_offsetDays:-1];
}


/**
 *  获取X个月后第一天的日期
 */
- (NSDate *)xz_firstDayOffsetMonths:(NSInteger)offsetMonths
{
    return [NSDate xz_firstDayOffsetMonths:offsetMonths fromDate:self];
}

+ (NSDate *)xz_firstDayOffsetMonths:(NSInteger)offsetMonths fromDate:(NSDate *)fromDate
{
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.month = offsetMonths;
    return [[[NSCalendar currentCalendar] dateByAddingComponents:components toDate:fromDate options:0] xz_begindayOfMonth];
}


/**
 *  获取X个月后最后一天的日期
 */
- (NSDate *)xz_lastDayOffsetMonths:(NSInteger)offsetMonths
{
    return [NSDate xz_lastDayOffsetMonths:offsetMonths fromDate:self];
}
+ (NSDate *)xz_lastDayOffsetMonths:(NSInteger)offsetMonths fromDate:(NSDate *)fromDate
{
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.month = offsetMonths;
    
    return [[[NSCalendar currentCalendar] dateByAddingComponents:components toDate:fromDate options:0] xz_lastdayOfMonth];
}



/**
 * 返回numYears年后的日期
 */
- (NSDate *)xz_offsetYears:(NSInteger)numYears
{
    return [NSDate xz_offsetYears:numYears fromDate:self];
}
+ (NSDate *)xz_offsetYears:(NSInteger)numYears fromDate:(NSDate *)fromDate
{
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setYear:numYears];
    
    return [[NSCalendar currentCalendar] dateByAddingComponents:offsetComponents
                                                         toDate:fromDate
                                                        options:0];
}

/**
 * 返回numMonths月后的日期
 */
- (NSDate *)xz_offsetMonths:(NSInteger)numMonths
{
    return [NSDate xz_offsetMonths:numMonths fromDate:self];
}
+ (NSDate *)xz_offsetMonths:(NSInteger)numMonths fromDate:(NSDate *)fromDate
{
    NSDateComponents *offsetComponents = [NSDateComponents new];
    [offsetComponents setMonth:numMonths];
    return [[NSCalendar currentCalendar] dateByAddingComponents:offsetComponents
                                                         toDate:fromDate
                                                        options:0];
}


/**
 * 返回numWeeks月后的日期
 */
- (NSDate *)xz_offsetWeeks:(NSInteger)numWeeks
{
    return [NSDate xz_offsetWeeks:numWeeks fromDate:self];
}
+ (NSDate *)xz_offsetWeeks:(NSInteger)numWeeks fromDate:(NSDate *)fromDate
{
    NSDateComponents *offsetComponents = [NSDateComponents new];
    [offsetComponents setWeekOfYear:numWeeks];
    return [[NSCalendar currentCalendar] dateByAddingComponents:offsetComponents
                                                         toDate:fromDate
                                                        options:0];
}


/**
 * 返回numDays天后的日期
 */
- (NSDate *)xz_offsetDays:(NSInteger)numDays
{
    return [NSDate xz_offsetDays:numDays fromDate:self];
}
+ (NSDate *)xz_offsetDays:(NSInteger)numDays fromDate:(NSDate *)fromDate
{
    NSDateComponents *offsetComponents = [NSDateComponents new];
    [offsetComponents setDay:numDays];
    return [[NSCalendar currentCalendar] dateByAddingComponents:offsetComponents
                                                         toDate:fromDate
                                                        options:0];
}

/**
 * 返回numHours小时后的日期
 */
- (NSDate *)xz_offsetHours:(NSInteger)hours
{
    return [NSDate xz_offsetHours:hours fromDate:self];
}
+ (NSDate *)xz_offsetHours:(NSInteger)numHours fromDate:(NSDate *)fromDate
{
    NSDateComponents *offsetComponents = [NSDateComponents new];
    [offsetComponents setHour:numHours];
    return [[NSCalendar currentCalendar] dateByAddingComponents:offsetComponents
                                                         toDate:fromDate
                                                        options:0];
}

/**
 * 某日期距离今天共几天
 */
- (NSUInteger)xz_daysAgo
{
    return [NSDate xz_daysAgo:self];
}
+ (NSUInteger)xz_daysAgo:(NSDate *)date
{
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitDay
                                           fromDate:date
                                             toDate:[NSDate date]
                                            options:0] day];
}


/**
 *  今天距离某日期共几天
 */
- (NSUInteger)xz_daysAfter
{
    return [NSDate xz_dayAfter:self];
}
+ (NSUInteger)xz_dayAfter:(NSDate *)date
{
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitDay
                                            fromDate:[NSDate date]
                                              toDate:date
                                             options:0] day];
}
@end
