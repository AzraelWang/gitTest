//
//  NSData+XZBase64.h
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/12.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (XZBase64)

/// 传入字符串 base64后的data
+ (NSData *)xz_dataWithBase64EncodedString:(NSString *)string;

/**
 *  @brief  NSData转string
 *  @param wrapWidth 换行长度  76  64
 *  @return base64后的字符串
 */
- (NSString *)xz_base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth;

/**
 *  @brief  NSData转string 换行长度默认64
 *  @return base64后的字符串
 */
- (NSString *)xz_base64EncodedString;
@end
