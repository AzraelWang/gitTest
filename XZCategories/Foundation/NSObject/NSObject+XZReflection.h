//
//  NSObject+XZReflection.h
//  NSObject-XZReflection
//
//  Created by Jakey on 15/12/22.
//  Copyright © 2015年 Jakey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (XZReflection)
/// 类名
- (NSString *)xz_className;
/// 类名
+ (NSString *)xz_className;

/// 父类名称
- (NSString *)xz_superClassName;
/// 父类名称
+ (NSString *)xz_superClassName;

/// 实例属性字典
-(NSDictionary *)xz_propertyDictionary;

/// 属性名称列表
- (NSArray*)xz_propertyKeys;
/// 属性名称列表
+ (NSArray *)xz_propertyKeys;

/// 属性详细信息列表
- (NSArray *)xz_propertiesInfo;
/// 属性详细信息列表
+ (NSArray *)xz_propertiesInfo;

/// 格式化后的属性列表
+ (NSArray *)xz_propertiesWithCodeFormat;

/// 方法列表
-(NSArray*)xz_methodList;
/// 方法列表
+(NSArray*)xz_methodList;

-(NSArray*)xz_methodListInfo;

/// 创建并返回一个指向所有已注册类的指针列表
+ (NSArray *)xz_registedClassList;
/// 实例变量
+ (NSArray *)xz_instanceVariable;

/// 协议列表
-(NSDictionary *)xz_protocolList;
/// 协议列表
+ (NSDictionary *)xz_protocolList;


- (BOOL)xz_hasPropertyForKey:(NSString*)key;
- (BOOL)xz_hasIvarForKey:(NSString*)key;

@end
