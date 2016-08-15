//
//  NSFileManager+XZOperation.h
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/9.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface NSFileManager (XZOperation)

+ (NSArray *)getFileNamesInDirectory:(nonnull NSString *)direct;

+ (void)cleanUpFilesInDirectory:(nonnull NSString *)directory;

+ (void)removeFilesWithout:(nonnull NSArray *)keepFilenames inDirectory:(nonnull NSString *)directory;

+ (void)removeFiles:(nonnull NSArray *)filenames inDirectory:(nonnull NSString *)directory;

@end
NS_ASSUME_NONNULL_END