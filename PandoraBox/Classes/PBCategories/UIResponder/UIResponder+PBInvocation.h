//
//  UIResponder+PBInvocation.h
//  PandoraBox
//
//  Created by 张鹏 on 2019/7/2.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIResponder (PBInvocation)
- (NSInvocation *)pb_createInvocationWithSelector:(SEL)selector;
@end

NS_ASSUME_NONNULL_END
