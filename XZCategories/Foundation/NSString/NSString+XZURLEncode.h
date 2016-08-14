//
//  NSString+XZURLEncode.h
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/12.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (XZURLEncode)

/// urlEncode 后的字符串
- (NSString *)xz_urlEncode;

/// urlDecode 后的字符串
- (NSString *)xz_urlDecode;

/// url query转成NSDictionary
- (NSDictionary *)xz_dictionaryFromURLParameters;

@end
