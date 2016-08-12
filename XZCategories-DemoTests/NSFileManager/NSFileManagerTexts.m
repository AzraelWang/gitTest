//
//  NSFileManagerTexts.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/9.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSFileManager+XZPath.h"
#import "NSFileManager+XZOperation.h"
@interface NSFileManagerTexts : XCTestCase

@end

@implementation NSFileManagerTexts

- (void)testExample {
    
    NSString *xz_documentsURL = [NSString stringWithFormat:@"%@",[NSFileManager xz_documentsURL]];
    NSLog(@"xz_documentsURL = %@ \n\n\n",xz_documentsURL);
    
    NSString *xz_documentsPath = [NSString stringWithFormat:@"%@",[NSFileManager xz_documentsPath]];
    NSLog(@"xz_documentsPath = %@ \n\n\n",xz_documentsPath);
    
    NSString *xz_libraryURL = [NSString stringWithFormat:@"%@",[NSFileManager xz_libraryURL]];
    NSLog(@"xz_libraryURL = %@ \n\n\n",xz_libraryURL);
    
    NSString *xz_libraryPath = [NSString stringWithFormat:@"%@",[NSFileManager xz_libraryPath]];
    NSLog(@"xz_libraryPath = %@ \n\n\n",xz_libraryPath);
    
    NSString *xz_cachesURL = [NSString stringWithFormat:@"%@",[NSFileManager xz_cachesURL]];
    NSLog(@"xz_cachesURL = %@ \n\n\n",xz_cachesURL);
    
    NSString *xz_cachesPath = [NSString stringWithFormat:@"%@",[NSFileManager xz_cachesPath]];
    NSLog(@"xz_cachesPath = %@ \n\n\n",xz_cachesPath);
    
    
    for (NSString *name in @[@"testFiles/1",@"testFiles/2",@"testFiles/exception1",@"testFiles/exception2"]) {
        NSString *cache = [xz_cachesPath stringByAppendingPathComponent:name];
        if (![[NSFileManager defaultManager] fileExistsAtPath:cache]) {
            [[NSFileManager defaultManager] createDirectoryAtPath:cache withIntermediateDirectories:YES attributes:nil error:nil];
        }
    }
    
    NSString *testPath = [[NSFileManager xz_cachesPath] stringByAppendingPathComponent:@"testFiles"];
    
    [self testFilesLog];
    
    [NSFileManager removeFilesWithout:@[@"exception1",@"exception2"] inDirectory:testPath];

    [self testFilesLog];
    
    [NSFileManager removeFiles:@[@"exception1"] inDirectory:testPath];

    [self testFilesLog];

    [NSFileManager cleanUpFilesInDirectory:testPath];
    
    [self testFilesLog];
}

-(void)testFilesLog{
    
    NSString *testPath = [[NSFileManager xz_cachesPath] stringByAppendingPathComponent:@"testFiles"];
    
    NSArray *testArray = [NSFileManager getFileNamesInDirectory:testPath];
    if (testArray.count) {
        [testArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"testFiles Directory subFileNames %ld - %@ \n\n\n",idx, obj);
        }];
    }else{
        NSLog(@"文件夹为空");
    }
}



@end
