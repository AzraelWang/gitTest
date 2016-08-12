//
//  NSAttributedString+XZBestSize.h
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/11.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSAttributedString (XZBestSize)

- (CGSize)xz_sizeConstrainedToMaxSize:(CGSize)maxSize;

- (CGSize)xz_sizeConstrainedToWidth:(CGFloat)width;

- (CGSize)xz_sizeConstrainedToHeight:(CGFloat)height;

- (CGFloat)xz_heightConstrainedToWidth:(CGFloat)width;

- (CGFloat)xz_widthConstrainedToHeight:(CGFloat)height;

@end
