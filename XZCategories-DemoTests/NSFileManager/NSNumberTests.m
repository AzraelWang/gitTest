//
//  NSNumberTests.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/9.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSNumber+XZRound.h"
#import "NSNumber+XZNumberFormat.h"
@interface NSNumberTests : XCTestCase

@end

@implementation NSNumberTests

- (void)testRound {
    
   NSString *newValue = [[NSNumber numberWithFloat:23.4543] xz_toDisplayNumberWithDigit:2];
    NSLog(@"\n\n\n newValue = %@ \n\n\n",newValue);
    
    NSString *newValue1 = [[NSNumber numberWithFloat:0.853492] xz_toDisplayPercentageWithDigit:2];
    NSLog(@"\n\n\n newValue = %@ \n\n\n",newValue1);
    
    NSNumber *newValue2 = [[NSNumber numberWithFloat:1234.856] xz_doRoundWithDigit:2];
    NSLog(@"\n\n\n newValue = %@ \n\n\n",newValue2);
    
    NSNumber *newValue3 = [[NSNumber numberWithFloat:1234.852] xz_doCeilWithDigit:2];
    NSLog(@"\n\n\n newValue = %@ \n\n\n",newValue3);
    
    NSNumber *newValue4 = [[NSNumber numberWithFloat:1234.852] xz_doFloorWithDigit:2];
    NSLog(@"\n\n\n newValue = %@ \n\n\n",newValue4);
    
}

- (void)testFormat
{
    //    /**123456789*/
    //    NumberFormatNone,
    //    /**1,234,567.837*/
    //    NumberFormatDecimal,
    //    /**￥123,456,789.00*/
    //    NumberFormatCurrency,
    //    /**123,456,789.00*/
    //    NumberFormatCurrencyNoSymbol,
    //    /**123,456,789.00元*/
    //    NumberFormatYuan,

    NSArray *testArray = @[@(NumberFormatNone),@(NumberFormatDecimal),@(NumberFormatCurrency),@(NumberFormatCurrencyNoSymbol)];
    for (NSNumber *format in testArray) {
        NSString *result = [[NSNumber numberWithUnsignedInteger:123456789] xz_stringWithFormat:format.intValue];
        NSLog(@"\n\n result = %@ \n\n",result);
    }
}

@end
