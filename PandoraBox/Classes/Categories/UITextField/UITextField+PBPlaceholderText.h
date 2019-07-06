//
//  UITextField+PBPlaceholderText.h
//  PandoraBox
//
//  Created by 张鹏 on 2019/7/4.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (PBPlaceholderText)

- (void)pb_setPlaceholderText:(NSString *)placeholderText color:(UIColor *)color font:(UIFont *)font;

@end

NS_ASSUME_NONNULL_END
