//
//  RCMusicControlAppearance.m
//  RCMusicControlKit
//
//  Created by xuefeng on 2021/11/23.
//

#import "RCMusicControlAppearance.h"
#import "RCMUsicColors.h"
#import "RCMusicControlKitConfig.h"

#define mca RCMusicControlKitConfig.control

@implementation RCMusicControlAppearance

- (instancetype)init {
    if (self = [super init]) {
        _tintColor = mca.value.tintColor.color ?: mainColor;
        _textColor = mca.value.textColor.color ?: [UIColor whiteColor];
        _font = mca.value.font.font ?: [UIFont systemFontOfSize:14];
        NSLog(@"music control config load finish");
    }
    return self;
 }
@end
