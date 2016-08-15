//
//  NSObject+XZRuntime.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (XZRuntime)

/**
 *  交换两个方法的实现
 */
+ (void)xz_swizzleMethod:(SEL)originalMethod withMethod:(SEL)newMethod;

/**
 *  为当前类添加某个类的某个方法
 */
+ (void)xz_appendMethod:(SEL)newMethod fromClass:(Class)klass;

/**
 *  替换某个类的某个方法
 */
+ (void)xz_replaceMethod:(SEL)method fromClass:(Class)klass;

/**
 *  从当前类到stopClass父类（不包括）检查是否实现了某个selector
 *
 *  @param selector  selector
 *  @param stopClass 停止查询的最后的父类
 *  @return yes-responds
 */
- (BOOL)xz_respondsToSelector:(SEL)selector untilClass:(Class)stopClass;

/**
 *  检查父类是否响应了某个selector
 *
 *  @param selector selector
 *
 *  @return yes-responds
 */
- (BOOL)xz_superRespondsToSelector:(SEL)selector;

/**
 *  从父类到stopClass父类（不包括）检查是否实现了某个selector
 *
 *  @param selector  selector
 *  @param stopClass 停止查询的最后的父类
 *  @return yes-responds
 */
- (BOOL)xz_superRespondsToSelector:(SEL)selector untilClass:(Class)stopClass;

/**
 *  从子类到stopClass父类（不包括）检查某个类的实例是否响应了某个selector
 *
 *  @param selector  selector
 *  @param stopClass 停止查询的最后的父类
 *  @return yes-responds
 */
+ (BOOL)xz_instancesRespondToSelector:(SEL)selector untilClass:(Class)stopClass;
@end
