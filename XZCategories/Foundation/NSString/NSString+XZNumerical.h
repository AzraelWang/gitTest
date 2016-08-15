//
//  NSString+XZNumerical.h
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/11.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (XZNumerical)

/// 只能输入数字(不能有小数点等其他任何字符,首位可以为0)
- (BOOL)xz_limitDigital;

/// 只能输入零或非零开头的正整数
- (BOOL)xz_limitDigitalWithoutZeroAtTheBeginning;

/// 只能输入非零的正整数
- (BOOL)xz_limitNonZeroPositiveInteger;

/// 只能输入非零的负整数
- (BOOL)xz_limitNonZeroNegativeInteger;

/// 只能输入n位的数字(首位可以为0,不可有符号)
- (BOOL)xz_limitDigitalWithMaxDigits:(NSInteger)maxDigits;

/// 只能输入至少n位的数字(首位可以为0,不可有符号)
- (BOOL)xz_limitDigitalWithMinDigits:(NSInteger)minDigits;


/// 只能输入m~n位的数字(首位可以为0,不可有符号)
- (BOOL)xz_limitDigitalWithMinDigits:(NSInteger)minDigits
                           MaxDigits:(NSInteger)maxDigits;

/// 只能输入非负整数和有两位小数的正实数
- (BOOL)xz_limitDigitalWithTwoDecimalPlaces;

/// 只能输入非负整数和最少有X位最多有Y位小数的正实数
- (BOOL)xz_limitDigitalAfterTheDecimalPointMinLength:(NSInteger )minLength
                                           MaxLength:(NSInteger )maxLength;

@end
