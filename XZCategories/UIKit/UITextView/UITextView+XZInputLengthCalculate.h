//
//  UITextView+XZInputLengthCalculate.h
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/17.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (XZInputLengthCalculate)

// 用于计算textview输入情况下的字符数，解决实现限制字符数时，计算不准的问题
- (NSInteger)xz_getInputLengthWithText:(NSString *)text;

@end
