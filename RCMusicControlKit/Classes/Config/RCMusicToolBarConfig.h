//
//  RCMusicToolBarConfig.h
//  RCMusicControlKit
//
//  Created by xuefeng on 2021/12/30.
//

#import <Foundation/Foundation.h>
#import <RCCoreKit/RCCoreKit.h>

@class RCMusicToolBarConfigValue;
@class RCMusicToolBarTabItems;

NS_ASSUME_NONNULL_BEGIN

@interface RCMusicToolBarConfig : NSObject
@property (nonatomic, strong, nullable) RCMusicToolBarConfigValue *value;
@end

@interface RCMusicToolBarConfigValue : NSObject
@property (nonatomic, strong, nullable) RCColor *backgroundColor;
@property (nonatomic, strong, nullable) RCSize *size;
@property (nonatomic, strong, nullable) RCInsets *contentInsets;
@property (nonatomic, strong, nullable) RCNumber *spacing;
@property (nonatomic, strong, nullable) RCBoolean *musicControlEnable;
@property (nonatomic, strong, nullable) RCBoolean *soundEffectEnable;
@property (nonatomic, strong, nullable) RCMusicToolBarTabItems *tabItems;
@property (nonatomic, strong, nullable) RCSize *tabSize;
@end

@interface RCMusicToolBarTabItems : NSObject
@property (nonatomic, copy, nullable) NSArray<RCImageSelector *> *value;
@property (nonatomic, copy, nullable) NSArray<NSDictionary<NSString*,NSString*> *> *imageDictArray;
@end
NS_ASSUME_NONNULL_END
