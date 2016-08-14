//
//  NSDate+XZUtilities.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/12.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import "NSDate+XZUtilities.h"
#import "NSDate+XZExtension.h"
#define D_MINUTE	60
#define D_HOUR	    3600
#define D_DAY	    86400
#define D_WEEK	    604800
#define D_YEAR	    31556926

#define DATE_COMPONENTS (NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekOfYear | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal)

@implementation NSDate (XZUtilities)

#pragma mark - 天比较
- (BOOL) xz_isEqualToDateIgnoringTime: (NSDate *) aDate
{
    NSDateComponents *components1 = [[NSCalendar currentCalendar] components:DATE_COMPONENTS fromDate:self];
    NSDateComponents *components2 = [[NSCalendar currentCalendar] components:DATE_COMPONENTS fromDate:aDate];
    return ((components1.year == components2.year) &&
            (components1.month == components2.month) &&
            (components1.day == components2.day));
}
- (BOOL) xz_isToday
{
    return [self xz_isEqualToDateIgnoringTime:[NSDate date]];
}
- (BOOL) xz_isTomorrow
{
    return [self xz_isEqualToDateIgnoringTime:[NSDate xz_tomorrow]];
}
- (BOOL) xz_isYesterday
{
    return [self xz_isEqualToDateIgnoringTime:[NSDate xz_yesterday]];
}


#pragma mark - 周比较
- (BOOL) xz_isSameWeekAsDate: (NSDate *) aDate
{
    NSDateComponents *components1 = [[NSCalendar currentCalendar] components:DATE_COMPONENTS fromDate:self];
    NSDateComponents *components2 = [[NSCalendar currentCalendar] components:DATE_COMPONENTS fromDate:aDate];
    if (components1.weekOfYear != components2.weekOfYear) return NO;
    return (fabs([self timeIntervalSinceDate:aDate]) < D_WEEK);
}
- (BOOL) xz_isThisWeek
{
    return [self xz_isSameWeekAsDate:[NSDate date]];
}
- (BOOL) xz_isNextWeek
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + D_WEEK;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return [self xz_isSameWeekAsDate:newDate];
}
- (BOOL)xz_isLastWeek
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - D_WEEK;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return [self xz_isSameWeekAsDate:newDate];
}


#pragma mark - 月比较
- (BOOL)xz_isSameMonthAsDate: (NSDate *) aDate
{
    NSDateComponents *components1 = [[NSCalendar currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:self];
    NSDateComponents *components2 = [[NSCalendar currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:aDate];
    return ((components1.month == components2.month) &&
            (components1.year == components2.year));
}

- (BOOL)xz_isThisMonth
{
    return [self xz_isSameMonthAsDate:[NSDate date]];
}

- (BOOL) xz_isLastMonth
{
    return [self xz_isSameMonthAsDate:[self xz_offsetMonths:1]];
}

- (BOOL) xz_isNextMonth
{
    return [self xz_isSameMonthAsDate:[self xz_offsetMonths:-1]];
}


#pragma mark - 年比较
- (BOOL)xz_isSameYearAsDate: (NSDate *) aDate
{
    NSDateComponents *components1 = [[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *components2 = [[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:aDate];
    return (components1.year == components2.year);
}
- (BOOL) xz_isThisYear
{
    return [self xz_isSameYearAsDate:[NSDate date]];
}
- (BOOL) xz_isNextYear
{
    NSDateComponents *components1 = [[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *components2 = [[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:[NSDate date]];
    return (components1.year == (components2.year + 1));
}
- (BOOL) xz_isLastYear
{
    NSDateComponents *components1 = [[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *components2 = [[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:[NSDate date]];
    return (components1.year == (components2.year - 1));
}



- (BOOL) xz_isEarlierThanDate: (NSDate *) aDate
{
    return ([self compare:aDate] == NSOrderedAscending);
}
- (BOOL) xz_isLaterThanDate: (NSDate *) aDate
{
    return ([self compare:aDate] == NSOrderedDescending);
}
- (BOOL) xz_isInFuture
{
    return ([self xz_isLaterThanDate:[NSDate date]]);
}
- (BOOL) xz_isInPast
{
    return ([self xz_isEarlierThanDate:[NSDate date]]);
}


- (BOOL)xz_isLeapYear {
    return [NSDate xz_isLeapYear:self];
}

+ (BOOL)xz_isLeapYear:(NSDate *)date {
    NSUInteger year = [date xz_year];
    if ((year % 4  == 0 && year % 100 != 0) || year % 400 == 0) {
        return YES;
    }
    return NO;
}


- (NSDate *)xz_dateByAddingDays:(NSUInteger)days {
    NSDateComponents *c = [[NSDateComponents alloc] init];
    c.day = days;
    return [[NSCalendar currentCalendar] dateByAddingComponents:c toDate:self options:0];
}

- (NSDate *) xz_dateBySubtractingDays: (NSInteger) dDays
{
    return [self xz_dateByAddingDays: (dDays * -1)];
}
+ (NSDate *)xz_tomorrow
{
    return [[NSDate date] xz_dateByAddingDays:1];
}
+ (NSDate *)xz_yesterday
{
    return [[NSDate date] xz_dateBySubtractingDays:1];
}
+ (NSDate *)xz_dateWithDaysFromNow      : (NSInteger) days
{
    return [[NSDate date] xz_dateByAddingDays:days];
}
+ (NSDate *)xz_dateWithDaysBeforeNow    : (NSInteger) days
{
    return [[NSDate date] xz_dateBySubtractingDays:days];
}
+ (NSDate *)xz_dateWithHoursFromNow     : (NSInteger) hours
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + D_HOUR * hours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}
+ (NSDate *)xz_dateWithHoursBeforeNow   : (NSInteger) hours
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - D_HOUR * hours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}
+ (NSDate *)xz_dateWithMinutesFromNow   : (NSInteger) minutes
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + D_MINUTE * minutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}
+ (NSDate *)xz_dateWithMinutesBeforeNow : (NSInteger) minutes
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - D_MINUTE * minutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}


+ (NSDate *)xz_dateWithYear:(NSInteger)year month:(NSUInteger)month day:(NSUInteger)day {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:year];
    [components setMonth:month];
    [components setDay:day];
    return [calendar dateFromComponents:components];
}

@end
