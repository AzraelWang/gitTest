//
//  NSUserDefaults+XZiCloud.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/9.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import "NSUserDefaults+XZiCloud.h"

@implementation NSUserDefaults (XZiCloud)

-(void)xz_setObject:(id)object forKey:(NSString *)key iCloudSync:(BOOL)sync
{
    if (sync){
        [[NSUbiquitousKeyValueStore defaultStore] setObject:object forKey:key];
    }
    [self setObject:object forKey:key];
}

-(id)xz_objectForKey:(NSString *)key iCloudSync:(BOOL)sync
{
    if (sync)
    {
        id object = [[NSUbiquitousKeyValueStore defaultStore] objectForKey:key];
        
        [self setObject:object forKey:key];
        [self synchronize];
        
        return object;
    }
    return [self objectForKey:key];
}


- (void)xz_removeObjectForKey:(NSString *)key iCloudSync:(BOOL)sync
{
    if (sync) {
        [[NSUbiquitousKeyValueStore defaultStore] removeObjectForKey:key];
    }
    [self removeObjectForKey:key];
}

-(BOOL)xz_synchronizeAlsoiCloudSync:(BOOL)sync
{
    BOOL res = true;
    
    if (sync){
        res &= [self synchronize];
    }
    res &= [[NSUbiquitousKeyValueStore defaultStore] synchronize];
    
    return res;
}

@end
