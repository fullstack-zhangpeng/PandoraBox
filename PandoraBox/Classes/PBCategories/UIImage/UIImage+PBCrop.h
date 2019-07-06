//
//  UIImage+PBCrop.h
//  PandoraBox
//
//  Created by 张鹏 on 2019/7/3.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (PBCrop)

#pragma mark - Rounded

/**
 获取圆形图片
 
 @return 圆形图片
 */
- (UIImage *)pb_roundedImage;

#pragma mark - Resize

/**
 * 将一张图片调整到指定size，生成一张新图片
 *
 * @param size size
 *
 * @return UIImage
 */
- (UIImage *)pb_resizedImageToSize:(CGSize)size;

#pragma mark - Joint

/**
 * 将一张图片绘制到另一张图片的指定位置
 *
 * @param image         图片
 * @param point         指定绘制位置
 *
 * @return UIImage
 */
- (UIImage *)pb_drawImage:(UIImage *)image atPosition:(CGPoint)point;

#pragma mark - Crop

/**
 * 处理图片圆角
 *
 * @param cornerRadius 圆角弧度
 *
 * @return UIImage
 */
- (UIImage *)pb_cropImageWithCornerRadius:(CGFloat)cornerRadius;

/**
 * 处理图片圆角
 *
 * @param rectCornerType 圆角位置
 * @param cornerRadius 圆角弧度
 *
 * @return UIImage
 */
- (UIImage *)pb_cropImageWithCorner:(UIRectCorner)rectCornerType cornerRadius:(CGFloat)cornerRadius;

@end

NS_ASSUME_NONNULL_END
