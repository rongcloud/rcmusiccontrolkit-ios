//
//  RCMusicCollectListAppearance.m
//  RCMusicControlKit
//
//  Created by xuefeng on 2022/1/4.
//

#import "RCMusicCollectListAppearance.h"
#import "RCMusicControlKitConfig.h"
#import "UIImage+RCMusicControl.h"

#define col RCMusicControlKitConfig.collect

@implementation RCMusicCollectListAppearance
- (instancetype)init {
    if (self = [super init]) {
        _height = col.value.item.value.size ? col.value.item.value.size.size.height : 64;
        _avatarSize = col.value.item.value.coverSize ? col.value.item.value.coverSize.size : CGSizeMake(44, 44);
        _contentInsets = col.value.item.value.contentInsets ? col.value.item.value.contentInsets.insets : UIEdgeInsetsZero;
        _separatorInset = col.value.item.value.separatorAttributes.value.insets ? col.value.item.value.separatorAttributes.value.insets.insets : UIEdgeInsetsMake(0, 74, 0, 0);
        _titleLabelTextColor = col.value.item.value.titleAttributes.value.textColor.color ?: [UIColor whiteColor];
        _titleLabelFont = col.value.item.value.titleAttributes.value.font.font ?: [UIFont boldSystemFontOfSize:15];
        _titleLabelEdgeInsets = col.value.item.value.titleAttributes.value.insets ? col.value.item.value.titleAttributes.value.insets.insets : UIEdgeInsetsZero;
        _subTitleLabelTextColor =  col.value.item.value.contentAttributes.value.textColor.color ?: [[UIColor whiteColor] colorWithAlphaComponent:0.7];
        _subTitleLabelFont = col.value.item.value.contentAttributes.value.font.font ?: [UIFont systemFontOfSize:12];
        _subTitleLabelEdgeInsets = col.value.item.value.contentAttributes.value.insets ? col.value.item.value.contentAttributes.value.insets.insets : UIEdgeInsetsZero;
        
        _fileSizeLabelTextColor =  col.value.item.value.sizeAttributes.value.textColor.color ?: [[UIColor whiteColor] colorWithAlphaComponent:0.7];
        _fileSizeLabelFont = col.value.item.value.sizeAttributes.value.font.font ?: [UIFont systemFontOfSize:12];
        _fileSizeLabelEdgeInsets = col.value.item.value.sizeAttributes.value.insets ? col.value.item.value.sizeAttributes.value.insets.insets : UIEdgeInsetsZero;
        _topIconPath = col.value.item.value.topIconAttributes.value.image ? col.value.item.value.topIconAttributes.value.image.value.local : @"rckit_ic_music_top";
        _topIconUrl = col.value.item.value.topIconAttributes.value.image.value.remote;
        _delIconPath = col.value.item.value.deleteIconAttributes.value.image ? col.value.item.value.deleteIconAttributes.value.image.value.local : @"rckit_ic_music_del";
        _delIconUrl = col.value.item.value.deleteIconAttributes.value.image.value.remote;
    }
    return self;
}
@end
