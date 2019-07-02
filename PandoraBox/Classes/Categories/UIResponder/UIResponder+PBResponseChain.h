//
//  UIResponder+PBResponseChain.h
//  PandoraBox
//
//  Created by 张鹏 on 2019/7/2.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIResponder (PBResponseChain)

/**
 响应方法

 @param name 方法名
 @param userInfo 携带参数
 */
- (void)pb_respondWithName:(NSString *)name userInfo:(NSDictionary *)userInfo;
@end

NS_ASSUME_NONNULL_END
