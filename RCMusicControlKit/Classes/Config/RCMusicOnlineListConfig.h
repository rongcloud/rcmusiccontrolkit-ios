//
//  RCMusicOnlineListConfig.h
//  RCMusicControlKit
//
//  Created by xuefeng on 2021/12/30.
//

#import <Foundation/Foundation.h>
#import <RCCoreKit/RCCoreKit.h>

@class RCMusicOnlineListConfigValue;
@class RCMusicOnlineListSearchBarConfig;
@class RCMusicOnlineListSearchBarConfigValue;
@class RCMusicOnlineListCategoryConfig;
@class RCMusicOnlineListCategoryConfigValue;
@class RCMusicOnlineListItemConfig;
@class RCMusicOnlineListItemConfigValue;

NS_ASSUME_NONNULL_BEGIN

@interface RCMusicOnlineListConfig : NSObject
@property (nonatomic, strong, nullable) RCMusicOnlineListConfigValue *value;
@end

@interface RCMusicOnlineListConfigValue : NSObject
@property (nonatomic, strong, nullable) RCBoolean *refreshEnable;
@property (nonatomic, strong, nullable) RCBoolean *loadMoreEnable;
@property (nonatomic, strong, nullable) RCBoolean *uploadMusicEnable;
@property (nonatomic, strong, nullable) RCColor *backgroundColor;
@property (nonatomic, strong, nullable) RCMusicOnlineListSearchBarConfig *search;
@property (nonatomic, strong, nullable) RCMusicOnlineListCategoryConfig *category;
@property (nonatomic, strong, nullable) RCMusicOnlineListItemConfig *item;
@end

@interface RCMusicOnlineListSearchBarConfig : NSObject
@property (nonatomic, strong, nullable) RCMusicOnlineListSearchBarConfigValue *value;
@end

@interface RCMusicOnlineListSearchBarConfigValue : NSObject
@property (nonatomic, strong, nullable) RCInsets *contentInsets;
@property (nonatomic, strong, nullable) RCSize *searchSize;
@property (nonatomic, strong, nullable) RCAttributes *textAttributes;
@end

@interface RCMusicOnlineListCategoryConfig : NSObject
@property (nonatomic, strong, nullable) RCMusicOnlineListCategoryConfigValue *value;
@end

@interface RCMusicOnlineListCategoryConfigValue : NSObject
@property (nonatomic, strong, nullable) RCSize *size;
@property (nonatomic, strong, nullable) RCColor *backgroundColor;
@property (nonatomic, strong, nullable) RCBoolean *showIndicator;
@property (nonatomic, strong, nullable) RCSize *indicatorSize;
@property (nonatomic, strong, nullable) RCColor *indicatorColor;
@property (nonatomic, strong, nullable) RCAttributes *labelAttributes;
@end

@interface RCMusicOnlineListItemConfig : NSObject
@property (nonatomic, strong, nullable) RCMusicOnlineListItemConfigValue *value;
@end

@interface RCMusicOnlineListItemConfigValue : NSObject
@property (nonatomic, strong, nullable) RCColor *highlightColor;
@property (nonatomic, strong, nullable) RCSize *size;
@property (nonatomic, strong, nullable) RCInsets *contentInsets;
@property (nonatomic, strong, nullable) RCSize *coverSize;
@property (nonatomic, strong, nullable) RCAttributes *titleAttributes;
@property (nonatomic, strong, nullable) RCAttributes *contentAttributes;
@property (nonatomic, strong, nullable) RCAttributes *sizeAttributes;
@property (nonatomic, strong, nullable) RCAttributes *separatorAttributes;
@property (nonatomic, strong, nullable) RCAttributes *addIconAttributes;
@end

NS_ASSUME_NONNULL_END
