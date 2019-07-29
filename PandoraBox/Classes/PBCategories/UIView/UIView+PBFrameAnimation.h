//
//  UIView+PBFrameAnimation.h
//  PandoraBox
//
//  Created by 张鹏 on 2019/7/3.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (PBFrameAnimation)
- (CAKeyframeAnimation *)pb_addFrameAnimationWithImages:(NSArray<UIImage *> *)images;
@end

NS_ASSUME_NONNULL_END
