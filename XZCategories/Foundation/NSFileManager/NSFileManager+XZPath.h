//
//  NSFileManager+XZPath.h
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/9.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (XZPath)

/// documents目录URL
+ (NSURL *)xz_documentsURL;

/// libaray目录URL
+ (NSURL *)xz_libraryURL;

/// caches目录URL
+ (NSURL *)xz_cachesURL;

/// documents目录Path
+ (NSString *)xz_documentsPath;

/// libaray目录Path
+ (NSString *)xz_libraryPath;

/// caches目录Path
+ (NSString *)xz_cachesPath;


@end
