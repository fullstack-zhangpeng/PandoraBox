//
//  PBFileTool.m
//  PandoraBox_Example
//
//  Created by 张鹏 on 2019/7/29.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import "PBFileTool.h"
#import <SSZipArchive/SSZipArchive.h>

@implementation PBFileTool

#pragma mark - File Methods

+ (BOOL)pb_createFileAtPath:(NSString *)path overwrite:(BOOL)overwrite error:(NSError * *)error {
    if (!path || (path.length <= 0)) {
        return NO;
    }
    // 如果文件夹路径不存在，那么先创建文件夹
    NSString *directoryPath = [self getDirectoryPathForPath:path];
    if (![self pb_isExistsAtPath:directoryPath] && ![self pb_createDirectoryAtPath:directoryPath error:error]) {
        return NO;
    }
    // 如果文件存在，并不想覆盖，那么直接返回YES。
    if (!overwrite && [self pb_isExistsAtPath:path]) {
        return YES;
    }
    /**
     创建文件
     *参数1：创建文件的路径
     *参数2：创建文件的内容（NSData类型）
     *参数3：文件相关属性
     */
    BOOL isSuccess = [[NSFileManager defaultManager] createFileAtPath:path contents:nil attributes:nil];
    return isSuccess;
}

+ (BOOL)pb_checkExistsForFile:(NSString *)file inDirectory:(NSString *)directory recursive:(BOOL)recursive {
    if (!file || (file.length <= 0)) {
        return NO;
    }
    // 获取文件夹内所有文件及文件夹
    NSArray *files = [self pb_getItemsInDirectoryAtPath:directory recursive:recursive];
    if (files.count <= 0) {
        return NO;
    }
    BOOL result = NO;
    for (NSString *item in files) {
        if ([item hasSuffix:file]) {
            NSString *fullPath = [NSString stringWithFormat:@"%@/%@", directory, file];
            if (![self pb_isDirectoryAtPath:fullPath error:nil]) {
                result = YES;
                break;
            }
        }
    }
    return result;
}

+ (NSArray<NSString *> *)pb_pathsForFile:(NSString *)file inDirectory:(NSString *)directory recursive:(BOOL)recursive  {
    if (!file || (file.length <= 0)) {
        return @[];
    }
    // 获取文件夹内所有文件及文件夹
    NSArray *files = [self pb_getItemsInDirectoryAtPath:directory recursive:recursive];
    if (files.count <= 0) {
        return @[];
    }
    NSMutableArray<NSString *> *result = [NSMutableArray array];
    for (NSString *item in files) {
        if ([item hasSuffix:file]) {
            NSString *fullPath = [NSString stringWithFormat:@"%@/%@", directory, file];
            if (![self pb_isDirectoryAtPath:fullPath error:nil]) {
                [result addObject:fullPath];
            }
        }
    }
    return result.copy;
}

+ (BOOL)pb_isDirectoryAtPath:(NSString *)path error:(NSError *__autoreleasing *)error {
    return ([self pb_attributeOfItemAtPath:path forKey:NSFileType error:error] == NSFileTypeDirectory);
}

#pragma mark - Directory Methods

+ (BOOL)pb_createDirectoryAtPath:(NSString *)path error:(NSError *__autoreleasing *)error  {
    if (!path || (path.length <= 0)) {
        return NO;
    }
    if ([self pb_isExistsAtPath:path]) {
        return YES;
    }
    NSFileManager *manager = [NSFileManager defaultManager];
    BOOL isSuccess = [manager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:error];
    return isSuccess;
}

+ (NSArray<NSString *> *)pb_getItemsInDirectoryAtPath:(NSString *)path recursive:(BOOL)recursive  {
    if (!path || (path.length <= 0) || ![self pb_isDirectoryAtPath:path error:nil]) {
        return @[];
    }
    NSArray *listArr;
    NSError *error;
    NSFileManager *manager = [NSFileManager defaultManager];
    if (recursive) {
        // 深遍历
        NSArray *deepArr = [manager subpathsOfDirectoryAtPath:path error:&error];
        if (!error) {
            listArr = deepArr;
        }else {
            listArr = nil;
        }
    }else {
        // 浅遍历
        NSArray *shallowArr = [manager contentsOfDirectoryAtPath:path error:&error];
        if (!error) {
            listArr = shallowArr;
        }else {
            listArr = nil;
        }
    }
    return listArr;
}

#pragma mark - Common Methods

+ (NSString *)getDirectoryPathForPath:(NSString *)path  {
    return [path stringByDeletingLastPathComponent];
}

+ (BOOL)pb_isExistsAtPath:(NSString *)path  {
    return [[NSFileManager defaultManager] fileExistsAtPath:path];
}

+ (BOOL)pb_removeItemAtPath:(NSString *)path error:(NSError *__autoreleasing *)error  {
    return [[NSFileManager defaultManager] removeItemAtPath:path error:error];
}

+ (BOOL)pb_compressItemsWithPaths:(NSArray<NSString *> *)itemPaths toZip:(NSString *)zipFilePath  {
    if ((itemPaths.count <= 0) || zipFilePath.length <= 0) {
        return NO;
    }
    return [SSZipArchive createZipFileAtPath:zipFilePath withFilesAtPaths:itemPaths];
}

+ (id)pb_attributeOfItemAtPath:(NSString *)path forKey:(NSString *)key error:(NSError *__autoreleasing *)error {
    return [[self pb_attributesOfItemAtPath:path error:error] objectForKey:key];
}

+ (NSDictionary *)pb_attributesOfItemAtPath:(NSString *)path error:(NSError *__autoreleasing *)error {
    return [[NSFileManager defaultManager] attributesOfItemAtPath:path error:error];
}

@end
