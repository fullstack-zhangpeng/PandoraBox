//
//  NSObject+PBAssociated.m
//  PandoraBox
//
//  Created by 张鹏 on 2019/7/3.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import "NSObject+PBAssociated.h"

@implementation NSObject (PBAssociated)

- (id)pb_objectWithAssociatedKey:(void *)key {
    return objc_getAssociatedObject(self, key);
}

- (void)pb_setObject:(id)object forAssociatedKey:(void *)key associationPolicy:(objc_AssociationPolicy)policy {
    objc_setAssociatedObject(self, key, object, policy);
}

@end
