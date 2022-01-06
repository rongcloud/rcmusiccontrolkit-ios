//
//  RCMusicControlConfig.h
//  RCMusicControlKit
//
//  Created by xuefeng on 2021/12/30.
//

#import <Foundation/Foundation.h>
#import <RCCoreKit/RCCoreKit.h>

@class RCMusicControlConfigValue;

NS_ASSUME_NONNULL_BEGIN

@interface RCMusicControlConfig : NSObject
@property (nonatomic, strong, nullable) RCMusicControlConfigValue *value;
@end

@interface RCMusicControlConfigValue : NSObject
@property (nonatomic, strong, nullable) RCColor *backgroundColor;
@property (nonatomic, strong, nullable) RCColor *normalColor;
@property (nonatomic, strong, nullable) RCColor *tintColor;
@property (nonatomic, strong, nullable) RCColor *thumbColor;
@property (nonatomic, strong, nullable) RCColor *textColor;
@property (nonatomic, strong, nullable) RCFont *font;

@end
NS_ASSUME_NONNULL_END
