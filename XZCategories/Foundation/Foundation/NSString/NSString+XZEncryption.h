//
//  NSString+XZEncryption.h
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/12.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (XZEncryption)

- (NSString*)xz_encryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv;
- (NSString*)xz_decryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv;

- (NSString*)xz_encryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv;
- (NSString*)xz_decryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv;


@end

@interface NSString (XZBase64)

/// 字符串 base64后的字符串
+ (NSString *)xz_stringWithBase64EncodedString:(NSString *)string;

/**
 *  对字符串进行base64编码
 *  @param wrapWidth 换行长度  76  64
 *  @return base64后的字符串
 */
- (NSString *)xz_base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth;

/// 字符串 base64后的字符串
- (NSString *)xz_base64EncodedString;

/// 字符串 base64后的data
- (NSData *)xz_base64DecodedData;
@end


@interface NSString (XZHash)
@property (readonly) NSString *xz_md5String;
@property (readonly) NSString *xz_sha1String;
@property (readonly) NSString *xz_sha256String;
@property (readonly) NSString *xz_sha512String;

- (NSString *)xz_hmacMD5StringWithKey:(NSString *)key;
- (NSString *)xz_hmacSHA1StringWithKey:(NSString *)key;
- (NSString *)xz_hmacSHA256StringWithKey:(NSString *)key;
- (NSString *)xz_hmacSHA512StringWithKey:(NSString *)key;
@end