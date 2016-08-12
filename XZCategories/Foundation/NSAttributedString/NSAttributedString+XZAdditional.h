//
//  NSAttributedString+XZAdditional.h
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/9.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSAttributedString (XZAdditional)

/**
 *  根据指定的颜色来配置富文本内容（字体为系统14号字体）
 *
 *  @param string 内容字符串
 *  @param color  颜色
 *
 *  @return 配置好的富文本内容
 */
+ (NSAttributedString *)xz_attributedWithString:(nonnull NSString *)string
                                          color:(nonnull UIColor *)color;
/**
 *  根据指定的字体、颜色来配置富文本内容
 *
 *  @param string 内容字符串
 *  @param font   字体
 *  @param color  颜色
 *
 *  @return 配置好的富文本内容
 */
+ (NSAttributedString *)xz_attributedWithString:(nonnull NSString *)string
                                           font:(nonnull UIFont *)font
                                          color:(nonnull UIColor *)color;

/**
 *  根据指定的字体、颜色、段落样式来配置富文本内容
 *
 *  @param string         内容字符串
 *  @param font           字体
 *  @param color          颜色
 *  @param paragraphStyle 段落样式
 *
 *  @return 配置好的富文本内容
 */
+ (NSAttributedString *)xz_attributedWithString:(nonnull NSString *)string
                                           font:(nonnull UIFont *)font
                                          color:(nonnull UIColor *)color
                                 paragraphStyle:(nonnull NSMutableParagraphStyle *)paragraphStyle;

/**
 *  根据指定的对齐方式、字体和颜色来配置富文本内容
 *
 *  @param string    内容字符串
 *  @param font      字体
 *  @param color     颜色
 *  @param alignment 文本对齐方式
 *
 *  @return 配置好的富文本内容
 */
+ (NSAttributedString *)xz_attributedWithString:(nonnull NSString *)string
                                           font:(nonnull UIFont *)font
                                          color:(nonnull UIColor *)color
                                      alignment:(NSTextAlignment)alignment;
/**
 *  根据指定的字体、颜色、行间距来配置富文本内容
 *
 *  @param string      内容字符串
 *  @param font        字体
 *  @param color       颜色
 *  @param lineSpacing 行间距
 *
 *  @return 配置好的富文本内容
 */
+ (NSAttributedString *)xz_attributedWithString:(nonnull NSString *)string
                                           font:(nonnull UIFont *)font
                                          color:(nonnull UIColor *)color
                                    lineSpacing:(CGFloat)lineSpacing;
/**
 *  根据指定的字体、颜色、对齐方式行间距来配置富文本内容
 *
 *  @param string      内容字符串
 *  @param font        字体
 *  @param color       颜色
 *  @param alignment   对齐方式
 *  @param lineSpacing 行间距
 *
 *  @return 配置好的富文本内容
 */
+ (NSAttributedString *)xz_attributedWithString:(nonnull NSString *)string
                                           font:(nonnull UIFont *)font
                                          color:(nonnull UIColor *)color
                                      alignment:(NSTextAlignment)alignment
                                    lineSpacing:(CGFloat)lineSpacing;

@end

NS_ASSUME_NONNULL_END
