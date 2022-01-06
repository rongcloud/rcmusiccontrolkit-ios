//
//  RCMusicSoundEffectConfig.h
//  RCMusicControlKit
//
//  Created by xuefeng on 2021/12/30.
//

#import <Foundation/Foundation.h>
#import <RCCoreKit/RCCoreKit.h>

@class RCMusicSoundEffectConfigValue;

NS_ASSUME_NONNULL_BEGIN

@interface RCMusicSoundEffectConfig : NSObject
@property (nonatomic, strong, nullable) RCMusicSoundEffectConfigValue *value;
@end

@interface RCMusicSoundEffectConfigValue : NSObject
@property (nonatomic, strong, nullable) RCSize *size;
@property (nonatomic, strong, nullable) RCInsets *contentInsets;
@property (nonatomic, strong, nullable) RCCorner *corner;
@property (nonatomic, strong, nullable) RCColor *backgroundColor;
@property (nonatomic, strong, nullable) RCNumber *itemSpace;
@property (nonatomic, strong, nullable) RCAttributes *effectAttributes;
@end

NS_ASSUME_NONNULL_END
