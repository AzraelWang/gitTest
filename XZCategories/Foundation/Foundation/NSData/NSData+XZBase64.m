//
//  NSData+XZBase64.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/12.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import "NSData+XZBase64.h"
#pragma GCC diagnostic ignored "-Wselector"
#import <Availability.h>

@implementation NSData (XZBase64)

/// 传入字符串 base64后的data
+ (NSData *)xz_dataWithBase64EncodedString:(NSString *)string
{
    if (![string length]) return nil;
    NSData *decoded = nil;
    decoded = [[self alloc] initWithBase64EncodedString:string options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return [decoded length]? decoded: nil;
}

/**
 *  @brief  NSData转string
 *  @param wrapWidth 换行长度  76  64
 *  @return base64后的字符串
 */
- (NSString *)xz_base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth
{
    if (![self length]) return nil;
    NSString *encoded = nil;
    switch (wrapWidth)
    {
        case 64:
        {
            return [self base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        }
        case 76:
        {
            return [self base64EncodedStringWithOptions:NSDataBase64Encoding76CharacterLineLength];
        }
        default:
        {
            encoded = [self base64EncodedStringWithOptions:(NSDataBase64EncodingOptions)0];
        }
    }

    if (!wrapWidth || wrapWidth >= [encoded length])
    {
        return encoded;
    }
    wrapWidth = (wrapWidth / 4) * 4;
    NSMutableString *result = [NSMutableString string];
    for (NSUInteger i = 0; i < [encoded length]; i+= wrapWidth)
    {
        if (i + wrapWidth >= [encoded length])
        {
            [result appendString:[encoded substringFromIndex:i]];
            break;
        }
        [result appendString:[encoded substringWithRange:NSMakeRange(i, wrapWidth)]];
        [result appendString:@"\r\n"];
    }
    return result;
}
/**
 *  @brief  NSData转string 换行长度默认64
 *  @return base64后的字符串
 */
- (NSString *)xz_base64EncodedString
{
    return [self xz_base64EncodedStringWithWrapWidth:0];
}

@end
