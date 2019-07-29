//
//  UIApplication+PBInfo.h
//  PandoraBox
//
//  Created by 张鹏 on 2019/7/3.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIApplication (PBInfo)

#pragma mark - AppInfo

// Application's Bundle Name (show in SpringBoard).
@property (nonatomic, copy, readonly) NSString * _Nullable pb_appBundleName;

// Application's Bundle ID.  e.g. "com.ibireme.MyApp"
@property (nonatomic, copy, readonly) NSString * _Nullable pb_appBundleID;

// Application's Version.  e.g. "1.2.0"
@property (nonatomic, copy, readonly) NSString * _Nullable pb_appVersion;

// Application's Build number. e.g. "123"
@property (nonatomic, copy, readonly) NSString * _Nullable pb_appBuildVersion;

#pragma mark - SandBox

// "Documents" folder in this app's sandbox.
@property (nonatomic, copy, readonly) NSString * _Nonnull pb_documentsPath;

// "Caches" folder in this app's sandbox.
@property (nonatomic, copy, readonly) NSString * _Nonnull pb_cachesPath;

// "Library" folder in this app's sandbox.
@property (nonatomic, copy, readonly) NSString * _Nonnull pb_libraryPath;

// "tmp" folder in this app's sandbox.
@property (nonatomic, copy, readonly) NSString * _Nonnull pb_tmpPath;

@end

NS_ASSUME_NONNULL_END
