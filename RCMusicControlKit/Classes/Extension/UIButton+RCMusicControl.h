//
//  UIButton+RCMusicControl.h
//  RCMusicControlKit
//
//  Created by xuefeng on 2022/1/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (RCConfig)
- (void)rcm_setImage:(NSString *)path url:(NSString *)url forState:(UIControlState)state;
@end

NS_ASSUME_NONNULL_END
