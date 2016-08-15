//
//  NSAttributedString+XZAdditional.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/9.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import "NSAttributedString+XZAdditional.h"

@implementation NSAttributedString (XZAdditional)

+ (NSAttributedString *)xz_attributedWithString:(nonnull NSString *)string
                                          color:(nonnull UIColor *)color;
{
    if (![string length]) return nil;
    return [NSAttributedString xz_attributedWithString:string
                                                  font:[UIFont systemFontOfSize:14]
                                                 color:color];
}

+ (NSAttributedString *)xz_attributedWithString:(nonnull NSString *)string
                                           font:(nonnull UIFont *)font
                                          color:(nonnull UIColor *)color
{
    if (![string length]) return nil;
    
    return [[NSAttributedString alloc] initWithString:string
                                           attributes:@{NSFontAttributeName:font,
                                                        NSForegroundColorAttributeName:color}];
}

+ (NSAttributedString *)xz_attributedWithString:(nonnull NSString *)string
                                           font:(nonnull UIFont *)font
                                          color:(nonnull UIColor *)color
                                 paragraphStyle:(nonnull NSMutableParagraphStyle *)paragraphStyle
{
   if (![string length]) return nil;
   return [[NSAttributedString alloc] initWithString:string
                                          attributes:@{NSFontAttributeName:font,
                                             NSParagraphStyleAttributeName:paragraphStyle,
                                            NSForegroundColorAttributeName:color}];
}


+ (NSAttributedString *)xz_attributedWithString:(nonnull NSString *)string
                                           font:(nonnull UIFont *)font
                                          color:(nonnull UIColor *)color
                                      alignment:(NSTextAlignment)alignment

{
    if (![string length]) return nil;
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = alignment;
    
    return [NSAttributedString xz_attributedWithString:string
                                                  font:font
                                                 color:color
                                        paragraphStyle:paragraphStyle];
}




+ (NSAttributedString *)xz_attributedWithString:(nonnull NSString *)string
                                           font:(nonnull UIFont *)font
                                          color:(nonnull UIColor *)color
                                    lineSpacing:(CGFloat)lineSpacing
{
    if (![string length]) return nil;
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    
    return [NSAttributedString xz_attributedWithString:string
                                                  font:font
                                                 color:color
                                        paragraphStyle:paragraphStyle];
}

+ (NSAttributedString *)xz_attributedWithString:(nonnull NSString *)string
                                           font:(nonnull UIFont *)font
                                          color:(nonnull UIColor *)color
                                      alignment:(NSTextAlignment)alignment
                                    lineSpacing:(CGFloat)lineSpacing
{
    if (![string length]) return nil;
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = alignment;
    [paragraphStyle setLineSpacing:lineSpacing];
    
    return [NSAttributedString xz_attributedWithString:string
                                                  font:font
                                                 color:color
                                        paragraphStyle:paragraphStyle];
}
@end
