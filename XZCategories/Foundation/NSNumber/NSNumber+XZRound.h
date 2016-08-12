//
//  NSNumber+XZRound.h
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/9.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (XZRound)

/// 显示小数点后几位(最后一位四舍五入)
- (NSString*)xz_toDisplayNumberWithDigit:(NSInteger)digit;

/// 显示百分比后几位(最后一位四舍五入)
- (NSString*)xz_toDisplayPercentageWithDigit:(NSInteger)digit;


/// 限制最大位数四舍五入
- (NSNumber*)xz_doRoundWithDigit:(NSUInteger)digit;

/// 限制最大位数取上整
- (NSNumber*)xz_doCeilWithDigit:(NSUInteger)digit;

/// 限制最大位数取下整
- (NSNumber*)xz_doFloorWithDigit:(NSUInteger)digit;

@end
