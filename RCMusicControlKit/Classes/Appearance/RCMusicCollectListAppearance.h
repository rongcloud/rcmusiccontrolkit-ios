//
//  RCMusicCollectListAppearance.h
//  RCMusicControlKit
//
//  Created by xuefeng on 2022/1/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCMusicCollectListAppearance : NSObject
@property (nonatomic, assign) CGFloat height;
//列表头像size default (44,44)
@property (nonatomic, assign) CGSize avatarSize;
//列表头像缩进  default spacing 10
@property (nonatomic, assign) UIEdgeInsets contentInsets;
//列表分割线缩进  default spacing 74
@property (nonatomic, assign) UIEdgeInsets separatorInset;
//default white
@property (nonatomic, strong) UIColor *titleLabelTextColor;
//default system 16
@property (nonatomic, strong) UIFont *titleLabelFont;
//default left
@property (nonatomic, assign) NSTextAlignment titleLabelTextAlignment;
//default UIEdgeInsetsZero
@property (nonatomic, assign) UIEdgeInsets titleLabelEdgeInsets;

//default white
@property (nonatomic, strong) UIColor *subTitleLabelTextColor;
//default system 14
@property (nonatomic, strong) UIFont *subTitleLabelFont;
//default left
@property (nonatomic, assign) NSTextAlignment subTitleLabelTextAlignment;
//default UIEdgeInsetsZero
@property (nonatomic, assign) UIEdgeInsets subTitleLabelEdgeInsets;

//default white
@property (nonatomic, strong) UIColor *fileSizeLabelTextColor;
//default system 12
@property (nonatomic, strong) UIFont *fileSizeLabelFont;
//default left
@property (nonatomic, assign) NSTextAlignment fileSizeLabelTextAlignment;
//default UIEdgeInsetsZero
@property (nonatomic, assign) UIEdgeInsets fileSizeLabelEdgeInsets;
//置顶icon
@property (nonatomic, strong) NSString *topIconPath;
@property (nonatomic, strong) NSString *topIconUrl;
//删除icon
@property (nonatomic, strong) NSString *delIconPath;
@property (nonatomic, strong) NSString *delIconUrl;
@end

NS_ASSUME_NONNULL_END
