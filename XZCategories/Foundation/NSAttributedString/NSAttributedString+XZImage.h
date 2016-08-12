//
//  NSAttributedString+XZImage.h
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/11.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSAttributedString (XZImage)

+ (NSAttributedString *)xz_attributedStringWithImage:(nonnull UIImage *)image;

+ (NSAttributedString *)xz_attributedStringWithImage:(nonnull UIImage *)image bounds:(CGRect)bounds;

@end

NS_ASSUME_NONNULL_END