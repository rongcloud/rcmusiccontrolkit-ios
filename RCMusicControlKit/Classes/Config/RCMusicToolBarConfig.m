//
//  RCMusicToolBarConfig.m
//  RCMusicControlKit
//
//  Created by xuefeng on 2021/12/30.
//

#import "RCMusicToolBarConfig.h"

@implementation RCMusicToolBarConfig

@end

@implementation RCMusicToolBarConfigValue

@end

@implementation RCMusicToolBarTabItems
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"value" : [RCImageSelector class]};
}

- (NSArray<NSDictionary<NSString *,NSString *> *> *)imageDictArray {
    
    NSMutableArray *result = [@[] mutableCopy];
    
    for (RCImageSelector *value in self.value) {
        NSDictionary *dict = [value dictValue];
        if (dict.allKeys.count > 0) {
            [result addObject:dict];
        }
    }
    
    return [result copy];
}
@end
