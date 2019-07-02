//
//  UIResponder+PBResponseChain.m
//  PandoraBox
//
//  Created by 张鹏 on 2019/7/2.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import "UIResponder+PBResponseChain.h"

@implementation UIResponder (PBResponseChain)

- (void)pb_respondWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo {
    [[self nextResponder] pb_respondWithName:eventName userInfo:userInfo];
}

@end
