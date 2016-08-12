//
//  NSString+XZJSONSerialization.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/12.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import "NSString+XZJSONSerialization.h"

@implementation NSString (XZJSONSerialization)

- (id)xz_objectFromJSONString
{
    if (![self length]) {
        return nil;
    }
    if (![self isKindOfClass:[NSString class]]) {
        return nil;
    }
    
    NSError *error = nil;
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    // NSJSONReadingMutableContainers -> 解析出的对象必须是字典或数组
    id obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if (error) {
        NSLog(@"JSON数据解析失败");
        return nil;
    } else {
        return obj;
    }
}


@end
