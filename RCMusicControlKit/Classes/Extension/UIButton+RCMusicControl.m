//
//  UIButton+RCMusicControl.m
//  RCMusicControlKit
//
//  Created by xuefeng on 2022/1/4.
//

#import "UIButton+RCMusicControl.h"
#import "UIButton+WebCache.h"
#import "UIImage+RCMusicControl.h"
#import "RCImage.h"

@implementation UIButton (RCConfig)
- (void)rcm_setImage:(NSString *)path url:(NSString *)url forState:(UIControlState)state {
    if (url && url.length > 0) {
        [self sd_setImageWithURL:[NSURL URLWithString:url] forState:state];
    } else {
        [self setImage:[UIImage rcm_imageNamed:path] forState:state];
    }
}
@end
