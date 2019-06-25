//
//  PBTimerManager.h
//  PandoraBox_Example
//
//  Created by 张鹏 on 2019/6/19.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PBTimerManager : NSObject

+ (instancetype)sharedInstance;

/**
 创建 timer
 
 @param timerIdentifier timer 的唯一标识符
 @param interval timer的执行间隔
 @param queue timer 执行的队列
 @param repeat 是否重复执行
 @param action 执行的 Block
 */
- (void)pb_scheduledTimerWithName:(NSString *)timerIdentifier
                         interval:(float)interval
                            queue:(dispatch_queue_t _Nullable)queue
                           repeat:(BOOL)repeat
                           action:(dispatch_block_t)action;

/**
 开始执行 timer
 
 @param timerIdentifier timer 的唯一标识符
 */
- (void)pb_startTimerWithName:(NSString *)timerIdentifier;

/**
 停止执行 timer，并移除
 
 @param timerIdentifier timer 的唯一标识符
 */
- (void)pb_stopTimerWithName:(NSString *)timerIdentifier;

/**
 挂起 timer
 
 @param timerIdentifier timer 的唯一标识符
 */
- (void)pb_suspendTimerWithName:(NSString *)timerIdentifier;

/**
 恢复 timer
 
 @param timerIdentifier timer 的唯一标识符
 */
- (void)pb_resumeTimerWithName:(NSString *)timerIdentifier;

/**
 获取当前已有的所有 timer
 
 @return 当前已有的所有 timer
 */
- (NSDictionary *)pb_getAllTimers;

@end

NS_ASSUME_NONNULL_END
