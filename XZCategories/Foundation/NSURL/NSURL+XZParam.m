//
//  NSURL+XZParam.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/9.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import "NSURL+XZParam.h"
#import "NSDictionary+XZURL.h"

@implementation NSURL (XZParam)
/// 参数转字典
- (NSDictionary *)xz_parameters
{
    NSMutableDictionary * parametersDictionary = [NSMutableDictionary dictionary];
    NSArray * queryComponents = [self.query componentsSeparatedByString:@"&"];
    for (NSString * queryComponent in queryComponents) {
        NSString * key = [queryComponent componentsSeparatedByString:@"="].firstObject;
        NSString * value = [queryComponent substringFromIndex:(key.length + 1)];
        
        value = [value stringByRemovingPercentEncoding];
        
        [parametersDictionary setObject:value forKey:key];
    }
    return parametersDictionary;
}

/// 根据参数名 取参数值
- (NSString *)xz_valueForParameter:(nonnull NSString *)parameterKey
{
    NSDictionary *parametersDictionary = [self xz_parameters];
    return [parametersDictionary objectForKey:parameterKey];
}

- (NSURL*) xz_URLByAppendingQueryDictionary:(nonnull NSDictionary*) queryDictionary
{
    NSMutableDictionary *parametersDictionary = [NSMutableDictionary dictionaryWithDictionary:[self xz_parameters]];
    
    NSMutableDictionary *queryDictionaryM = [NSMutableDictionary dictionaryWithDictionary:queryDictionary];
    
    for (NSString *key in queryDictionaryM.allKeys) {
        
        id object = [queryDictionaryM objectForKey:key];
        
        if ([parametersDictionary objectForKey:key] == nil) {
            [parametersDictionary setObject:object forKey:key];
        }
    }
    
    NSString *beforePath = [[self xz_URLByRemovingQuery] absoluteString];
    NSString *urlString = [NSString stringWithFormat:@"%@%@%@",beforePath,@"?",[parametersDictionary xz_URLQueryString]];
    
    return [NSURL URLWithString:urlString];
}


- (NSURL*) xz_URLByReplacingQueryWithDictionary:(nonnull NSDictionary*) queryDictionary
{
    NSMutableDictionary *parametersDictionary = [NSMutableDictionary dictionaryWithDictionary:[self xz_parameters]];
    
    NSMutableDictionary *queryDictionaryM = [NSMutableDictionary dictionaryWithDictionary:queryDictionary];
    
    for (NSString *key in queryDictionaryM.allKeys) {
        
        id object = [queryDictionaryM objectForKey:key];
        
        if ([parametersDictionary objectForKey:key] != nil) {
            [parametersDictionary setObject:object forKey:key];
        }
    }
    
    NSString *beforePath = [[self xz_URLByRemovingQuery] absoluteString];
    NSString *urlString = [NSString stringWithFormat:@"%@%@%@",beforePath,@"?",[parametersDictionary xz_URLQueryString]];
    
    return [NSURL URLWithString:urlString];
}


- (NSURL*) xz_URLByRemovingQuery {
    NSArray *queryComponents = [self.absoluteString componentsSeparatedByString:@"?"];
    if (queryComponents.count) {
        return [NSURL URLWithString:queryComponents.firstObject];
    }
    return self;
}
@end
