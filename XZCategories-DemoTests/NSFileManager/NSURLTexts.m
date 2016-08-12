//
//  NSURLTexts.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/9.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSURL+XZParam.h"
@interface NSURLTexts : XCTestCase

@end

@implementation NSURLTexts

- (void)testExample {
    
    NSURL *url = [NSURL URLWithString:@"https://wireless.xiaozhu.com/app/xzfk/ios/3.4.0/search/result?_=1470389269106&cityId=12&cityName=%E5%8C%97%E4%BA%AC&guestNum=0&latitude=39.913414&length=10&locId=2w&longitude=116.197075&minPrice=0&offset=0&orderBy=recommend&radius=2&sessId=236d65f0a01e1da25f119f7131d2e85d&userId=438404500&xzsign=md5_42e4c12b019e7fc92fa3fda79b3953e5"];
    NSDictionary *dict = [url xz_parameters];
    NSLog(@"%@",dict);
    
    NSLog(@"sessId = %@",[url xz_valueForParameter:@"sessId"]);
    
    NSLog(@"ooooo = %@",[url xz_valueForParameter:@"ooooo"]);

    NSDictionary *newDict =  @{@"cityId":@"13",
                               @"cityName":@"上海",
                               @"ooooo":@"ooooo"
                               };
    
    NSString  *appendingURLString = [[url xz_URLByAppendingQueryDictionary:newDict] absoluteString];
    
    NSLog(@"\n\n\n newURLString is %@",appendingURLString);
    
    
    NSString  *replacingURLString = [[url xz_URLByReplacingQueryWithDictionary:newDict] absoluteString];
    
    NSLog(@"\n\n\n newURLString is %@",replacingURLString);
    
    
    NSString *removingQueryURLString = [[url xz_URLByRemovingQuery] absoluteString];
    
    NSLog(@"\n\n\n removingQueryURLString is %@",removingQueryURLString);
}



@end
