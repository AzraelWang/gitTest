//
//  NSObject+XZAddProperty.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "NSObject+XZAddProperty.h"
#import <objc/runtime.h>

//objc_getAssociatedObject和objc_setAssociatedObject都需要指定一个固定的地址，这个固定的地址值用来表示属性的key，起到一个常量的作用。
static const void *XZStringProperty = &XZStringProperty;
static const void *XZIntegerProperty = &XZIntegerProperty;
//static char IntegerProperty;
@implementation NSObject (XZAddProperty)

@dynamic xz_stringProperty;
@dynamic xz_integerProperty;

/**
 *  实现get set方法增加一个字符串属性
 */

-(void)setXz_stringProperty:(NSString *)xz_stringProperty{
    //use that a static const as the key
    objc_setAssociatedObject(self, XZStringProperty, xz_stringProperty, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(NSString *)xz_stringProperty{
    return objc_getAssociatedObject(self, XZStringProperty);
}


/**
 *  实现get set方法增加一个NSInteger属性
 */
-(void)setXz_integerProperty:(NSInteger)xz_integerProperty{
    NSNumber *number = [[NSNumber alloc]initWithInteger:xz_integerProperty];
    objc_setAssociatedObject(self,XZIntegerProperty, number, OBJC_ASSOCIATION_ASSIGN);
}

-(NSInteger)xz_integerProperty{
    return [objc_getAssociatedObject(self, XZIntegerProperty) integerValue];
}


/**
 *  @brief  附加一个stong对象
 *
 *  @param value 被附加的对象
 *  @param key   被附加对象的key
 */
- (void)xz_associateValue:(id)value withKey:(void *)key
{
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_RETAIN);
}
/**
 *  @brief  附加一个weak对象
 *
 *  @param value 被附加的对象
 *  @param key   被附加对象的key
 */
- (void)xz_weaklyAssociateValue:(id)value withKey:(void *)key
{
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_ASSIGN);
}
/**
 *  @brief  根据附加对象的key取出附加对象
 *
 *  @param key 附加对象的key
 *
 *  @return 附加对象
 */
- (id)xz_associatedValueForKey:(void *)key
{
    return objc_getAssociatedObject(self, key);
}

@end
