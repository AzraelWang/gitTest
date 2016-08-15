//
//  NSDictionary+XZURL.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/9.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import "NSDictionary+XZURL.h"
#import <UIKit/UIKit.h>

@implementation NSDictionary (XZURL)

- (NSString *)xz_URLQueryString
{
    NSMutableString *string = [NSMutableString string];
    for (NSString *key in [self allKeys]) {
        if ([string length]) {
            [string appendString:@"&"];
        }
        
        NSString *value = [[[self objectForKey:key] description] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"!*'();:@&=+$,/?%#[]"].invertedSet];
        
        [string appendFormat:@"%@=%@", key, value];
    
    }
    return string;
}

@end
