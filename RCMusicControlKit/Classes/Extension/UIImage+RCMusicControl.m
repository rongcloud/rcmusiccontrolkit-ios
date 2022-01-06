//
//  UIImage+RCMBundle.m
//  RCMusicControlKit
//
//  Created by xuefeng on 2021/11/18.
//

#import "UIImage+RCMusicControl.h"
#import "RCMusicControlKitConfig.h"

@implementation UIImage (RCMBundle)

+ (UIImage *)rcm_imageNamed:(NSString *)image {

    NSString *assets = RCMusicControlKitConfig.assetsPath;
    
    NSString *path = [assets stringByAppendingPathComponent:image];;
    
    return [[UIImage alloc] initWithContentsOfFile:path];
}

@end
