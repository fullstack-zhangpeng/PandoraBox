//
//  UIDevice+PBInfo.h
//  PandoraBox
//
//  Created by 张鹏 on 2019/7/3.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (PBInfo)

/// 设备型号, e.g. @"iPhone1,1"
@property(nonatomic, copy, readonly) NSString *pb_devicePlatform;

/// 系统版本, e.g. @"11.0"
@property(nonatomic, copy, readonly) NSString *pb_deviceVersion;

/// 设备分辨率 e.g. @"1125 x 2436"
@property(nonatomic, copy, readonly) NSString *pb_deviceResolution;

@end

NS_ASSUME_NONNULL_END
