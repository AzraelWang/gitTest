//
//  UIWindow+XZFind.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/17.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import "UIWindow+XZFind.h"

@implementation UIWindow (XZFind)

- (UIViewController *)xz_topMostViewController
{
    UIViewController *topViewController = [self rootViewController];
    while ([topViewController presentedViewController]) {
        topViewController = [topViewController presentedViewController];
    }
    return topViewController;
}

- (UIViewController*)xz_currentViewController;
{
    UIViewController *currentViewController = [self xz_topMostViewController];
    
    while ([currentViewController isKindOfClass:[UINavigationController class]] && [(UINavigationController*)currentViewController topViewController])
        
        currentViewController = [(UINavigationController*)currentViewController topViewController];
    
    return currentViewController;
}


@end
