//
//  NSDate+XZUtilities.h
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/12.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (XZUtilities)

- (BOOL)xz_isEqualToDateIgnoringTime:(NSDate *) aDate;

- (BOOL)xz_isToday;
- (BOOL)xz_isTomorrow;
- (BOOL)xz_isYesterday;

- (BOOL)xz_isSameWeekAsDate:(NSDate *) aDate;
- (BOOL)xz_isThisWeek;
- (BOOL)xz_isNextWeek;
- (BOOL)xz_isLastWeek;

- (BOOL)xz_isSameMonthAsDate:(NSDate *) aDate;
- (BOOL)xz_isThisMonth;
- (BOOL)xz_isNextMonth;
- (BOOL)xz_isLastMonth;

- (BOOL)xz_isSameYearAsDate:(NSDate *) aDate;
- (BOOL)xz_isThisYear;
- (BOOL)xz_isNextYear;
- (BOOL)xz_isLastYear;

- (BOOL)xz_isEarlierThanDate:(NSDate *) aDate;
- (BOOL)xz_isLaterThanDate:(NSDate *) aDate;

- (BOOL)xz_isInFuture;
- (BOOL)xz_isInPast;

- (BOOL)xz_isLeapYear;
+ (BOOL)xz_isLeapYear:(NSDate *)date;


+ (NSDate *)xz_tomorrow;
+ (NSDate *)xz_yesterday;
+ (NSDate *)xz_dateWithDaysFromNow      : (NSInteger) days;
+ (NSDate *)xz_dateWithDaysBeforeNow    : (NSInteger) days;
+ (NSDate *)xz_dateWithHoursFromNow     : (NSInteger) hours;
+ (NSDate *)xz_dateWithHoursBeforeNow   : (NSInteger) hours;
+ (NSDate *)xz_dateWithMinutesFromNow   : (NSInteger) minutes;
+ (NSDate *)xz_dateWithMinutesBeforeNow : (NSInteger) minutes;
+ (NSDate *)xz_dateWithYear:(NSInteger)year
                      month:(NSUInteger)month
                        day:(NSUInteger)day;
+ (NSDate *)xz_toDateWithTimeStamp:(NSString *)timeStamp;


@end
