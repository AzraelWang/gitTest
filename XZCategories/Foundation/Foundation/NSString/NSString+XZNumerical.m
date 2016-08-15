//
//  NSString+XZNumerical.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/11.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import "NSString+XZNumerical.h"

@implementation NSString (XZNumerical)

/// 只能输入数字(不能有小数点等其他任何字符,首位可以为0)
- (BOOL)xz_limitDigital
{
    NSString *regex = @"^[0-9]*$";
    return [self xz_isValidateByRegex:regex];
}


/// 只能输入n位的数字
- (BOOL)xz_limitDigitalWithMaxDigits:(NSInteger)maxDigits
{
    NSString *regex = [NSString stringWithFormat:@"^\\d{%ld}$",maxDigits];
    return [self xz_isValidateByRegex:regex];
}


/// 只能输入至少n位的数字
- (BOOL)xz_limitDigitalWithMinDigits:(NSInteger)minDigits
{
    NSString *regex = [NSString stringWithFormat:@"^\\d{%ld,}$",minDigits];
    return [self xz_isValidateByRegex:regex];
}



/// 只能输入m~n位的数字
- (BOOL)xz_limitDigitalWithMinDigits:(NSInteger)minDigits
                           MaxDigits:(NSInteger)maxDigits
{
    NSString *regex = [NSString stringWithFormat:@"^\\d{%ld,%ld}$",minDigits,maxDigits];;
    return [self xz_isValidateByRegex:regex];
}


/// 只能输入零或非零开头的正整数
- (BOOL)xz_limitDigitalWithoutZeroAtTheBeginning
{
    NSString *regex = @"^(0|[1-9][0-9]*)$";
    return [self xz_isValidateByRegex:regex];
}


/// 只能输入非负整数和有两位小数的正实数
- (BOOL)xz_limitDigitalWithTwoDecimalPlaces
{
    NSString *regex = @"^[0-9]+(.[0-9]{2})?$";
    return [self xz_isValidateByRegex:regex];
}


/// 只能输入小数后几位
- (BOOL)xz_limitDigitalAfterTheDecimalPointMinLength:(NSInteger )minLength
                                           MaxLength:(NSInteger )maxLength
{
    NSString *regex = [NSString stringWithFormat:@"^[0-9]+(.[0-9]{%ld,%ld})?$",minLength,maxLength];
    return [self xz_isValidateByRegex:regex];
}


/// 只能输入非零的正整数
- (BOOL)xz_limitNonZeroPositiveInteger
{
    NSString *regex = @"^\\+?[1-9][0-9]*$";
    return [self xz_isValidateByRegex:regex];
}


/// 只能输入非零的负整数
- (BOOL)xz_limitNonZeroNegativeInteger
{
    NSString *regex = @"^\\-[1-9][0-9]*$";
    return [self xz_isValidateByRegex:regex];
}

- (BOOL)xz_isValidateByRegex:(NSString *)regex{
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pre evaluateWithObject:self];
}


@end
