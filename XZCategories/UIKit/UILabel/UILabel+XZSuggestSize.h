//
//  UILabel+XZSuggestSize.h
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/17.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (XZSuggestSize)

- (CGSize)xz_suggestedSizeForWidth:(CGFloat)width;

- (CGSize)xz_suggestSizeForAttributedString:(NSAttributedString *)string
                                      width:(CGFloat)width;

- (CGSize)xz_suggestSizeForString:(NSString *)string
                            width:(CGFloat)width;
@end
