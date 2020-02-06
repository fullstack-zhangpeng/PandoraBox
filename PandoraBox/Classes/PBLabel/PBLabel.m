//
//  PBLabel.m
//  PandoraBox_Example
//
//  Created by zhangpeng on 2020/2/6.
//  Copyright © 2020 zhangpeng. All rights reserved.
//

#import "PBLabel.h"

@interface PBLabel ()

@end

@implementation PBLabel

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (CGSize)intrinsicContentSize {
    CGSize superContentSize = [super intrinsicContentSize];
    CGFloat width = superContentSize.width + self.pb_paddingLeft + self.pb_paddingRight;
    CGFloat height = superContentSize.height + self.pb_paddingTop + self.pb_paddingBottom;
    return CGSizeMake(width, height);
}

- (void)drawTextInRect:(CGRect)rect {
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.pb_pandding)];
}

//MARK: - Getter & Setter

- (void)setPb_pandding:(UIEdgeInsets)pb_pandding {
    self.pb_paddingTop = pb_pandding.top;
    self.pb_paddingLeft = pb_pandding.left;
    self.pb_paddingBottom = pb_pandding.bottom;
    self.pb_paddingRight = pb_pandding.right;
}

- (UIEdgeInsets)pb_pandding {
    return UIEdgeInsetsMake(self.pb_paddingTop, self.pb_paddingLeft, self.pb_paddingBottom, self.pb_paddingRight);
}

@end
