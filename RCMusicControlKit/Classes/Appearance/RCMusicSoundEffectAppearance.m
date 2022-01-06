//
//  RCMusicSoundEffectAppearance.m
//  RCE
//
//  Created by xuefeng on 2021/11/26.
//

#import "RCMusicSoundEffectAppearance.h"
#import "RCMusicControlKitConfig.h"

#define sea RCMusicControlKitConfig.soundEffect

@implementation RCMusicSoundEffectAppearance
- (instancetype)init {
    if (self = [super init]) {
        
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        
        _backgroundColor = sea.value.backgroundColor.color ?: [[UIColor whiteColor] colorWithAlphaComponent:0.16];
        _normalTextColor = sea.value.effectAttributes.value.colorSelector.value.normal.color ?: [UIColor colorWithRed:239/255.0 green:73/255.0 blue:154/255.0 alpha:0.7];
        _selectedTextColor = sea.value.effectAttributes.value.colorSelector.value.select.color ?: [UIColor colorWithRed:239/255.0 green:73/255.0 blue:154/255.0 alpha:1];
        
        _itemNormalBackgroundColor = sea.value.effectAttributes.value.drawableSelector.value.normal.color.color ?: [UIColor clearColor];
        _itemSelectedBackgroundColor = sea.value.effectAttributes.value.drawableSelector.value.select.color.color ?: [[UIColor whiteColor] colorWithAlphaComponent:0.2];
        
        _normalBorderColor = sea.value.effectAttributes.value.drawableSelector.value.normal.strokeColor.color ?: [[UIColor whiteColor] colorWithAlphaComponent:0.2];
        _selectedBorderColor = sea.value.effectAttributes.value.drawableSelector.value.select.strokeColor.color ?: [[UIColor whiteColor] colorWithAlphaComponent:0.2];
        _borderWidth = sea.value.effectAttributes.value.drawableSelector.value.normal.strokeWidth.doubleValue;
        _font = sea.value.effectAttributes.value.font.font ?: [UIFont systemFontOfSize:14];
  
        _itemSize = sea.value.effectAttributes.value.size ? sea.value.effectAttributes.value.size.size : CGSizeMake(64, 38);
        _size = sea.value.size ? sea.value.size.size : CGSizeMake(width, 54);
        _insets = sea.value.contentInsets ? sea.value.contentInsets.insets : UIEdgeInsetsMake(0, 18, 0, 18);
        _corner = sea.value.effectAttributes.value.corner ? sea.value.effectAttributes.value.corner.corner : UIEdgeInsetsMake(6, 6, 6, 6);
        _radius = sea.value.effectAttributes.value.corner.radius;
        _itemSpace = sea.value.itemSpace.value.doubleValue;
        
    }
    return self;
}
@end
