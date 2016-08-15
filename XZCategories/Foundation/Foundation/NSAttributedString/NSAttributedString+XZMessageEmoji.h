//
//  NSAttributedString+XZMessageEmoji.h
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/9.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface NSAttributedString (XZMessageEmoji)

+ (NSAttributedString *)xz_emojiStringWithString:(nonnull NSMutableAttributedString *)emojiString;

+ (NSAttributedString *)xz_emojiStringWithContent:(nonnull NSString *)content;

@end
NS_ASSUME_NONNULL_END
