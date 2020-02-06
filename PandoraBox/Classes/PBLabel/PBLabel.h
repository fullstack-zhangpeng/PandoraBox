//
//  PBLabel.h
//  PandoraBox_Example
//
//  Created by zhangpeng on 2020/2/6.
//  Copyright © 2020 zhangpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PBLabel : UILabel
//padding, default is UIEdgeInsetsZero
@property (nonatomic, assign) UIEdgeInsets pb_pandding;

@property (nonatomic, assign) CGFloat pb_paddingTop;
@property (nonatomic, assign) CGFloat pb_paddingLeft;
@property (nonatomic, assign) CGFloat pb_paddingBottom;
@property (nonatomic, assign) CGFloat pb_paddingRight;
@end

NS_ASSUME_NONNULL_END
