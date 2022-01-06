//
//  RCMusicSoundEffectAppearance.h
//  RCE
//
//  Created by xuefeng on 2021/11/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCMusicSoundEffectAppearance : NSObject
//文本颜色 normal
@property (nonatomic, strong) UIColor *normalTextColor;
//文本颜色 selected
@property (nonatomic, strong) UIColor *selectedTextColor;
//边框颜色 normal
@property (nonatomic, strong) UIColor *normalBorderColor;
//边框颜色 selected
@property (nonatomic, strong) UIColor *selectedBorderColor;
//边框宽度 14
@property (nonatomic, assign) CGFloat borderWidth;
//字体  default system 14
@property (nonatomic, strong) UIFont *font;
//bg color
@property (nonatomic, strong) UIColor *backgroundColor;
//item 背景颜色 normal
@property (nonatomic, strong) UIColor *itemNormalBackgroundColor;
//item 背景颜色 selected
@property (nonatomic, strong) UIColor *itemSelectedBackgroundColor;
//item 大小
@property (nonatomic, assign) CGSize itemSize;
//容器大小
@property (nonatomic, assign) CGSize size;
//容器内 item 内边距
@property (nonatomic, assign) UIEdgeInsets insets;
//容器圆角 四角区分
@property (nonatomic, assign) UIEdgeInsets corner;
//item 间距
@property (nonatomic, assign) CGFloat itemSpace;
//容器圆角 整体
@property (nonatomic, assign) CGFloat radius;
@end

NS_ASSUME_NONNULL_END
