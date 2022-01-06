//
//  RCMusicCollectListConfig.h
//  RCMusicControlKit
//
//  Created by xuefeng on 2021/12/30.
//

#import <Foundation/Foundation.h>
#import <RCCoreKit/RCCoreKit.h>

@class RCMusicCollectListConfigValue;
@class RCMusicCollectListConfigCategoryItem;
@class RCMusicCollectListConfigCategoryItemValue;

NS_ASSUME_NONNULL_BEGIN

@interface RCMusicCollectListConfig : NSObject
@property (nonatomic, strong, nullable) RCMusicCollectListConfigValue *value;
@end

@interface RCMusicCollectListConfigValue : NSObject
@property (nonatomic, strong, nullable) RCBoolean *refreshEnable;
@property (nonatomic, strong, nullable) RCBoolean *loadMoreEnable;
@property (nonatomic, strong, nullable) RCColor *backgroundColor;
@property (nonatomic, strong, nullable) RCMusicCollectListConfigCategoryItem *item;
@end

@interface RCMusicCollectListConfigCategoryItem : NSObject
@property (nonatomic, strong, nullable) RCMusicCollectListConfigCategoryItemValue *value;
@end

@interface RCMusicCollectListConfigCategoryItemValue : NSObject
@property (nonatomic, strong, nullable) RCColor *highlightColor;
@property (nonatomic, strong, nullable) RCSize *size;
@property (nonatomic, strong, nullable) RCInsets *contentInsets;
@property (nonatomic, strong, nullable) RCSize *coverSize;
@property (nonatomic, strong, nullable) RCAttributes *titleAttributes;
@property (nonatomic, strong, nullable) RCAttributes *contentAttributes;
@property (nonatomic, strong, nullable) RCAttributes *sizeAttributes;
@property (nonatomic, strong, nullable) RCAttributes *separatorAttributes;
@property (nonatomic, strong, nullable) RCAttributes *topIconAttributes;
@property (nonatomic, strong, nullable) RCAttributes *deleteIconAttributes;
@end

NS_ASSUME_NONNULL_END
