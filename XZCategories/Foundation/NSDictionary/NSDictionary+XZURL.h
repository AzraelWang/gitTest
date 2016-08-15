//
//  NSDictionary+XZURL.h
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/9.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (XZURL)

/**
 *  @brief  将NSDictionary转换成url 参数字符串(汉字会被转义)
 *
 *  @return url 参数字符串
 */
- (NSString *)xz_URLQueryString;

@end
