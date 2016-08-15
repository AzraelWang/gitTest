//
//  NSString+XZEncryption.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/12.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import "NSString+XZEncryption.h"
#import "NSData+XZEncrypt.h"
#import "NSData+XZBase64.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonHMAC.h>

@implementation NSString (XZEncryption)
-(NSString*)xz_encryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv {
    NSData *encrypted = [[self dataUsingEncoding:NSUTF8StringEncoding] xz_encryptedWithAESUsingKey:key andIV:iv];
    NSString *encryptedString = [encrypted xz_base64EncodedString];
    
    return encryptedString;
}

- (NSString*)xz_decryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv {
    NSData *decrypted = [[NSData xz_dataWithBase64EncodedString:self] xz_decryptedWithAESUsingKey:key andIV:iv];
    NSString *decryptedString = [[NSString alloc] initWithData:decrypted encoding:NSUTF8StringEncoding];
    
    return decryptedString;
}

- (NSString*)xz_encryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv {
    NSData *encrypted = [[self dataUsingEncoding:NSUTF8StringEncoding] xz_encryptedWith3DESUsingKey:key andIV:iv];
    NSString *encryptedString = [encrypted xz_base64EncodedString];
    
    return encryptedString;
}

- (NSString*)xz_decryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv {
    NSData *decrypted = [[NSData xz_dataWithBase64EncodedString:self] xz_decryptedWith3DESUsingKey:key andIV:iv];
    NSString *decryptedString = [[NSString alloc] initWithData:decrypted encoding:NSUTF8StringEncoding];
    
    return decryptedString;
}

@end

@implementation NSString (XZBase64)
+ (NSString *)xz_stringWithBase64EncodedString:(NSString *)string
{
    NSData *data = [NSData xz_dataWithBase64EncodedString:string];
    if (data)
    {
        return [[self alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return nil;
}

- (NSString *)xz_base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    return [data xz_base64EncodedStringWithWrapWidth:wrapWidth];
}

- (NSString *)xz_base64EncodedString
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    return [data xz_base64EncodedString];
}

- (NSData *)xz_base64DecodedData
{
    return [NSData xz_dataWithBase64EncodedString:self];
}
@end




@implementation NSString (XZHash)
- (NSString *)xz_md5String
{
    const char *string = self.UTF8String;
    int length = (int)strlen(string);
    unsigned char bytes[CC_MD5_DIGEST_LENGTH];
    CC_MD5(string, length, bytes);
    return [self xz_stringFromBytes:bytes length:CC_MD5_DIGEST_LENGTH];
}
- (NSString *)xz_sha1String
{
    const char *string = self.UTF8String;
    int length = (int)strlen(string);
    unsigned char bytes[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(string, length, bytes);
    return [self xz_stringFromBytes:bytes length:CC_SHA1_DIGEST_LENGTH];
}
- (NSString *)xz_sha256String
{
    const char *string = self.UTF8String;
    int length = (int)strlen(string);
    unsigned char bytes[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(string, length, bytes);
    return [self xz_stringFromBytes:bytes length:CC_SHA256_DIGEST_LENGTH];
}
- (NSString *)xz_sha512String
{
    const char *string = self.UTF8String;
    int length = (int)strlen(string);
    unsigned char bytes[CC_SHA512_DIGEST_LENGTH];
    CC_SHA512(string, length, bytes);
    return [self xz_stringFromBytes:bytes length:CC_SHA512_DIGEST_LENGTH];
}

- (NSString *)xz_hmacMD5StringWithKey:(NSString *)key {
    return [self xz_hmacStringUsingAlg:kCCHmacAlgMD5 withKey:key];
}
- (NSString *)xz_hmacSHA1StringWithKey:(NSString *)key
{
    return [self xz_hmacStringUsingAlg:kCCHmacAlgSHA1 withKey:key];
    
}
- (NSString *)xz_hmacSHA256StringWithKey:(NSString *)key
{
    return [self xz_hmacStringUsingAlg:kCCHmacAlgSHA256 withKey:key];
    
}
- (NSString *)xz_hmacSHA512StringWithKey:(NSString *)key
{
    return [self xz_hmacStringUsingAlg:kCCHmacAlgSHA512 withKey:key];
    
}
#pragma mark - Helpers
- (NSString *)xz_hmacStringUsingAlg:(CCHmacAlgorithm)alg withKey:(NSString *)key {
    size_t size;
    switch (alg) {
        case kCCHmacAlgMD5: size = CC_MD5_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA1: size = CC_SHA1_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA224: size = CC_SHA224_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA256: size = CC_SHA256_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA384: size = CC_SHA384_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA512: size = CC_SHA512_DIGEST_LENGTH; break;
        default: return nil;
    }
    
    NSData *keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    NSData *messageData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableData *mutableData = [NSMutableData dataWithLength:size];
    CCHmac(alg, keyData.bytes, keyData.length, messageData.bytes, messageData.length, mutableData.mutableBytes);
    return [self xz_stringFromBytes:(unsigned char *)mutableData.bytes length:(int)mutableData.length];
}
- (NSString *)xz_stringFromBytes:(unsigned char *)bytes length:(int)length
{
    NSMutableString *mutableString = @"".mutableCopy;
    for (int i = 0; i < length; i++)
        [mutableString appendFormat:@"%02x", bytes[i]];
    return [NSString stringWithString:mutableString];
}
@end