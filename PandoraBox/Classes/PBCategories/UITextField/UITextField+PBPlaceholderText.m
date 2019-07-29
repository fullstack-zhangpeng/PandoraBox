//
//  UITextField+PBPlaceholderText.m
//  PandoraBox
//
//  Created by 张鹏 on 2019/7/4.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import "UITextField+PBPlaceholderText.h"

@implementation UITextField (PBPlaceholderText)

- (void)pb_setPlaceholderText:(NSString *)placeholderText color:(UIColor *)color font:(UIFont *)font {
    if (!placeholderText || placeholderText.length <= 0) {
        return;
    }
    NSMutableAttributedString *placeholderAttstr = [[NSMutableAttributedString alloc] initWithString:placeholderText];
    if (color) {
        [placeholderAttstr addAttribute:NSForegroundColorAttributeName
                                  value:color
                                  range:NSMakeRange(0, placeholderAttstr.length)];
    }
    if (font) {
        [placeholderAttstr addAttribute:NSFontAttributeName
                                  value:font
                                  range:NSMakeRange(0, placeholderAttstr.length)];
    }
    self.attributedPlaceholder = placeholderAttstr;
}

@end
