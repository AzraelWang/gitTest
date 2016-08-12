//
//  NSDictionaryTests.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/9.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSDictionary+XZURL.h"
@interface NSDictionaryTests : XCTestCase

@end

@implementation NSDictionaryTests

- (void)testExample {
    
    NSDictionary *dict = @{@"cityId":@"12",
                           @"cityName":@"北京",
                           @"length":@10,
                           @"offset":[NSNumber numberWithInt:20]
                           };
    
    NSString *string = [dict xz_URLQueryString];
    
    NSLog(@"URLQueryString is %@",string);
}


@end
