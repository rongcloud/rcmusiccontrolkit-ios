//
//  RCMusicControlKitConfig.h
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/30.
//

#import <Foundation/Foundation.h>
#import <RCCoreKit/RCCoreKit.h>
#import "RCMusicToolBarConfig.h"
#import "RCMusicThemeConfig.h"
#import "RCMusicCollectListConfig.h"
#import "RCMusicOnlineListConfig.h"
#import "RCMusicControlConfig.h"
#import "RCMusicSoundEffectConfig.h"

NS_ASSUME_NONNULL_BEGIN

@interface RCMusicControlKitConfig : NSObject<RCCoreModule>
@property (class, nonatomic, copy, nonnull) NSString *assetsPath;
@property (class, nonatomic, strong, readonly, nonnull) RCMusicToolBarConfig *toolBar;
@property (class, nonatomic, strong, readonly, nonnull) RCMusicThemeConfig *theme;
@property (class, nonatomic, strong, readonly, nonnull) RCMusicCollectListConfig *collect;
@property (class, nonatomic, strong, readonly, nonnull) RCMusicOnlineListConfig *online;
@property (class, nonatomic, strong, readonly, nonnull) RCMusicControlConfig *control;
@property (class, nonatomic, strong, readonly, nonnull) RCMusicSoundEffectConfig *soundEffect;
@end

NS_ASSUME_NONNULL_END
