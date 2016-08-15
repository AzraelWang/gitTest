//
//  NSFileManager+XZPath.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/9.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import "NSFileManager+XZPath.h"

@implementation NSFileManager (XZPath)

+ (NSURL *)xz_URLForDirectory:(NSSearchPathDirectory)directory
{
    return [self.defaultManager URLsForDirectory:directory inDomains:NSUserDomainMask].lastObject;
}

+ (NSString *)xz_pathForDirectory:(NSSearchPathDirectory)directory
{
    return NSSearchPathForDirectoriesInDomains(directory, NSUserDomainMask, YES)[0];
}

+ (NSURL *)xz_documentsURL
{
    return [self xz_URLForDirectory:NSDocumentDirectory];
}

+ (NSURL *)xz_libraryURL
{
    return [self xz_URLForDirectory:NSLibraryDirectory];
}

+ (NSURL *)xz_cachesURL
{
    return [self xz_URLForDirectory:NSCachesDirectory];
}


+ (NSString *)xz_documentsPath
{
    return [self xz_pathForDirectory:NSDocumentDirectory];
}

+ (NSString *)xz_libraryPath
{
    return [self xz_pathForDirectory:NSLibraryDirectory];
}

+ (NSString *)xz_cachesPath
{
    return [self xz_pathForDirectory:NSCachesDirectory];
}

@end
