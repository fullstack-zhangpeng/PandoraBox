//
//  UIImage+PBCrop.m
//  PandoraBox
//
//  Created by 张鹏 on 2019/7/3.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import "UIImage+PBCrop.h"

@implementation UIImage (PBCrop)

#pragma mark - Rounded

/**
 获取圆形图片
 
 @return 圆形图片
 */
- (UIImage *)pb_roundedImage {
    CGFloat w = self.size.width;
    CGFloat h = self.size.height;
    CGFloat scale = [UIScreen mainScreen].scale;
    
    UIImage *image = nil;
    CGRect rect = CGRectMake(0., 0., w, h);
    UIGraphicsBeginImageContextWithOptions(self.size, NO, scale);
    [[UIBezierPath bezierPathWithOvalInRect:rect] addClip];
    [self drawInRect:rect];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

#pragma mark - Resize

/**
 * 将一张图片调整到指定size，生成一张新图片
 *
 * @param size size
 *
 * @return UIImage
 */
- (UIImage *)pb_resizedImageToSize:(CGSize)size {
    CGImageRef imgRef = self.CGImage;
    // the below values are regardless of orientation : for UIImages from Camera, width>height (landscape)
    CGSize  srcSize = CGSizeMake(CGImageGetWidth(imgRef), CGImageGetHeight(imgRef)); // not equivalent to self.size (which is dependant on the imageOrientation)!
    
    /* Don't resize if we already meet the required destination size. */
    if (CGSizeEqualToSize(srcSize, size)) {
        return self;
    }
    
    CGFloat scaleRatio = size.width / srcSize.width;
    UIImageOrientation orient = self.imageOrientation;
    CGAffineTransform transform = CGAffineTransformIdentity;
    switch(orient) {
            
        case UIImageOrientationUp: //EXIF = 1
            transform = CGAffineTransformIdentity;
            break;
            
        case UIImageOrientationUpMirrored: //EXIF = 2
            transform = CGAffineTransformMakeTranslation(srcSize.width, 0.0);
            transform = CGAffineTransformScale(transform, -1.0, 1.0);
            break;
            
        case UIImageOrientationDown: //EXIF = 3
            transform = CGAffineTransformMakeTranslation(srcSize.width, srcSize.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationDownMirrored: //EXIF = 4
            transform = CGAffineTransformMakeTranslation(0.0, srcSize.height);
            transform = CGAffineTransformScale(transform, 1.0, -1.0);
            break;
            
        case UIImageOrientationLeftMirrored: //EXIF = 5
            size = CGSizeMake(size.height, size.width);
            transform = CGAffineTransformMakeTranslation(srcSize.height, srcSize.width);
            transform = CGAffineTransformScale(transform, -1.0, 1.0);
            transform = CGAffineTransformRotate(transform, 3.0 * M_PI_2);
            break;
            
        case UIImageOrientationLeft: //EXIF = 6
            size = CGSizeMake(size.height, size.width);
            transform = CGAffineTransformMakeTranslation(0.0, srcSize.width);
            transform = CGAffineTransformRotate(transform, 3.0 * M_PI_2);
            break;
            
        case UIImageOrientationRightMirrored: //EXIF = 7
            size = CGSizeMake(size.height, size.width);
            transform = CGAffineTransformMakeScale(-1.0, 1.0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight: //EXIF = 8
            size = CGSizeMake(size.height, size.width);
            transform = CGAffineTransformMakeTranslation(srcSize.height, 0.0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        default:
            [NSException raise:NSInternalInconsistencyException format:@"Invalid image orientation"];
            
    }
    
    /////////////////////////////////////////////////////////////////////////////
    // The actual resize: draw the image on a new context, applying a transform matrix
    UIGraphicsBeginImageContextWithOptions(size, NO, self.scale);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if (!context) {
        return nil;
    }
    
    if (orient == UIImageOrientationRight || orient == UIImageOrientationLeft) {
        CGContextScaleCTM(context, -scaleRatio, scaleRatio);
        CGContextTranslateCTM(context, -srcSize.height, 0);
    } else {
        CGContextScaleCTM(context, scaleRatio, -scaleRatio);
        CGContextTranslateCTM(context, 0, -srcSize.height);
    }
    
    CGContextConcatCTM(context, transform);
    
    // we use srcSize (and not dstSize) as the size to specify is in user space (and we use the CTM to apply a scaleRatio)
    CGContextDrawImage(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, srcSize.width, srcSize.height), imgRef);
    UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resizedImage;
}

#pragma mark - Joint

/**
 * 将一张图片绘制到另一张图片的指定位置
 *
 * @param image 图片
 * @param point 指定绘制位置
 *
 * @return UIImage
 */
- (UIImage *)pb_drawImage:(UIImage *)image atPosition:(CGPoint)point {
    if (!self.size.height || !self.size.width) {
        return self;
    }
    UIGraphicsBeginImageContextWithOptions(self.size, FALSE, self.scale);
    [self drawInRect:CGRectMake(0,0,self.size.width,self.size.height)];
    CGRect rect = CGRectMake(point.x, point.y, image.size.width, image.size.height);
    
    [image drawInRect:rect];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

#pragma mark - Crop

/**
 * 处理图片圆角
 *
 * @param cornerRadius 圆角弧度
 *
 * @return UIImage
 */
- (UIImage *)pb_cropImageWithCornerRadius:(CGFloat)cornerRadius {
    if (!self.size.height || !self.size.width) {
        return self;
    }
    UIGraphicsBeginImageContextWithOptions(self.size, NO, [UIScreen mainScreen].scale);
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    // Add a clip before drawing anything, in the shape of an rounded rect
    [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius] addClip];
    // Draw your image
    [self drawInRect:rect];
    UIGraphicsEndImageContext();
    // Get the image, here setting the UIImageView image
    return UIGraphicsGetImageFromCurrentImageContext();
}

/**
 * 处理图片圆角
 *
 * @param rectCornerType 圆角位置
 * @param cornerRadius 圆角弧度
 *
 * @return UIImage
 */
- (UIImage *)pb_cropImageWithCorner:(UIRectCorner)cornerType cornerRadius:(CGFloat)cornerRadius {
    CGFloat w = self.size.width;
    CGFloat h = self.size.height;
    CGFloat scale = [UIScreen mainScreen].scale;
    
    cornerRadius = MAX(0, MIN(MIN(w, h)/2, cornerRadius));
    
    UIImage *image = nil;
    CGRect rect = CGRectMake(0., 0., w, h);
    UIGraphicsBeginImageContextWithOptions(self.size, NO, scale);
    [[UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:cornerType cornerRadii:CGSizeMake(cornerRadius, cornerRadius)] addClip];
    [self drawInRect:rect];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
