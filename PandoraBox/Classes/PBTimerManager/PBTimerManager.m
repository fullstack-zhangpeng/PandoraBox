//
//  PBTimerManager.m
//  PandoraBox_Example
//
//  Created by 张鹏 on 2019/6/19.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import "PBTimerManager.h"

@interface PBTimer : NSObject
/// timer 唯一标识
@property (nonatomic, strong) NSString *timerIdentifier;
/// timer 所在线程
@property (nonatomic, strong) dispatch_queue_t queue;
/// gcd timer
@property (nonatomic, strong) dispatch_source_t timer;
/// 执行间隔
@property (nonatomic, assign) float interval;
/// 是否重复
@property (nonatomic, assign) BOOL repeat;
/// 运行状态
@property (nonatomic, assign) BOOL runing;
/// 执行的动作
@property (nonatomic, copy) dispatch_block_t action;
@end

@implementation PBTimer

@end

#pragma mark -

@interface PBTimerManager ()
@property (nonatomic, strong) NSMutableDictionary *timerDictionary;
@end

@implementation PBTimerManager

+ (instancetype)sharedInstance {
    static PBTimerManager *_gcdTimerManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        _gcdTimerManager = [[PBTimerManager alloc] init];
        _gcdTimerManager.timerDictionary = [NSMutableDictionary dictionary];
    });
    return _gcdTimerManager;
}

- (void)pb_scheduledTimerWithName:(NSString *)timerIdentifier interval:(float)interval queue:(dispatch_queue_t)queue repeat:(BOOL)repeat action:(dispatch_block_t)action {
    NSAssert((timerIdentifier && (timerIdentifier.length > 0)) , @"timerIdentifier can't be empty");
    NSAssert(interval > 0 , @"interval should be greater than 0");
    
    if (!timerIdentifier || (timerIdentifier.length == 0) || (interval <= 0)) {
        return;
    }
    
    if (!queue) {
        NSString *queueName = @"com.pb.timerManagerQueue";
        queue = dispatch_queue_create([queueName cStringUsingEncoding:NSASCIIStringEncoding], DISPATCH_QUEUE_SERIAL);
    }
    
    PBTimer *timer = self.timerDictionary[timerIdentifier];
    if (timer) {
        return;
    }
    
    timer = [[PBTimer alloc] init];
    timer.timerIdentifier = timerIdentifier;
    timer.queue = queue;
    timer.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    timer.interval = interval;
    timer.repeat = repeat;
    timer.runing = NO;
    timer.action = action;
    
    self.timerDictionary[timerIdentifier] = timer;
}

- (void)pb_startTimerWithName:(NSString *)timerIdentifier {
    NSAssert((timerIdentifier && (timerIdentifier.length > 0)) , @"timerIdentifier can't be empty");
    
    if (!timerIdentifier || (timerIdentifier.length == 0)) {
        return;
    }
    
    PBTimer *timer = self.timerDictionary[timerIdentifier];
    if (!timer || timer.runing) {
        return;
    }
    
    dispatch_source_set_timer(timer.timer, DISPATCH_TIME_NOW, timer.interval * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer.timer, ^{
        if (timer.action) {
            timer.action();
        }
        if (!timer.repeat) {
            [self pb_stopTimerWithName:timerIdentifier];
        }
    });
    [self pb_resumeTimerWithName:timerIdentifier];
}

- (void)pb_stopTimerWithName:(NSString *)timerIdentifier {
    NSAssert((timerIdentifier && (timerIdentifier.length > 0)) , @"timerIdentifier can't be empty");
    if (!timerIdentifier || (timerIdentifier.length == 0)) {
        return;
    }
    
    PBTimer *timer = self.timerDictionary[timerIdentifier];
    if (!timer) {
        return;
    }
    dispatch_source_cancel(timer.timer);
    [self.timerDictionary removeObjectForKey:timerIdentifier];
}

- (void)pb_suspendTimerWithName:(NSString *)timerIdentifier {
    NSAssert((timerIdentifier && (timerIdentifier.length > 0)) , @"timerIdentifier can't be empty");
    if (!timerIdentifier || (timerIdentifier.length == 0)) {
        return;
    }
    
    PBTimer *timer = self.timerDictionary[timerIdentifier];
    if (!timer || !timer.runing) {
        return;
    }
    dispatch_suspend(timer.timer);
    timer.runing = NO;
}

- (void)pb_resumeTimerWithName:(NSString *)timerIdentifier {
    NSAssert((timerIdentifier && (timerIdentifier.length > 0)) , @"timerIdentifier can't be empty");
    if (!timerIdentifier || (timerIdentifier.length == 0)) {
        return;
    }
    PBTimer *timer = self.timerDictionary[timerIdentifier];
    if (!timer || timer.runing) {
        return;
    }
    dispatch_resume(timer.timer);
    timer.runing = YES;
}

- (NSDictionary *)pb_getAllTimers {
    return self.timerDictionary.copy;
}

@end
