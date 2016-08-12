//
//  NSUserDefaultTests.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/9.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSUserDefaults+XZiCloud.h"
@interface NSUserDefaultTests : XCTestCase

@end

@implementation NSUserDefaultTests

- (void)testWrite {
    
    [[NSUserDefaults standardUserDefaults] xz_setObject:@"niekaihua" forKey:@"name" iCloudSync:YES];
    [[NSUserDefaults standardUserDefaults] xz_setObject:@25 forKey:@"age" iCloudSync:YES];
    
    [[NSUserDefaults standardUserDefaults] xz_synchronizeAlsoiCloudSync:YES];
}

- (void)testRead {
    // https://developer.apple.com/library/ios/documentation/General/Conceptual/iCloudDesignGuide/Chapters/iCloudFundametals.html
    // https://developer.apple.com/library/ios/documentation/IDEs/Conceptual/AppDistributionGuide/AddingCapabilities/AddingCapabilities.html#//apple_ref/doc/uid/TP40012582-CH26-SW2
    // 注意这里要删除一下应用，并在真机上测试，并且确保Capablities中开启了iCloud(需要证书),并且确定测试设备开启了iCloud
    
    NSString *name_iCloud = [[NSUserDefaults standardUserDefaults] xz_objectForKey:@"name" iCloudSync:YES];
    NSNumber *age_iCloud = [[NSUserDefaults standardUserDefaults] xz_objectForKey:@"age" iCloudSync:YES];
    
    NSLog(@"iCloud Data name is %@,age is %@",name_iCloud,age_iCloud);
    
    NSString *name_defaults = [[NSUserDefaults standardUserDefaults] objectForKey:@"name"];
    NSNumber *age_defaults = [[NSUserDefaults standardUserDefaults] valueForKey:@"age"];
    
    NSLog(@"UserDefaults Data name is %@,age is %@",name_defaults,age_defaults);
}


@end
