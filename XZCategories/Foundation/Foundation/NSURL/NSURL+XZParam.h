//
//  NSURL+XZParam.h
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/9.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface NSURL (XZParam)

/// 参数转字典
- (NSDictionary *)xz_parameters;

/// 根据参数名 取参数值
- (NSString *)xz_valueForParameter:(nonnull NSString *)parameterKey;

/**
 *  @return  拼接参数字典中的所有参数
 *  @param   参数字典
 *  @warning 如果参数字典中的键与URL中重复，则不会被拼接
 */
- (NSURL*) xz_URLByAppendingQueryDictionary:(nonnull NSDictionary*) queryDictionary;

/**
 *  @return  用参数字典中的新值替换URL中相对应的值
 *  @param   新的query字典
 *  @warning 如果参数字典中的键在URL找不到相对应的，则不会被替换
 */
- (NSURL*) xz_URLByReplacingQueryWithDictionary:(nonnull NSDictionary*) queryDictionary;

/// 去掉URLQuery部分
- (NSURL*) xz_URLByRemovingQuery;
@end
NS_ASSUME_NONNULL_END