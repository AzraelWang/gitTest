//
//  NSStringTests.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/11.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+XZPinyin.h"
#import "NSString+XZRegular.h"
#import "NSString+XZNumerical.h"
#import "NSString+XZURLEncode.h"
@interface NSStringTests : XCTestCase

@end

@implementation NSStringTests

- (void)testExample {
    NSString *testString = @"I LOVE Apple";
    
    NSString *result0 = [testString xz_pinyinWithPhoneticSymbol];
    NSLog(@"\n\n xz_pinyinWithPhoneticSymbol : %@\n\n",result0);
    
    NSString *result1 = [testString xz_pinyin];
    NSLog(@"\n\n xz_pinyin : %@\n\n",result1);
    
    
    NSArray *result2 = [testString xz_pinyinArray];
    NSLog(@"\n\n xz_pinyinArray : %@\n\n",result2);
    
    
    NSString *result3 = [testString xz_pinyinWithoutBlank];
    NSLog(@"\n\n xz_pinyinWithoutBlank : %@\n\n",result3);
    
    
    NSArray *result4 = [testString xz_pinyinInitialsArray];
    NSLog(@"\n\n xz_pinyinInitialsArray : %@\n\n",result4);
    
    NSString *result5 = [testString xz_pinyinInitialsString];
    NSLog(@"\n\n xz_pinyinInitialsString : %@\n\n",result5);
    
    
    NSString *result6 =[@"😀🐶🍏" xz_emojiTransformToUnicodeName];
    NSLog(@"\n\n xz_emojiTransformToUnicodeName : %@\n\n",result6);
}


-(void)testRegular{
    NSArray *testArray = @[@"iloveapple",
                           @"i love 2 apple 哈哈",
                           @"聂凯华",
                           @"聂凯华acd123",
                           @"15623456789",
                           @"1562s345d678e9",
                           @"-1244",
                           @"3.1415926",
                           @"6214830103201322",
                           @"my name is niekaihua $&%#$*",
                           @"130182198802091430",
                           @"ajow_oweijfw_00",
                           @"123456_abcde",
                           @"abde_1234@163.com",
                           @"130182199003457643"];
    
    for (NSString *testText in testArray) {
        NSLog(@"%@ _isChar : %@",testText,[testText xz_isChar] ?@"YES":@"NO");
        NSLog(@"%@ _isValidChinese : %@",testText,[testText xz_isValidChinese] ?@"YES":@"NO");
        NSLog(@"%@ _isCharAndNum : %@",testText,[testText xz_isCharAndNum] ?@"YES":@"NO");
        NSLog(@"%@ _isUnsignedInt : %@",testText,[testText xz_isUnsignedInt] ?@"YES":@"NO");
        NSLog(@"%@ _isUserNameForm : %@",testText,[testText xz_isUserNameFormWithMinLenth:2 maxLenth:10] ?@"YES":@"NO");
        NSLog(@"%@ _isPasswordForm : %@",testText,[testText xz_isPasswordFormWithMinLenth:6 maxLenth:12] ?@"YES":@"NO");
        NSLog(@"%@ _isMobileNumber : %@",testText,[testText xz_isMobileNumber] ?@"YES":@"NO");
        NSLog(@"%@ _isEmailAddress : %@",testText,[testText xz_isEmailAddress] ?@"YES":@"NO");
        NSLog(@"%@ _accurateVerifyIDCardNumber : %@",testText,[NSString xz_accurateVerifyIDCardNumber:testText] ?@"YES":@"NO");
        NSLog(@"%@ _bankCardluhmCheck : %@",testText,[testText xz_bankCardluhmCheck] ?@"YES":@"NO");
        NSLog(@"\n\n\n");
    }
}


- (void)testLimitNumerical{
    NSArray *testArray = @[@"0",
                           @"01",
                           @"012",
                           @"012.3",
                           @"012.34",
                           @"012.345",
                           @"012.3456",
                           @"012.34567",
                           @"1",
                           @"12",
                           @"123",
                           @"123.4",
                           @"1234.5",
                           @"1234.56",
                           @"1234.567",
                           @"1234.5678",
                           @"-0",
                           @"-01",
                           @"-12",
                           @"-123",
                           @"-123.4",
                           @"-123.45",
                           @"-123.456",
                           @"-123.4578",
                           ];
    
    for (NSString *testText in testArray) {

        NSLog(@"%@ limitDigital : %@",testText,[testText xz_limitDigital] ?@"YES":@"NO");
        NSLog(@"%@ limitDigitalWithMaxDigits_%d : %@",testText,2,[testText xz_limitDigitalWithMaxDigits:2] ?@"YES":@"NO");
        NSLog(@"%@ limitDigitalWithMinDigits_%d : %@",testText,2,[testText xz_limitDigitalWithMinDigits:2] ?@"YES":@"NO");
        NSLog(@"%@ limitDigitalWithMinDigits_%d MaxDigits_%d : %@",testText,2,3,[testText xz_limitDigitalWithMinDigits:2 MaxDigits:3] ?@"YES":@"NO");
        NSLog(@"%@ limitDigitalWithoutZeroAtTheBeginning : %@",testText,[testText xz_limitDigitalWithoutZeroAtTheBeginning] ?@"YES":@"NO");
        NSLog(@"%@ limitDigitalWithTwoDecimalPlaces : %@",testText,[testText xz_limitDigitalWithTwoDecimalPlaces] ?@"YES":@"NO");
        NSLog(@"%@ limitDigitalAfterTheDecimalPointMinLength_%d MaxLength_%d : %@",testText,2,3,[testText xz_limitDigitalAfterTheDecimalPointMinLength:2 MaxLength:3] ?@"YES":@"NO");
        NSLog(@"%@ limitNonZeroPositiveInteger : %@",testText,[testText xz_limitNonZeroPositiveInteger] ?@"YES":@"NO");
        NSLog(@"%@ limitNonZeroNegativeInteger : %@",testText,[testText xz_limitNonZeroNegativeInteger] ?@"YES":@"NO");
        NSLog(@"\n\n\n");
    }
}

-(void)testURLEncode{
    
    NSString *testText = @"周杰伦 jaychou";
    NSString *urlEncode = [testText xz_urlEncode];
    NSString *urlDecode = [urlEncode xz_urlDecode];
    NSLog(@"urlEncode is %@",urlEncode);
    NSLog(@"urlDecode is %@",urlDecode);
    
    NSString *testString = @"https://wireless.xiaozhu.com/app/xzfk/ios/3.4.0/search/result?radius=2&minPrice=0&cityName=%E4%B8%8A%E6%B5%B7&longitude=116.197075&guestNum=0&orderBy=recommend&length=10&latitude=39.913414&locId=2w&sessId=236d65f0a01e1da25f119f7131d2e85d&userId=438404500&offset=0&xzsign=md5_42e4c12b019e7fc92fa3fda79b3953e5&cityId=13&_=1470389269106";
    NSDictionary *dic = [[NSURL URLWithString:testString].query xz_dictionaryFromURLParameters];
    NSLog(@"dic = %@",dic);
}


@end
