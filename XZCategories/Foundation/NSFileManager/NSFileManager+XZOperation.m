//
//  NSFileManager+XZOperation.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/9.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import "NSFileManager+XZOperation.h"

@implementation NSFileManager (XZOperation)

+ (NSArray *)getFileNamesInDirectory:(nonnull NSString *)direct
{
    return [[self defaultManager] contentsOfDirectoryAtPath:direct error:nil];
}

+ (void)cleanUpFilesInDirectory:(nonnull NSString *)directory
{
    NSArray *contents = [self getFileNamesInDirectory:directory];
    for (NSString *content in contents) {
        NSString *path = [directory stringByAppendingPathComponent:content];
        [[self defaultManager] removeItemAtPath:path error:nil];
    }
}

+ (void)removeFilesWithout:(nonnull NSArray *)keepFilenames
               inDirectory:(nonnull NSString *)directory
{
    NSArray *contents = [self getFileNamesInDirectory:directory];
    for (NSString *content in contents) {
        BOOL isKeep = NO;
        for (NSString *filename in keepFilenames) {
            if ([content isEqualToString:filename]) {
                isKeep = YES;
                break;
            }
        }
        if (!isKeep) {
            NSString *path = [NSString stringWithFormat:@"%@/%@",directory,content];
            [[self defaultManager] removeItemAtPath:path error:nil];
        }
    }
}

+ (void)removeFiles:(nonnull NSArray *)filenames inDirectory:(nonnull NSString *)directory
{
    for (NSString *filename in filenames) {
        NSString *path = [NSString stringWithFormat:@"%@/%@",directory,filename];
        [[self defaultManager] removeItemAtPath:path error:nil];
    }
}

@end
