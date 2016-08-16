//
//  NSDateTests.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/14.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSDate+XZUtilities.h"
#import "NSDate+XZExtension.h"
#import "NSDate+XZFormatString.h"

@interface NSDateTests : XCTestCase

@end

@implementation NSDateTests

- (void)testXZUtilities
{
    
    NSDate *tomorrow = [NSDate xz_tomorrow];
    NSDate *yesterday = [NSDate xz_yesterday];
    NSDate *daysAfter = [NSDate xz_dateWithDaysFromNow:2];
    NSDate *daysBerore = [NSDate xz_dateWithDaysBeforeNow:2];
    NSDate *hoursAfter = [NSDate xz_dateWithHoursFromNow:2];
    NSDate *hoursBerore = [NSDate xz_dateWithHoursBeforeNow:2];
    NSDate *minsAfter = [NSDate xz_dateWithMinutesFromNow:2];
    NSDate *minsBerore = [NSDate xz_dateWithMinutesBeforeNow:2];
    
    NSDate *birthDay = [NSDate xz_dateWithYear:1990 month:2 day:18];
    NSString *timeStamp = [birthDay xz_toTimeStamp];
    NSDate *stampDate = [NSDate xz_toDateWithTimeStamp:timeStamp];
}

@end
