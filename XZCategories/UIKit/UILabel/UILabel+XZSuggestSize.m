//
//  UILabel+XZSuggestSize.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/17.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import "UILabel+XZSuggestSize.h"

@implementation UILabel (XZSuggestSize)

- (CGSize)xz_suggestedSizeForWidth:(CGFloat)width
{
    if (self.attributedText)
        return [self xz_suggestSizeForAttributedString:self.attributedText width:width];
    
    return [self xz_suggestSizeForString:self.text width:width];
}

- (CGSize)xz_suggestSizeForAttributedString:(NSAttributedString *)string
                                      width:(CGFloat)width
{
    if (!string) {
        return CGSizeZero;
    }
    return [string boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size;
}

- (CGSize)xz_suggestSizeForString:(NSString *)string
                            width:(CGFloat)width
{
    if (!string) {
        return CGSizeZero;
    }
    return [self xz_suggestSizeForAttributedString:[[NSAttributedString alloc] initWithString:string attributes:@{NSFontAttributeName: self.font}] width:width];
}

@end
