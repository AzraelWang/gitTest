//
//  NSString+XZRegular.h
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/11.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (XZRegular)

/**
 *  是否纯字母
 */
- (BOOL)xz_isChar;
/**
 *  纯汉字
 */
- (BOOL)xz_isValidChinese;

/**
 *  是否非负整数
 */
- (BOOL)xz_isUnsignedInt;

/**
 *  是否是数字或者字母
 */
- (BOOL)xz_isCharAndNum;

/**
 *  是否符合用户名格式要求(只含有汉字、数字、字母、下划线不能以下划线开头和结尾)
 */
- (BOOL)xz_isUserNameFormWithMinLenth:(NSInteger)minLenth
                             maxLenth:(NSInteger)maxLenth;

/**
 *  是否符合密码格式要求(字母、数字、符号)
 */
- (BOOL)xz_isPasswordFormWithMinLenth:(NSInteger)minLenth
                             maxLenth:(NSInteger)maxLenth;

/**
 *  密码是连续的或者相同的认为密码过于简单（虽然这种需求很sb，但是还是得写）
 */
- (BOOL)xz_passwordIsSimple;

/**
 *  手机号有效性
 */
- (BOOL)xz_isMobileNumber;

/**
 *  邮箱的有效性
 */
- (BOOL)xz_isEmailAddress;


/**
 *  身份证号码有效性检测
 */
+ (BOOL)xz_accurateVerifyIDCardNumber:(NSString *)value;


/**
 *  银行卡的有效性
 *  注意：0、必须为16位的纯数字
 *       1、部分银行的部分卡片不符合LUHN算法校验
 *       2、LUHN算法只是能校验卡号是否有效，并不能校验卡号和用户名等是否一致
 */
- (BOOL)xz_bankCardluhmCheck;


/**
 *  是否符合最小长度、最长长度
 *
 *  @param minLenth 最小长度
 *  @param maxLenth 最大长度
 *
 *  @return 正则验证成功返回YES, 否则返回NO
 */
- (BOOL)xz_isValidWithMinLenth:(NSInteger)minLenth
                      maxLenth:(NSInteger)maxLenth;

@end
