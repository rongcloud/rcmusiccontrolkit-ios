//
//  RCMusicListAppearance.m
//  RCMusicControlKit
//
//  Created by xuefeng on 2021/11/17.
//

#import "RCMusicOnlineListAppearance.h"

#import "RCMusicControlKitConfig.h"

#define mla RCMusicControlKitConfig.online

@implementation RCMusicOnlineListAppearance

- (instancetype)init {
    if (self = [super init]) {
        _height = mla.value.item.value.size ? mla.value.item.value.size.size.height : 64;
        _avatarSize = mla.value.item.value.coverSize ? mla.value.item.value.coverSize.size : CGSizeMake(44, 44);
        _contentInsets = mla.value.item.value.contentInsets ? mla.value.item.value.contentInsets.insets : UIEdgeInsetsZero;
        _separatorInset = mla.value.item.value.separatorAttributes.value.insets ? mla.value.item.value.separatorAttributes.value.insets.insets : UIEdgeInsetsMake(0, 74, 0, 0);
        _titleLabelTextColor = mla.value.item.value.titleAttributes.value.textColor.color ?: [UIColor whiteColor];
        _titleLabelFont = mla.value.item.value.titleAttributes.value.font.font ?: [UIFont boldSystemFontOfSize:15];
        _titleLabelEdgeInsets = mla.value.item.value.titleAttributes.value.insets ? mla.value.item.value.titleAttributes.value.insets.insets : UIEdgeInsetsZero;
        _subTitleLabelTextColor =  mla.value.item.value.contentAttributes.value.textColor.color ?: [[UIColor whiteColor] colorWithAlphaComponent:0.7];
        _subTitleLabelFont = mla.value.item.value.contentAttributes.value.font.font ?: [UIFont systemFontOfSize:12];
        _subTitleLabelEdgeInsets = mla.value.item.value.contentAttributes.value.insets ? mla.value.item.value.contentAttributes.value.insets.insets : UIEdgeInsetsZero;
        
        _fileSizeLabelTextColor =  mla.value.item.value.sizeAttributes.value.textColor.color ?: [[UIColor whiteColor] colorWithAlphaComponent:0.7];
        _fileSizeLabelFont = mla.value.item.value.sizeAttributes.value.font.font ?: [UIFont systemFontOfSize:12];
        _fileSizeLabelEdgeInsets = mla.value.item.value.sizeAttributes.value.insets ? mla.value.item.value.sizeAttributes.value.insets.insets : UIEdgeInsetsZero;
        _turnOnLocalUpload = mla.value.uploadMusicEnable ? mla.value.uploadMusicEnable.value.boolValue : YES;
        
        _downloadedPath = mla.value.item.value.addIconAttributes.value.imageSelector.value.select.local;
        if (!_downloadedPath || _downloadedPath.length == 0) {
            _downloadedPath = @"rckit_ic_music_add";
        }
        _downloadedUrl = mla.value.item.value.addIconAttributes.value.imageSelector.value.select.remote;
        
        _notDownloadedPath = mla.value.item.value.addIconAttributes.value.imageSelector.value.normal.local;
        if (!_notDownloadedPath || _notDownloadedPath.length == 0) {
            _notDownloadedPath = @"rckit_ic_music_added";
        }
        _notDownloadedUrl = mla.value.item.value.addIconAttributes.value.imageSelector.value.normal.remote;
    }
    return self;
}
@end
