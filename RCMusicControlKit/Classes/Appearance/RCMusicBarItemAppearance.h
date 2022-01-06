//
//  RCMusicBarItemAppearance.h
//  RCMusicControlKit
//
//  Created by xuefeng on 2021/11/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCMusicBarItemAppearance : NSObject
//item size default [36,36]
@property (nonatomic, assign) CGSize size;
//default [0,0,0,0]
@property (nonatomic, assign) UIEdgeInsets contentInset;
//bg color
@property (nonatomic, strong) UIColor *backgroundColor;
@end

NS_ASSUME_NONNULL_END
