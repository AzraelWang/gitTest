//
//  UITextView+XZInputLengthCalculate.h
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/17.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (XZInputLengthCalculate)

/// 用于计算textview输入情况下包含正在输入中的字符数的长度
- (NSInteger)xz_getInputingLength;

@end
