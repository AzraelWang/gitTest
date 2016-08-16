//
//  UIControl+XZBlock.h
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/16.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (XZBlock)

- (void)xz_addEventHandler:(void (^)(id sender))handler forControlEvents:(UIControlEvents)controlEvents;

- (void)xz_removeEventHandlersForControlEvents:(UIControlEvents)controlEvents;

- (BOOL)xz_hasEventHandlersForControlEvents:(UIControlEvents)controlEvents;

@end
