//
//  NSDictionary+XZJSONSerialization.h
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/12.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (XZJSONSerialization)

@property (readonly) NSString *xz_JSONString;
@property (readonly) NSData   *xz_JSONData;

@end
