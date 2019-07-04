//
//  NSString+PBUrlString.m
//  PandoraBox
//
//  Created by 张鹏 on 2019/7/4.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import "NSString+PBUrlString.h"

@implementation NSString (PBUrlString)

/**
 *  获取URL中的参数
 *
 *  @return NSDictionary parameters
 */
- (NSDictionary *)pb_getURLParameters {
    // 查找参数
    NSRange range = [self rangeOfString:@"?"];
    if (range.location == NSNotFound) {
        return nil;
    }
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    // 截取参数
    NSString *parametersString = [self substringFromIndex:range.location + 1];
    // 判断参数是单个参数还是多个参数
    if ([parametersString containsString:@"&"]) {
        // 多个参数，分割参数
        NSArray *urlComponents = [parametersString componentsSeparatedByString:@"&"];
        for (NSString *keyValuePair in urlComponents) {
            // 生成Key/Value
            NSArray *pairComponents = [keyValuePair componentsSeparatedByString:@"="];
            NSString *key = [pairComponents.firstObject stringByRemovingPercentEncoding];
            NSString *value = [pairComponents.lastObject stringByRemovingPercentEncoding];
            // Key不能为nil
            if (key == nil || value == nil) {
                continue;
            }
            id existValue = [params valueForKey:key];
            if (existValue != nil) {
                // 已存在的值，生成数组
                if ([existValue isKindOfClass:[NSArray class]]) {
                    // 已存在的值生成数组
                    NSMutableArray *items = [NSMutableArray arrayWithArray:existValue];
                    [items addObject:value];
                    [params setValue:items forKey:key];
                } else {
                    // 非数组
                    [params setValue:@[existValue, value] forKey:key];
                }
            } else {
                // 设置值
                [params setValue:value forKey:key];
            }
        }
    }
    else { // 单个参数
        // 生成Key/Value
        NSArray *pairComponents = [parametersString componentsSeparatedByString:@"="];
        // 只有一个参数，没有值
        if (pairComponents.count == 1) {
            return nil;
        }
        // 分隔值
        NSString *key = [pairComponents.firstObject stringByRemovingPercentEncoding];
        NSString *value = [pairComponents.lastObject stringByRemovingPercentEncoding];
        // Key不能为nil
        if (key == nil || value == nil) {
            return nil;
        }
        // 设置值
        [params setValue:value forKey:key];
    }
    return params.copy;
}

#pragma mark - AddParam

/**
 添加参数
 
 @param key key
 @param value value
 @return 拼接后的字符串
 */
- (NSString *)pb_appendParamWithKey:(NSString *)key value:(NSString *)value {
    if (!key || !value) {
        return self;
    }
    return [self pb_appendParams:@{key : value}];
}

/**
 添加参数
 
 @param dic 参数字典
 @return 拼接后的字符串
 */
- (NSString *)pb_appendParams:(NSDictionary *)dic {
    NSMutableString *url = [NSMutableString stringWithString:self];
    if ([url rangeOfString:@"?"].location == NSNotFound) {
        [url appendString:@"?"];
    }
    for (NSString *key in dic.allKeys) {
        if (![url hasSuffix:@"&"] && ![url hasSuffix:@"?"]) {
            [url appendString:@"&"];
        }
        [url appendFormat:@"%@=%@", key, [dic valueForKey:key]];
    }
    return [NSString stringWithString:url];
}

@end