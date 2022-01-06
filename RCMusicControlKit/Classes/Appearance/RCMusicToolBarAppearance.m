//
//  RCMusicToolBarAppearance.m
//  RCMusicControlKit
//
//  Created by xuefeng on 2021/11/18.
//

#import "RCMusicToolBarAppearance.h"
#import "RCMusicControlKitConfig.h"

#define tba RCMusicControlKitConfig.toolBar

@implementation RCMusicToolBarAppearance

- (instancetype)init {
    if (self = [super init]) {
        _leading = tba.value.contentInsets.value ? tba.value.contentInsets.value.left.doubleValue : 14;
        _trailing = tba.value.contentInsets.value ? - tba.value.contentInsets.value.right.doubleValue : -14;
        _spacing = tba.value.spacing ? tba.value.spacing.value.doubleValue : 10;
        _turnOnSoundEffect = tba.value.soundEffectEnable ? tba.value.soundEffectEnable.value.boolValue : YES;
        _turnOnMusicControl = tba.value.musicControlEnable ? tba.value.musicControlEnable.value.boolValue : YES;
        _size = tba.value.tabSize ? tba.value.size.size : CGSizeMake(36, 36);
        _backgroundColor = tba.value.backgroundColor ? tba.value.backgroundColor.color : [UIColor clearColor];
        _items = tba.value.tabItems.imageDictArray;
        NSLog(@"xxx");
    }
    return self;
}
@end
