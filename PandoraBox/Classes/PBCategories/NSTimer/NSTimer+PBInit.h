//
//  NSTimer+PBInit.h
//  PandoraBox
//
//  Created by 张鹏 on 2019/7/4.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (PBInit)

+ (NSTimer *)pb_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                         block:(void(^)(void))block
                                       repeats:(BOOL)repeats;

@end

NS_ASSUME_NONNULL_END
