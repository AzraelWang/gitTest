//
//  NSString+XZPinyin.h
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/11.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (XZPinyin)
/**
 *  带音标的拼音（例：wǒ ài běi jīng tiān ān mén）,注意出现多音字结果不准确,并且只对中文起作用
 */
- (NSString*)xz_pinyinWithPhoneticSymbol;
/**
 *  纯拼音（例：wo ai bei jing tian an men）,注意出现多音字结果不准确,并且只对中文起作用
 */
- (NSString*)xz_pinyin;
/**
 *  拼音数组（例：wo，ai，bei，jing，tian，an，men）,注意出现多音字结果不准确
 */
- (NSArray*)xz_pinyinArray;
/**
 *  拼音不带空格（例：woaibeijingtiananmen）,注意出现多音字结果不准确
 */
- (NSString*)xz_pinyinWithoutBlank;
/**
 *  拼音首字母数组（例：w,a,b,j,t,a,m）,注意出现多音字结果不准确
 */
- (NSArray*)xz_pinyinInitialsArray;
/**
 *  拼音首字母字符串（例：wabjtam）,注意出现多音字结果不准确
 */
- (NSString*)xz_pinyinInitialsString;
/**
 *  表情转字符（例：😀-> {GRINNING FACE} ; 🐶 -> {DOG FACE} ）
 */
- (NSString*)xz_emojiTransformToUnicodeName;

@end
