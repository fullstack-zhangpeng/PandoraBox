//
//  UIDevice+PBInfo.m
//  PandoraBox
//
//  Created by 张鹏 on 2019/7/3.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import "UIDevice+PBInfo.h"
#import <sys/utsname.h>

@implementation UIDevice (PBInfo)

- (NSString *)pb_devicePlatform {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    return platform;
}

- (NSString *)pb_deviceVersion {
    return [[UIDevice currentDevice] systemVersion];
}

- (NSString *)pb_deviceResolution {
    CGRect rect_screen = [[UIScreen mainScreen]bounds];
    CGSize size_screen = rect_screen.size;
    CGFloat scale_screen = [UIScreen mainScreen].scale;
    CGFloat width = size_screen.width*scale_screen;
    CGFloat height = size_screen.height*scale_screen;
    return [NSString stringWithFormat:@"%.fx%.f", width, height];
}

@end
