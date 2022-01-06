//
//  RCMusicThemeAppearance.m
//  RCMusicControlKit
//
//  Created by xuefeng on 2022/1/5.
//

#import "RCMusicThemeAppearance.h"
#import "RCMusicControlKitConfig.h"

#define theme RCMusicControlKitConfig.theme

@implementation RCMusicThemeAppearance
- (instancetype)init {
    if (self = [super init]) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        _size = theme.value.size ? theme.value.size.size : CGSizeMake(width, 400);
        _backgroundColor = theme.value.background ? theme.value.background.color : [UIColor colorWithRed:92/255.0 green:80/255.0 blue:149/255.0 alpha:1];
    }
    return self;
}
@end
