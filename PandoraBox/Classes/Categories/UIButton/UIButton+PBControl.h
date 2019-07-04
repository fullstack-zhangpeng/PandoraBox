//
//  UIButton+PBControl.h
//  PandoraBox
//
//  Created by 张鹏 on 2019/7/5.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (PBControl)

@property (nonatomic, assign) NSTimeInterval clickInterval; // 双击间隔

//放大点击范围
- (void)setEnlargeEdgeWithTop:(CGFloat)top left:(CGFloat)left bottom:(CGFloat)bottom right:(CGFloat)right;

- (void)setEnlargeEdge:(CGFloat)size;

@end

NS_ASSUME_NONNULL_END
