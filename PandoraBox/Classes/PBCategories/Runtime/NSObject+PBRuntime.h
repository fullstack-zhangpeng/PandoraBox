//
//  NSObject+PBRuntime.h
//  PandoraBox
//
//  Created by 张鹏 on 2019/7/6.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (PBRuntime)

/**
 获取类名
 
 @param class 相应类
 @return NSString：类名
 */
+ (NSString *)pb_getClassName;

/**
 获取成员变量
 
 @param class 成员变量所在的类
 @return 返回成员变量字符串数组
 */
+ (NSArray *)pb_getIvarList;

/**
 获取类的属性列表, 包括私有和公有属性，即定义在延展中的属性
 
 @param class Class
 @return 属性列表数组
 */
+ (NSArray *)pb_getPropertyList;

/**
 获取对象方法列表：getter, setter, 对象方法等。但不能获取类方法
 
 @param class 方法所在的类
 @return 该类的方法列表
 */
+ (NSArray *)pb_getMethodList;

/**
 获取协议列表
 
 @param class 实现协议的类
 @return 返回该类实现的协议列表
 */
+ (NSArray *)pb_getProtocolList;

@end

NS_ASSUME_NONNULL_END
