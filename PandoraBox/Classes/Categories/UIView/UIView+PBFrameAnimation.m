//
//  UIView+PBFrameAnimation.m
//  PandoraBox
//
//  Created by 张鹏 on 2019/7/3.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import "UIView+PBFrameAnimation.h"

@implementation UIView (PBFrameAnimation)
- (CAKeyframeAnimation *)pb_addFrameAnimationWithImages:(NSArray<UIImage *> *)images {
    NSMutableArray *imageRefs = [NSMutableArray array];
    for (UIImage *image in images) {
        CGImageRef imageRef = image.CGImage;
        [imageRefs addObject:(__bridge id _Nonnull)(imageRef)];
    }
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"contents"];
    animation.values = imageRefs.copy;
    [self.layer addAnimation:animation forKey:nil];
    return animation;
}
@end
