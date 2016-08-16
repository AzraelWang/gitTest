//
//  NSObjectTests.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/15.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSObject+XZReflection.h"
#import "NSObject+XZAddProperty.h"
#import "NSObject+XZRuntime.h"
#import "XZSuggestion.h"

@interface Bird : NSObject

-(void)call;

-(void)fly;

@end

@implementation Bird

-(void)call
{
    NSLog(@"鸟叫~~~~~~~~~");
}

-(void)fly
{
    NSLog(@"鸟飞~~~~~~~~~");
}


@end

@interface Chicken : Bird

-(void)jump;

@end

@implementation Chicken

-(void)call
{
    NSLog(@"鸡叫~~~~~~~~~");
}

//-(void)fly
//{
//    NSLog(@"鸡飞~~~~~~~~~");
//}


-(void)jump
{
    NSLog(@"%@跳~~~~~~~~~",NSStringFromClass([self class]));
}

@end




@interface NSObjectTests : XCTestCase

@end

@implementation NSObjectTests

- (void)testExample {
    
    NSString *类名 = [XZHotCitySuggestion xz_className];
    NSLog(@"类名 = %@",类名);
    
    NSArray *属性列表 = [XZHotCitySuggestion xz_propertyKeys];
    NSLog(@"属性列表 = %@",属性列表);
    
    NSArray *方法列表 = [XZHotCitySuggestion xz_methodList];
    NSLog(@"方法列表 = %@",方法列表);
    
    NSDictionary *协议列表 = [XZSuggestion xz_protocolList];
    NSLog(@"协议列表 = %@",协议列表);
    
    NSArray *属性详细列表 = [XZHotCitySuggestion xz_propertiesInfo];
    NSLog(@"属性详细列表 = %@",属性详细列表);
    
    NSArray *实例变量列表 = [XZHotCitySuggestion xz_instanceVariable];
    NSLog(@"实例变量列表 = %@",实例变量列表);
}

-(void)testAddProperty
{
    XZHotCitySuggestion *hot = [XZHotCitySuggestion new];
    hot.xz_stringProperty = @"hotName";
    hot.xz_integerProperty = 100;
    
    hot.xz_stringProperty = @"hotName222";
    hot.xz_integerProperty = 100222;
    
    NSLog(@"xz_stringProperty = %@",hot.xz_stringProperty);
    NSLog(@"xz_integerProperty = %ld",hot.xz_integerProperty);
    
    
    [hot xz_associateValue:[NSNumber numberWithFloat:(3.14159)] withKey:@"Pai"];
    XZSuggestion *su = [XZSuggestion new];
    [hot xz_weaklyAssociateValue:su withKey:@"weeeeeek"];
    
    id value = [hot xz_associatedValueForKey:@"Pai"];
    id value2 = [hot xz_associatedValueForKey:@"weeeeeek"];
    NSLog(@"\n\nvalue = %@ \n\n value2 = %@\n\n",value,value2);
}

- (void)testRuntime
{
//    Bird *bird = [Bird new];
//    [bird fly];
//    [bird call];
//
//    [Bird xz_swizzleMethod:@selector(fly) withMethod:@selector(call)];
//    NSLog(@"交换 飞 和 叫 的方法");
//    [bird fly];
//    [bird call];
    
//    [Bird xz_appendMethod:NSSelectorFromString(@"jump") fromClass:[Chicken class]];
//    NSLog(@"给Bird类增加jump的方法");
//    [bird performSelector:NSSelectorFromString(@"jump")];
//    
//    [Bird xz_replaceMethod:NSSelectorFromString(@"fly") fromClass:[Chicken class]];
//    NSLog(@"用Chicken类的fly方法替换Bird类的fly方法");
//    [bird fly];
    
    Chicken *chicken = [Chicken new];

    BOOL bool1 = [chicken xz_superRespondsToSelector:@selector(fly)];  NSLog(@"%@",bool1 ? @"YES" : @"NO");
    BOOL bool2 = [chicken xz_superRespondsToSelector:@selector(jump)]; NSLog(@"%@",bool2 ? @"YES" : @"NO");
    BOOL bool3 = [chicken xz_superRespondsToSelector:@selector(fly) untilClass:[NSObject class]]; NSLog(@"%@",bool3 ? @"YES" : @"NO");
    BOOL bool4 = [chicken xz_superRespondsToSelector:@selector(fly) untilClass:[Bird class]]; NSLog(@"%@",bool4 ? @"YES" : @"NO");
    BOOL bool5 = [chicken xz_respondsToSelector:@selector(fly) untilClass:[NSObject class]]; NSLog(@"%@",bool5 ? @"YES" : @"NO");
    BOOL bool6 = [chicken xz_respondsToSelector:@selector(fly) untilClass:[Bird class]]; NSLog(@"%@",bool6 ? @"YES" : @"NO");
    BOOL bool7 = [Chicken xz_instancesRespondToSelector:@selector(fly) untilClass:[NSObject class]]; NSLog(@"%@",bool7 ? @"YES" : @"NO");
    BOOL bool8 = [Chicken xz_instancesRespondToSelector:@selector(fly) untilClass:[Bird class]]; NSLog(@"%@",bool8 ? @"YES" : @"NO");
}

@end
