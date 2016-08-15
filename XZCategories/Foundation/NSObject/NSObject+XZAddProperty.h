//
//  NSObject+XZAddProperty.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>
//objc_getAssociatedObject和objc_setAssociatedObject都需要指定一个固定的地址，这个固定的地址值用来表示属性的key，起到一个常量的作用。
//static const void *JKStringProperty = &JKStringProperty;
//static char IntegerProperty;
//@selector(methodName:)

@interface NSObject (XZAddProperty)
/**
 *  实现get set方法增加一个字符串属性
 */
@property (nonatomic,strong) NSString *xz_stringProperty;
/**
 *  实现get set方法增加一个NSInteger属性
 */
@property (nonatomic,assign) NSInteger xz_integerProperty;


/**
 *  @brief  附加一个stong对象
 *
 *  @param value 被附加的对象
 *  @param key   被附加对象的key
 */
- (void)xz_associateValue:(id)value withKey:(void *)key; // Strong reference
/**
 *  @brief  附加一个weak对象
 *
 *  @param value 被附加的对象
 *  @param key   被附加对象的key
 */
- (void)xz_weaklyAssociateValue:(id)value withKey:(void *)key;

/**
 *  @brief  根据附加对象的key取出附加对象
 *
 *  @param key 附加对象的key
 *
 *  @return 附加对象
 */
- (id)xz_associatedValueForKey:(void *)key;

@end
