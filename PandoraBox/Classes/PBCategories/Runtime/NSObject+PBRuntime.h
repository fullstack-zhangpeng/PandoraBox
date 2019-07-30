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

 @return 类名
 */
+ (NSString *)pb_getClassName;

/**
 获取成员变量

 @return 所有成员变量
 */
+ (NSArray *)pb_getIvarList;

/**
 获取类的属性列表
 
 包括私有、公有属性和定义在延展中的属性

 @return 所有属性
 */
+ (NSArray *)pb_getPropertyList;

/**
 获取对象方法列表
 
 getter, setter, 对象方法等。但不能获取类方法
 
 @return 所有方法
 */
+ (NSArray *)pb_getMethodList;

/**
 获取协议列表

 @return 所有协议
 */
+ (NSArray *)pb_getProtocolList;

@end

NS_ASSUME_NONNULL_END
