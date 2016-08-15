//
//  NSString+XZURLEncode.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/12.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import "NSString+XZURLEncode.h"

@implementation NSString (XZURLEncode)

/// urlEncode 后的字符串
- (NSString *)xz_urlEncode {
    return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"!*'\"();:@&=+$,/?%#[]% "]];
}

/// urlDecode 后的字符串
- (NSString *)xz_urlDecode {
    return [self stringByRemovingPercentEncoding];
}

/// url query转成NSDictionary
- (NSDictionary *)xz_dictionaryFromURLParameters
{
    NSArray *pairs = [self componentsSeparatedByString:@"&"];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    for (NSString *pair in pairs) {
        NSArray *kv = [pair componentsSeparatedByString:@"="];
        NSString *val = [[kv objectAtIndex:1] stringByRemovingPercentEncoding];
        [params setObject:val forKey:[kv objectAtIndex:0]];
    }
    return params;
}
@end
