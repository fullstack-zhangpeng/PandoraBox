//
//  UIResponder+PBInvocation.m
//  PandoraBox
//
//  Created by 张鹏 on 2019/7/2.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import "UIResponder+PBInvocation.h"

@implementation UIResponder (PBInvocation)
- (NSInvocation *)pb_createInvocationWithSelector:(SEL)selector {
    NSMethodSignature *signature = [self methodSignatureForSelector:selector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.target = self;
    invocation.selector = selector;
    return invocation;
}
@end
