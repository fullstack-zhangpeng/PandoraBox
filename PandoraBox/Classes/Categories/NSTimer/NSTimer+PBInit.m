//
//  NSTimer+PBInit.m
//  PandoraBox
//
//  Created by 张鹏 on 2019/7/4.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import "NSTimer+PBInit.h"

@implementation NSTimer (PBInit)

+ (NSTimer *)pb_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                         block:(void (^)(void))block
                                       repeats:(BOOL)repeats {
    return [self scheduledTimerWithTimeInterval:interval
                                         target:self
                                       selector:@selector(pb_blockInvoke:)
                                       userInfo:[block copy]
                                        repeats:repeats];
}

+ (void)pb_blockInvoke:(NSTimer*)timer {
    void(^block)(void) = timer.userInfo;
    if (block)
    {
        block();
    }
}

@end
