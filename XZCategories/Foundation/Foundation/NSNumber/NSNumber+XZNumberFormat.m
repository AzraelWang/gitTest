//
//  NSNumber+XZNumberFormat.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/9.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import "NSNumber+XZNumberFormat.h"

static inline NSNumberFormatter * getFormatter(NumberFormat numberFormat) {
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    
    switch (numberFormat) {
            
        case NumberFormatDecimal: {
            formatter.numberStyle = NSNumberFormatterDecimalStyle;
            break;
        }
            
        case NumberFormatCurrency: {
            formatter.numberStyle = NSNumberFormatterCurrencyStyle;
            formatter.currencySymbol = @"￥";
            break;
        }
            
        case NumberFormatCurrencyNoSymbol: {
            formatter.numberStyle = NSNumberFormatterCurrencyStyle;
            formatter.currencySymbol = @"";
            break;
        }
            
        default: {
            formatter.numberStyle = NSNumberFormatterNoStyle;
            break;
        }
    }
    
    return formatter;
}

@implementation NSNumber (XZNumberFormat)

- (NSString *)xz_stringWithFormat:(NumberFormat)numberFormat {
    
    return [getFormatter(numberFormat) stringFromNumber:self];
}

@end


@implementation NSString (XZNumberFormat)

- (NSNumber *)xz_numberWithFormat:(NumberFormat)numberFormat {
    
    return [getFormatter(numberFormat) numberFromString:self];
}

@end
