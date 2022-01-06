//
//  RCMusicControlKit.h
//  RCMusicControlKit
//
//  Created by xuefeng on 2022/1/4.
//

#import <Foundation/Foundation.h>

//! Project version number for RCCoreKit.
FOUNDATION_EXPORT double RCRCMusicControlKitVersionNumber;

//! Project version string for RCCoreKit.
FOUNDATION_EXPORT const unsigned char RCRCMusicControlKitVersionString[];

# if __has_include(<RCMusicControlKit/RCMusicControlKit.h>)
#import <RCMusicControlKit/RCMusicControlKit.h>
#import <RCMusicControlKit/RCMusicCategoryInfo.h>
#import <RCMusicControlKit/RCMusicEffectInfo.h>
#import <RCMusicControlKit/RCMusicEngine.h>
#import <RCMusicControlKit/RCMusicEngineDataSource.h>
#import <RCMusicControlKit/RCMusicEngineDelegate.h>
#import <RCMusicControlKit/RCMusicInfo.h>
#import <RCMusicControlKit/RCMusicPlayer.h>
#else
#import "RCMusicControlKit.h"
#import "RCMusicCategoryInfo.h"
#import "RCMusicEffectInfo.h"
#import "RCMusicEngine.h"
#import "RCMusicEngineDataSource.h"
#import "RCMusicEngineDelegate.h“
#import "RCMusicInfo.h"
#import "RCMusicPlayer.h"
#endif
