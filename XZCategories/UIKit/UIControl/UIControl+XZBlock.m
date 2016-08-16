//
//  UIControl+XZBlock.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/16.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import "UIControl+XZBlock.h"
#import <objc/runtime.h>

static const void *XZControlHandlersKey = &XZControlHandlersKey;

@interface XZControlWrapper : NSObject <NSCopying>

- (instancetype)initWithHandler:(void (^)(id sender))handler forControlEvents:(UIControlEvents)controlEvents;

@property (nonatomic) UIControlEvents controlEvents;
@property (nonatomic, copy) void (^handler)(id sender);

@end

@implementation XZControlWrapper

- (instancetype)initWithHandler:(void (^)(id sender))handler forControlEvents:(UIControlEvents)controlEvents {
    if (self = [super init]) {
        self.handler = handler;
        self.controlEvents = controlEvents;
    }
    
    return self;
}

- (instancetype)copyWithZone:(NSZone *)zone {
    return [[XZControlWrapper alloc] initWithHandler:self.handler forControlEvents:self.controlEvents];
}

- (void)invoke:(id)sender {
    self.handler(sender);
}

@end


@implementation UIControl (XZBlock)

- (void)xz_addEventHandler:(void (^)(id sender))handler forControlEvents:(UIControlEvents)controlEvents
{
    NSParameterAssert(handler);
    
    NSMutableDictionary *events = objc_getAssociatedObject(self, XZControlHandlersKey);
    if (!events) {
        events = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, XZControlHandlersKey, events, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    NSNumber *key = @(controlEvents);
    NSMutableSet *handlers = events[key];
    if (!handlers) {
        handlers = [NSMutableSet set];
        events[key] = handlers;
    }
    
    XZControlWrapper *target = [[XZControlWrapper alloc] initWithHandler:handler forControlEvents:controlEvents];
    [handlers addObject:target];
    [self addTarget:target action:@selector(invoke:) forControlEvents:controlEvents];
}

- (void)xz_removeEventHandlersForControlEvents:(UIControlEvents)controlEvents
{
    NSMutableDictionary *events = objc_getAssociatedObject(self, XZControlHandlersKey);
    if (!events) {
        events = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, XZControlHandlersKey, events, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    NSNumber *key = @(controlEvents);
    NSSet *handlers = events[key];
    
    if (!handlers)
        return;
    
    [handlers enumerateObjectsUsingBlock:^(id sender, BOOL *stop) {
        [self removeTarget:sender action:NULL forControlEvents:controlEvents];
    }];
    
    [events removeObjectForKey:key];
}

- (BOOL)xz_hasEventHandlersForControlEvents:(UIControlEvents)controlEvents
{
    NSMutableDictionary *events = objc_getAssociatedObject(self, XZControlHandlersKey);
    if (!events) {
        events = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, XZControlHandlersKey, events, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    NSNumber *key = @(controlEvents);
    NSSet *handlers = events[key];
    
    if (!handlers)
        return NO;
    
    return !!handlers.count;
}

@end
