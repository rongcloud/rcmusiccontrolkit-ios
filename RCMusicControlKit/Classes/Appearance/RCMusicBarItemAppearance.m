//
//  RCMusicBarItemAppearance.m
//  RCMusicControlKit
//
//  Created by xuefeng on 2021/11/18.
//

#import "RCMusicBarItemAppearance.h"
#import "RCMusicControlKitConfig.h"

#define bia RCMusicControlKitConfig.toolBar

@implementation RCMusicBarItemAppearance

- (instancetype)init {
    if (self = [super init]) {
        _size = bia.value.tabSize ? bia.value.tabSize.size : CGSizeMake(36, 36);
        _contentInset = bia.value.contentInsets ? bia.value.contentInsets.insets : UIEdgeInsetsZero;
        _backgroundColor = bia.value.backgroundColor ? bia.value.backgroundColor.color : [UIColor clearColor];
    }
    return self;
}

@end
