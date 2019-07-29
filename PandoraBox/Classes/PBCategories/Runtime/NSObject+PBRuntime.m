//
//  NSObject+PBRuntime.m
//  PandoraBox
//
//  Created by 张鹏 on 2019/7/6.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import "NSObject+PBRuntime.h"
#import <objc/runtime.h>

@implementation NSObject (PBRuntime)

/**
 获取类名
 
 @param class 相应类
 @return NSString：类名
 */
+ (NSString *)pb_getClassName
{
    const char *className = class_getName(self);
    return [NSString stringWithUTF8String:className];
}

/**
 获取成员变量
 
 @param class Class
 @return NSArray
 */
+ (NSArray *)pb_getIvarList
{
    unsigned int count = 0;
    Ivar *ivarList = class_copyIvarList(self, &count);
    
    NSMutableArray *mutableList = [NSMutableArray arrayWithCapacity:count];
    for (unsigned int i = 0; i < count; i++) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:2];
        const char *ivarName = ivar_getName(ivarList[i]);
        const char *ivarType = ivar_getTypeEncoding(ivarList[i]);
        dic[@"type"] = [NSString stringWithUTF8String:ivarType];
        dic[@"ivarName"] = [NSString stringWithUTF8String:ivarName];
        
        [mutableList addObject:dic];
    }
    free(ivarList);
    return [NSArray arrayWithArray:mutableList];
}

/**
 获取类的属性列表, 包括私有和公有属性，以及定义在延展中的属性
 
 @param class Class
 @return 属性列表数组
 */
+ (NSArray *)pb_getPropertyList
{
    unsigned int count = 0;
    objc_property_t *propertyList = class_copyPropertyList(self, &count);
    
    NSMutableArray *mutableList = [NSMutableArray arrayWithCapacity:count];
    for (unsigned int i = 0; i < count; i++) {
        const char *propertyName = property_getName(propertyList[i]);
        [mutableList addObject:[NSString stringWithUTF8String:propertyName]];
    }
    free(propertyList);
    return [NSArray arrayWithArray:mutableList];
}

/**
 获取类的实例方法列表：getter, setter, 对象方法等。但不能获取类方法
 
 @param class class description
 @return <#return value description#>
 */
+ (NSArray *)pb_getMethodList
{
    unsigned int count = 0;
    Method *methodList = class_copyMethodList(self, &count);
    
    NSMutableArray *mutableList = [NSMutableArray arrayWithCapacity:count];
    for (unsigned int i = 0; i < count; i++) {
        Method method = methodList[i];
        SEL methodName = method_getName(method);
        [mutableList addObject:NSStringFromSelector(methodName)];
    }
    free(methodList);
    return [NSArray arrayWithArray:mutableList];
}

/**
 获取协议列表
 
 @param class <#class description#>
 @return <#return value description#>
 */
+ (NSArray *)pb_getProtocolList
{
    unsigned int count = 0;
    __unsafe_unretained Protocol **protocolList = class_copyProtocolList(self, &count);
    
    NSMutableArray *mutableList = [NSMutableArray arrayWithCapacity:count];
    for (unsigned int i = 0; i < count; i++) {
        Protocol *protocol = protocolList[i];
        const char *protocolName = protocol_getName(protocol);
        [mutableList addObject:[NSString stringWithUTF8String:protocolName]];
    }
    
    return [NSArray arrayWithArray:mutableList];
    return nil;
}
@end
