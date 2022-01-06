//
//  RCMusicCategorySelectorAppearance.m
//  RCMusicControlKit
//
//  Created by xuefeng on 2021/11/19.
//

#import "RCMusicCategorySelectorAppearance.h"
#import "UIColor+RCMusicControl.h"
#import "RCMusicControlKitConfig.h"

#define cta RCMusicControlKitConfig.online.value.category

@implementation RCMusicCategorySelectorAppearance
- (instancetype)init {
    if (self = [super init]) {
        
        self.normalTextColor = cta.value.labelAttributes.value.colorSelector.value.normal.color ?: [UIColor whiteColor];
        self.selectedTextColor = cta.value.labelAttributes.value.colorSelector.value.select.color ?: [UIColor rcm_colorFromHexString:@"#EF499A"];
        self.normalFont = cta.value.labelAttributes.value.fontSelector.value.normal.font ?: [UIFont systemFontOfSize:16];
        self.selectedFont = cta.value.labelAttributes.value.fontSelector.value.selected.font ?: [UIFont boldSystemFontOfSize:16];
        self.indicatorSize = cta.value.indicatorSize ? cta.value.indicatorSize.size : CGSizeMake(20, 2);
        self.showIndicator = cta.value.showIndicator.value.boolValue;
    }
    return self;
}

@end
