//
//  NSObject+PubSub.m
//
//  Created by Ryan Ye on 3/20/13.
//  Copyright (c) 2013-2015 Glow, Inc. All rights reserved.
//

#import "NSObject+XZPubSub.h"
#import <objc/runtime.h>

@implementation XZEvent

- (id)initWithName:(NSString *)name obj:(id)obj data:(id)data {
    if (self = [super init]) {
        self.name = name;
        self.obj = obj;
        self.data = data;
    }
    return self;
}

@end

@implementation NSObject (XZPubSub)

static NSOperationQueue *_pubSubQueue = nil;
static NSString * const kXZPubSubDataKey = @"XZPubSubData";
static char kXZPubSubSubscriptionsKey;

#pragma mark - Class Methods
+ (void)setPubSubQueue:(NSOperationQueue *)queue {
    _pubSubQueue = queue;
}

#pragma mark - Publish Methods
- (void)publish:(NSString *)name {
    [self publish:name data:nil];
}

- (void)publish:(NSString *)name data:(id)data {
    NSDictionary *userInfo = nil;
    if (data != nil) {
        userInfo = @{kXZPubSubDataKey: data};
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:name object:self userInfo:userInfo];
}

#pragma mark - Subscribe Methods with Selector
- (id)subscribe:(NSString *)eventName selector:(SEL)selector {
    return [self subscribe:eventName obj:nil selector:selector];
}

- (id)subscribeOnce:(NSString *)eventName selector:(SEL)selector {
    return [self subscribeOnce:eventName obj:nil selector:selector];
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
- (id)subscribe:(NSString *)eventName obj:(id)obj selector:(SEL)selector {
    NSMethodSignature *sig = [self methodSignatureForSelector:selector];
    //  The hidden arguments self and _cmd (of type SEL) are at indices 0 and 1; method-specific arguments begin at index 2
    BOOL passEventObj = ([sig numberOfArguments] == 3);
    __weak __typeof__(self) weakSelf = self;
    return [self subscribe:eventName obj:obj handler:^(XZEvent *event) {
        __strong __typeof__(weakSelf) strongSelf = weakSelf;
        if (passEventObj) {
            [strongSelf performSelector:selector withObject:event];
        } else {
            [strongSelf performSelector:selector];
        }
    }];
}

- (id)subscribeOnce:(NSString *)eventName obj:(id)obj selector:(SEL)selector {
    NSMethodSignature *sig = [self methodSignatureForSelector:selector];
    //  The hidden arguments self and _cmd (of type SEL) are at indices 0 and 1; method-specific arguments begin at index 2
    BOOL passEventObj = ([sig numberOfArguments] == 3);
    __weak __typeof__(self) weakSelf = self;
    return [self subscribe:eventName obj:obj handler:^(XZEvent *event) {
        __strong __typeof__(weakSelf) strongSelf = weakSelf;
        [strongSelf unsubscribe:eventName];
        if (passEventObj) {
            [strongSelf performSelector:selector withObject:event];
        } else {
            [strongSelf performSelector:selector];
        }
    }];
}
#pragma clang diagnostic pop

#pragma mark - Subscribe Methods with Handler Block
- (id)subscribe:(NSString *)eventName handler:(XZEventHandler)handler {
    return [self subscribe:eventName obj:nil handler:handler];
}

- (id)subscribe:(NSString *)eventName obj:(id)obj handler:(XZEventHandler)handler {
    id observer =  [[NSNotificationCenter defaultCenter] addObserverForName:eventName object:obj queue:_pubSubQueue usingBlock:^(NSNotification *note) {
        XZEvent *event = [[XZEvent alloc] initWithName:eventName obj:note.object data:[note.userInfo objectForKey:kXZPubSubDataKey]];
        handler(event);
    }];
    NSMutableDictionary *subscriptions = (NSMutableDictionary *)objc_getAssociatedObject(self, &kXZPubSubSubscriptionsKey);
    if (!subscriptions) {
        subscriptions = [[NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, &kXZPubSubSubscriptionsKey, subscriptions, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    NSMutableSet *observers = [subscriptions objectForKey:eventName];
    if (!observers) {
        observers = [[NSMutableSet alloc] init];
        [subscriptions setObject:observers forKey:eventName];
    }
    [observers addObject:observer];
    return observer;
}

- (id)subscribeOnce:(NSString *)eventName handler:(XZEventHandler)handler {
    __weak __typeof__(self) weakSelf = self;
    return [self subscribe:eventName handler:^(XZEvent *evt) {
        __strong __typeof__(weakSelf) strongSelf = weakSelf;
        [strongSelf unsubscribe:eventName];
        handler(evt);
    }];
}

- (id)subscribeOnce:(NSString *)eventName obj:(id)obj handler:(XZEventHandler)handler {
    __weak __typeof__(self) weakSelf = self;
    return [self subscribe:eventName obj:obj handler:^(XZEvent *evt) {
        __strong __typeof__(weakSelf) strongSelf = weakSelf;
        [strongSelf unsubscribe:eventName];
        handler(evt);
    }];
}

- (void)unsubscribe:(NSString *)eventName {
    NSMutableDictionary *subscriptions = (NSMutableDictionary *)objc_getAssociatedObject(self, &kXZPubSubSubscriptionsKey);
    if (!subscriptions)
        return;
    NSMutableSet *observers = [subscriptions objectForKey:eventName];
    if (observers) {
        for (id observer in observers) {
            [[NSNotificationCenter defaultCenter] removeObserver:observer];
        }
        [subscriptions removeObjectForKey:eventName];
    }
}

- (void)unsubscribeAll {
    NSMutableDictionary *subscriptions = (NSMutableDictionary *)objc_getAssociatedObject(self, &kXZPubSubSubscriptionsKey);
    if (!subscriptions)
        return;
    for (NSString *eventName in subscriptions) {
        NSMutableSet *observers = [subscriptions objectForKey:eventName];
        for (id observer in observers) {
            [[NSNotificationCenter defaultCenter] removeObserver:observer];
        }
    }
    [subscriptions removeAllObjects];
}

@end
