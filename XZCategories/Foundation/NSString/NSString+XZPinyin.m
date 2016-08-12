//
//  NSString+XZPinyin.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/11.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import "NSString+XZPinyin.h"

@implementation NSString (XZPinyin)

- (NSString*)xz_pinyinWithPhoneticSymbol{
    NSMutableString *pinyin = [NSMutableString stringWithString:self];
    CFStringTransform((__bridge CFMutableStringRef)(pinyin), NULL, kCFStringTransformMandarinLatin, NO);
    return pinyin;
}

- (NSString*)xz_pinyin{
    NSMutableString *pinyin = [NSMutableString stringWithString:[self xz_pinyinWithPhoneticSymbol]];
    CFStringTransform((__bridge CFMutableStringRef)(pinyin), NULL, kCFStringTransformStripCombiningMarks, NO);
    return pinyin;
}

- (NSArray*)xz_pinyinArray{
    NSArray *array = [[self xz_pinyin] componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    return array;
}

- (NSString*)xz_pinyinWithoutBlank{
    NSMutableString *string = [NSMutableString stringWithString:@""];
    for (NSString *str in [self xz_pinyinArray]) {
        [string appendString:str];
    }
    return string;
}

- (NSArray*)xz_pinyinInitialsArray{
    NSMutableArray *array = [NSMutableArray array];
    for (NSString *str in [self xz_pinyinArray]) {
        if ([str length] > 0) {
            [array addObject:[str substringToIndex:1]];
        }
    }
    return array;
}

- (NSString*)xz_pinyinInitialsString{
    NSMutableString *pinyin = [NSMutableString stringWithString:@""];
    for (NSString *str in [self xz_pinyinArray]) {
        if ([str length] > 0) {
            [pinyin appendString:[str substringToIndex:1]];
        }
    }
    return pinyin;
}

- (NSString*)xz_emojiTransformToUnicodeName
{
    NSMutableString *pinyin = [NSMutableString stringWithString:self];
    CFStringTransform((__bridge CFMutableStringRef)(pinyin), NULL, kCFStringTransformToUnicodeName, NO);
    return pinyin;
}

@end
