//
//  NSString+PBUrlString.h
//  PandoraBox
//
//  Created by 张鹏 on 2019/7/4.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (PBUrlString)

#pragma mark - GetParam

/**
 *  获取URL中的参数
 *
 *  @return NSDictionary parameters
 */
- (NSDictionary *)pb_getURLParameters;

#pragma mark - AddParam

/**
 添加参数

 @param key key
 @param value value
 @return 拼接后的字符串
 */
- (NSString *)pb_appendParamWithKey:(NSString *)key value:(NSString *)value;

/**
 添加参数

 @param dic 参数字典
 @return 拼接后的字符串
 */
- (NSString *)pb_appendParams:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
