//
//  RCMusicToolBarAppearance.h
//  RCMusicControlKit
//
//  Created by xuefeng on 2021/11/18.
//

#import <UIKit/UIKit.h>

static NSString * _Nonnull const kNormalLocalKey    = @"normal_local";
static NSString * _Nonnull const kNormalRemoteKey   = @"normal_remote";
static NSString * _Nonnull const kSelectedLocalKey  = @"selected_local";
static NSString * _Nonnull const kSelectedRemoteKey = @"selected_remote";

NS_ASSUME_NONNULL_BEGIN

@interface RCMusicToolBarAppearance : NSObject

@property(nonatomic, strong) UIColor *backgroundColor;

//左边第一个item leading default 14
@property (nonatomic, assign) CGFloat leading;
//右边最后一个item trailing default -14
@property (nonatomic, assign) CGFloat trailing;
//item间隔 default 10
@property (nonatomic, assign) CGFloat spacing;
//item数据
@property (nonatomic, nullable, copy) NSArray<NSDictionary<NSString*,NSString*> *> *items;

//开启音乐控制功能
@property (nonatomic, assign) BOOL turnOnMusicControl;

//开启声音特效功能
@property (nonatomic, assign) BOOL turnOnSoundEffect;

//tool bar 大小
@property (nonatomic, assign) CGSize size;

@end

NS_ASSUME_NONNULL_END
