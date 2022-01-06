//
//  RCMusicOnlineListAppearance.h
//  RCMusicControlKit
//
//  Created by xuefeng on 2021/11/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCMusicOnlineListAppearance : NSObject
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
//是否展示本地上传入口
@property (nonatomic, assign) BOOL turnOnLocalUpload;

@property (nonatomic, copy) NSString *downloadedPath;
@property (nonatomic, copy) NSString *downloadedUrl;
@property (nonatomic, copy) NSString *notDownloadedPath;
@property (nonatomic, copy) NSString *notDownloadedUrl;
@end

NS_ASSUME_NONNULL_END
