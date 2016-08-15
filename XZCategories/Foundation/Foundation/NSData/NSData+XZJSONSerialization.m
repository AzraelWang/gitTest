//
//  NSData+XZJSONSerialization.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/12.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import "NSData+XZJSONSerialization.h"

@implementation NSData (XZJSONSerialization)

- (id)xz_objectFromJSONData
{
    if (![self length]) {
        return nil;
    }
    if (![self isKindOfClass:[NSData class]]) {
        return nil;
    }
    
    NSError *error = nil;
    // NSJSONReadingMutableContainers -> 解析出的对象必须是字典或数组
    id obj = [NSJSONSerialization JSONObjectWithData:self options:NSJSONReadingMutableContainers error:&error];
    if (error) {
        NSLog(@"JSON数据解析失败");
        return nil;
    } else {
        return obj;
    }
}

@end
