//
//  PBFileTool.h
//  PandoraBox_Example
//
//  Created by 张鹏 on 2019/7/29.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PBFileTool : NSObject

#pragma mark - File Methods

/**
 创建一个文件
 
 @param path 文件路径
 @param overwrite 如果已有，是否需要覆盖
 @param error error
 @return 是否成功创建
 */
+ (BOOL)pb_createFileAtPath:(NSString *)path overwrite:(BOOL)overwrite error:(NSError * *)error;

/**
 检查文件在指定文件内是否存在
 
 @param file 文件
 @param directory 指定文件夹
 @param recursive 是否递归
 @return 是否存在
 */
+ (BOOL)pb_checkExistsForFile:(NSString *)file inDirectory:(NSString *)directory recursive:(BOOL)recursive;

/**
 获取文件夹内的指定文件
 
 @param file 文件
 @param directory 文件夹
 @param recursive 是否递归
 @return 文件数组
 */
+ (NSArray<NSString *> *)pb_pathsForFile:(NSString *)file inDirectory:(NSString *)directory recursive:(BOOL)recursive;

#pragma mark - Directory Methods

/**
 创建一个文件夹
 
 @param path 文件夹路径
 @param error error
 @return 是否成功创建
 */
+ (BOOL)pb_createDirectoryAtPath:(NSString *)path error:(NSError *__autoreleasing *)error;

/**
 获取指定文件夹内的文件及文件夹
 
 @param path 文件夹路径
 @param recursive 是否递归
 @return 一个包含文件及文件夹的数组
 */
+ (NSArray<NSString *> *)pb_getItemsInDirectoryAtPath:(NSString *)path recursive:(BOOL)recursive;

/**
 指定路径是否是文件夹
 
 @param path 指定路径
 @param error error
 @return 是否是文件夹
 */
+ (BOOL)pb_isDirectoryAtPath:(NSString *)path error:(NSError *__autoreleasing *)error;

#pragma mark - Common Methods

/**
 指定路径是否存在
 
 @param path 路径
 @return 是否存在
 */
+ (BOOL)pb_isExistsAtPath:(NSString *)path;

/**
 移除指定 path 的内容
 
 @param path path
 @param error error
 @return 是否移除成功
 */
+ (BOOL)pb_removeItemAtPath:(NSString *)path error:(NSError *__autoreleasing *)error;

/**
 压缩指定内容到一个 zip 文件
 
 @param itemPaths 需要被压缩的路径
 @param zipFilePath zip 文件内容
 @return 是否成功压缩
 */
+ (BOOL)pb_compressItemsWithPaths:(NSArray<NSString *> *)itemPaths toZip:(NSString *)zipFilePath;

@end

NS_ASSUME_NONNULL_END
