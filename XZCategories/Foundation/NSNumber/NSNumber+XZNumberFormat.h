//
//  NSNumber+XZNumberFormat.h
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/9.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <Foundation/Foundation.h>

//@interface NSNumber (XZNumberFormat)
//
//@end

typedef NS_ENUM(NSUInteger, NumberFormat) {
    /**123456789*/
    NumberFormatNone,
    /**1,234,567.837*/
    NumberFormatDecimal,
    /**￥123,456,789.00*/
    NumberFormatCurrency,
    /**123,456,789.00*/
    NumberFormatCurrencyNoSymbol
};

@interface NSNumber (XZNumberFormat)

- (NSString *)xz_stringWithFormat:(NumberFormat)numberFormat;

@end

@interface NSString (XZNumberFormat)

- (NSNumber *)xz_numberWithFormat:(NumberFormat)numberFormat;

@end
