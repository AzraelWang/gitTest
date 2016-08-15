//
//  NSUserDefaults+XZiCloud.h
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/9.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (XZiCloud)

/// 设置本地数据时是否同时设置iCloud
-(void)xz_setObject:(id)object forKey:(NSString *)key iCloudSync:(BOOL)sync;

/// sync为YES,则从iCloud来取值，反之从本地
-(id)xz_objectForKey:(NSString *)key iCloudSync:(BOOL)sync;

/// 移除本地数据时是否同时移除iCloud
- (void)xz_removeObjectForKey:(NSString *)key iCloudSync:(BOOL)sync;

/// sync为YES，本地和iCloud都同步，为NO，则只同步iCloud
-(BOOL)xz_synchronizeAlsoiCloudSync:(BOOL)sync;

@end
