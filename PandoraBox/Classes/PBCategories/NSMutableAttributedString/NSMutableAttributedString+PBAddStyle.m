//
//  NSMutableAttributedString+PBAddStyle.m
//  PandoraBox
//
//  Created by 张鹏 on 2019/7/4.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import "NSMutableAttributedString+PBAddStyle.h"

@implementation NSMutableAttributedString (PBAddStyle)

#pragma mark - Base

- (BOOL)pb_isNilOrNullObject:(id)object {
    if (object == nil || [object isEqual: [NSNull null]]) {
        NSLog(@"function : %s has invalid argument : object can't be nil" , __FUNCTION__);
        return YES;
    }
    return NO;
}

- (BOOL)pb_isCorrectRange:(NSRange)range forMutableAttributedString:(NSMutableAttributedString *)mutableAttributedString {
    if (range.location + range.length <= mutableAttributedString.string.length) {
        return YES;
    }
    return NO;
}

#pragma mark - AddAttributes

- (void)pb_addAttributes:(NSDictionary<NSAttributedStringKey,id> *)attrs range:(NSRange)range {
    if ([self pb_isNilOrNullObject:attrs]) {
        return;
    }
    if ([self pb_isCorrectRange:range forMutableAttributedString:self]) {
        [self addAttributes:attrs range:range];
    }
}

- (void)pb_addLineHeight:(CGFloat)lineHeight font:(UIFont *)font {
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.maximumLineHeight = lineHeight;
    paragraphStyle.minimumLineHeight = lineHeight;
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSParagraphStyleAttributeName] = paragraphStyle;
    CGFloat baselineOffset = (lineHeight - font.lineHeight) / 4;
    attributes[NSBaselineOffsetAttributeName] = @(baselineOffset);
    [self pb_addAttributes:attributes range:NSMakeRange(0, self.length)];
}

- (void)pb_addLineWithStyle:(PBAttributedStringLineStyle)lineStyle range:(NSRange)range {
    switch (lineStyle) {
        case PBAttributedStringLineStyleDelete: {
            [self pb_addAttributes:@{NSStrikethroughStyleAttributeName : @(NSUnderlineStyleNone)}
                             range: NSMakeRange(0, self.string.length)];
            [self pb_addAttributes:@{NSStrikethroughStyleAttributeName : @(NSUnderlineStyleSingle),
                                     NSBaselineOffsetAttributeName : @0}
                             range:range];
            break;
        }
        case PBAttributedStringLineStyleUnder: {
            [self pb_addAttributes:@{NSUnderlineStyleAttributeName : @(NSUnderlineStyleNone)}
                             range: NSMakeRange(0, self.string.length)];
            [self pb_addAttributes:@{NSUnderlineStyleAttributeName : @(NSUnderlineStyleSingle)}
                             range:range];
            break;
        }
        default:
            break;
    }
}

@end
