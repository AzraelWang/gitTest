//
//  NSMutableURLRequest+XZUpload.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/9.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import "NSMutableURLRequest+XZUpload.h"

@implementation NSMutableURLRequest (XZUpload)


+ (instancetype)xz_requestWithURL:(nonnull NSURL *)URL fileURL:(nonnull NSURL *)fileURL name:(nonnull NSString *)name {
    return [self xz_requestWithURL:URL fileURLs:@[fileURL] name:name];
}

+ (instancetype)xz_requestWithURL:(nonnull NSURL *)URL fileURL:(nonnull NSURL *)fileURL fileName:(nonnull NSString *)fileName name:(nonnull NSString *)name{
    return [self xz_requestWithURL:URL fileURLs:@[fileURL] fileNames:@[fileName] name:name];
}

+ (instancetype)xz_requestWithURL:(nonnull NSURL *)URL fileURLs:(nonnull NSArray *)fileURLs name:(nonnull NSString *)name {
    
    NSMutableArray *fileNames = [NSMutableArray arrayWithCapacity:fileURLs.count];
    [fileURLs enumerateObjectsUsingBlock:^(NSURL *fileURL, NSUInteger idx, BOOL *stop) {
        [fileNames addObject:fileURL.path.lastPathComponent];
    }];
    
    return [self xz_requestWithURL:URL fileURLs:fileURLs fileNames:fileNames name:name];
}

+ (instancetype)xz_requestWithURL:(nonnull NSURL *)URL fileURLs:(nonnull NSArray *)fileURLs fileNames:(nonnull NSArray *)fileNames name:(nonnull NSString *)name {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    
    request.HTTPMethod = @"POST";
    
    NSMutableData *data = [NSMutableData data];
    NSString *boundary = multipartFormBoundary();
    
    if (fileURLs.count > 1) {
        name = [name stringByAppendingString:@"[]"];
    }
    
    [fileURLs enumerateObjectsUsingBlock:^(NSURL *fileURL, NSUInteger idx, BOOL *stop) {
        NSString *bodyStr = [NSString stringWithFormat:@"\n--%@\n", boundary];
        [data appendData:[bodyStr dataUsingEncoding:NSUTF8StringEncoding]];
        
        NSString *fileName = fileNames[idx];
        bodyStr = [NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\" \n", name, fileName];
        [data appendData:[bodyStr dataUsingEncoding:NSUTF8StringEncoding]];
        [data appendData:[@"Content-Type: application/octet-stream\n\n" dataUsingEncoding:NSUTF8StringEncoding]];
        
        [data appendData:[NSData dataWithContentsOfURL:fileURL]];
        
        [data appendData:[@"\n" dataUsingEncoding:NSUTF8StringEncoding]];
    }];
    
    NSString *tailStr = [NSString stringWithFormat:@"--%@--\n", boundary];
    [data appendData:[tailStr dataUsingEncoding:NSUTF8StringEncoding]];
    
    request.HTTPBody = data;
    
    NSString *headerString = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
    [request setValue:headerString forHTTPHeaderField:@"Content-Type"];
    
    return request;
}

static NSString * multipartFormBoundary() {
    return [NSString stringWithFormat:@"Boundary+%08X%08X", arc4random(), arc4random()];
}

@end
