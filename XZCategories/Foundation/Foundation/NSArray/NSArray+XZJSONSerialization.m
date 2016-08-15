//
//  NSArray+XZJSONSerialization.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/12.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import "NSArray+XZJSONSerialization.h"

@implementation NSArray (XZJSONSerialization)

- (NSString *)xz_JSONString
{
    if (![self count]) {
        return nil;
    }
    if (![self isKindOfClass:[NSArray class]]) {
        return nil;
    }
    
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
    if (error) {
        NSLog(@"JSON数据解析失败");
        return nil;
    } else {
        return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
}
- (NSData *)xz_JSONData
{
    if (![self count]) {
        return nil;
    }
    if (![self isKindOfClass:[NSArray class]]) {
        return nil;
    }
    
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
    if (error) {
        NSLog(@"JSON数据解析失败");
        return nil;
    } else {
        return data;
    }
}

@end
