//
//  NSMutableURLRequest+XZUpload.h
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/9.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface NSMutableURLRequest (XZUpload)

/**
 *  生成单文件上传的 multipart/form-data 请求
 *
 *  @param URL     负责上传的 url
 *  @param fileURL 要上传的本地文件 url
 *  @param name    服务器脚本字段名
 *
 *  @return multipart/form-data POST 请求，保存到服务器的文件名与本地的文件名一致
 */
+ (instancetype)xz_requestWithURL:(nonnull NSURL *)URL fileURL:(nonnull NSURL *)fileURL name:(nonnull NSString *)name;

/**
 *  生成单文件上传的 multipart/form-data 请求
 *
 *  @param URL      负责上传的 url
 *  @param fileURL  要上传的本地文件 url
 *  @param fileName 要保存在服务器上的文件名
 *  @param name     服务器脚本字段名
 *
 *  @return multipart/form-data POST 请求
 */
+ (instancetype)xz_requestWithURL:(nonnull NSURL *)URL fileURL:(nonnull NSURL *)fileURL fileName:(nonnull NSString *)fileName name:(nonnull NSString *)name;

/**
 *  生成多文件上传的 multipart/form-data 请求
 *
 *  @param URL      负责上传的 url
 *  @param fileURLs 要上传的本地文件 url 数组
 *  @param name     服务器脚本字段名
 *
 *  @return multipart/form-data POST 请求，保存到服务器的文件名与本地的文件名一致
 */
+ (instancetype)xz_requestWithURL:(nonnull NSURL *)URL fileURLs:(nonnull NSArray *)fileURLs name:(nonnull NSString *)name;

/**
 *  生成多文件上传的 multipart/form-data 请求
 *
 *  @param URL       负责上传的 url
 *  @param fileURLs  要上传的本地文件 url 数组
 *  @param fileNames 要保存在服务器上的文件名数组
 *  @param name      服务器脚本字段名
 *
 *  @return multipart/form-data POST 请求
 */
+ (instancetype)xz_requestWithURL:(nonnull NSURL *)URL fileURLs:(nonnull NSArray *)fileURLs fileNames:(nonnull NSArray *)fileNames name:(nonnull NSString *)name;

@end
NS_ASSUME_NONNULL_END