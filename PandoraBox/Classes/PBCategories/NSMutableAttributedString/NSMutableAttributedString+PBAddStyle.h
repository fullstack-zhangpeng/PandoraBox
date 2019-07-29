//
//  NSMutableAttributedString+PBAddStyle.h
//  PandoraBox
//
//  Created by 张鹏 on 2019/7/4.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, PBAttributedStringLineStyle) {
    PBAttributedStringLineStyleDelete,
    PBAttributedStringLineStyleUnder
};

@interface NSMutableAttributedString (PBAddStyle)

#pragma mark - AddAttributes

- (void)pb_addAttributes:(NSDictionary<NSAttributedStringKey,id> *)attrs range:(NSRange)range;

- (void)pb_addLineHeight:(CGFloat)lineHeight font:(UIFont *)font;

- (void)pb_addLineWithStyle:(PBAttributedStringLineStyle)lineStyle range:(NSRange)range;

@end

NS_ASSUME_NONNULL_END
