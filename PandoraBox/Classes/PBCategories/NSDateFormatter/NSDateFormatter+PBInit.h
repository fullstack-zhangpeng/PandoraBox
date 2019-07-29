//
//  NSDateFormatter+PBInit.h
//  PandoraBox
//
//  Created by zhangpeng on 2019/6/19.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDateFormatter (PBInit)

/// 根据传入格式字符串，生成一个 NSDateFormatter 对象
/// 生成后，以格式字符串为 Key，NSDateFormatter 对象为值，保存在线程信息中
/// 再次使用时，如果线程信息已有，直接返回；没有就创建并返回
/// @param string 格式化字符串
+ (NSDateFormatter *)pb_dateFormatterWithString:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
