//
//  NSDateFormatter+PBInit.m
//  PandoraBox
//
//  Created by zhangpeng on 2019/6/19.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import "NSDateFormatter+PBInit.h"

@implementation NSDateFormatter (PBInit)

+ (NSDateFormatter *)pb_dateFormatterWithString:(NSString *)string {
    NSMutableDictionary *threadDic = [[NSThread currentThread] threadDictionary];
    NSDateFormatter *dateFormatter = [threadDic objectForKey:string];
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:string];
        [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
        [dateFormatter setLocale:[NSLocale systemLocale]];
        [threadDic setObject:dateFormatter forKey:string];
    }
    return dateFormatter;
}

@end
