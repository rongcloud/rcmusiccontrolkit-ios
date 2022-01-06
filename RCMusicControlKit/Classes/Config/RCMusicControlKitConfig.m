//
//  RCMusicControlKitConfig.m
//  RCCoreKit
//
//  Created by xuefeng on 2021/12/30.
//

#import "RCMusicControlKitConfig.h"

static NSString *const kConfigToolBarKey               = @"toolBar";

static NSString *const kConfigThemeKey                 = @"contentAttributes";

static NSString *const kConfigCollectKey               = @"musicList";

static NSString *const kConfigOnlineKey                = @"musicAdd";

static NSString *const kConfigControlKey               = @"musicControl";

static NSString *const kConfigsSoundEffectKey          = @"soundEffect";

@interface RCMusicControlKitConfig ()
@property (class, nonatomic, strong, readwrite, nonnull) RCMusicToolBarConfig *toolBar;
@property (class, nonatomic, strong, readwrite, nonnull) RCMusicThemeConfig *theme;
@property (class, nonatomic, strong, readwrite, nonnull) RCMusicCollectListConfig *collect;
@property (class, nonatomic, strong, readwrite, nonnull) RCMusicOnlineListConfig *online;
@property (class, nonatomic, strong, readwrite, nonnull) RCMusicControlConfig *control;
@property (class, nonatomic, strong, readwrite, nonnull) RCMusicSoundEffectConfig *soundEffect;
@end

@implementation RCMusicControlKitConfig

static NSString *kAssetsPath;

+ (NSString *)assetsPath {
    if (kAssetsPath == nil) {
        kAssetsPath = [self defaultAssetsPath];
    }
    return kAssetsPath;
}

+ (void)setAssetsPath:(NSString *)assetsPath {
    //kAssetsPath = assetsPath;
}

+ (void)loadData:(NSDictionary *)data {
    if (data) {
        [self loadConfig:data];
    } else {
        NSLog(@"RCMusicControlKitConfig 数据异常 %@", NSStringFromSelector(_cmd));
    }
}

+ (void)loadDefaultConfig {
    NSDictionary *defaultData = [self defaultData];
    if (defaultData) {
        [self loadConfig:defaultData];
    }
}

+ (void)loadConfig:(nonnull NSDictionary *)data {
    [self loadConfigWithKey:kConfigToolBarKey data:data];
    [self loadConfigWithKey:kConfigThemeKey data:data];
    [self loadConfigWithKey:kConfigCollectKey data:data];
    [self loadConfigWithKey:kConfigOnlineKey data:data];
    [self loadConfigWithKey:kConfigControlKey data:data];
    [self loadConfigWithKey:kConfigsSoundEffectKey data:data];
}

+ (void)loadConfigWithKey:(NSString *)key data:(NSDictionary *)data {
    if (key == kConfigToolBarKey) {
        if (data[kConfigToolBarKey] != nil) {
            kToolBar = [RCMusicToolBarConfig yy_modelWithDictionary:data[kConfigToolBarKey]];
        } else {
            NSLog(@"RCMusicToolBarConfig 加载失败");
        }
    } else if (key == kConfigThemeKey) {
        if (data[kConfigThemeKey] != nil) {
            NSLog(@"theme dict %@",data[kConfigThemeKey]);
            kTheme = [RCMusicThemeConfig yy_modelWithDictionary:data[kConfigThemeKey]];
        } else {
            NSLog(@"RCMusicThemeConfig 加载失败");
        }
    } else if (key == kConfigCollectKey) {
        if (data[kConfigCollectKey] != nil) {
            kCollect = [RCMusicCollectListConfig yy_modelWithDictionary:data[kConfigCollectKey]];
        } else {
            NSLog(@"RCMusicCollectListConfig 加载失败");
        }
    } else if (key == kConfigOnlineKey) {
        if (data[kConfigOnlineKey] != nil) {
            kOnline = [RCMusicOnlineListConfig yy_modelWithDictionary:data[kConfigOnlineKey]];
        } else {
            NSLog(@"RCMusicOnlineListConfig 加载失败");
        }
    } else if (key == kConfigControlKey) {
        if (data[kConfigControlKey] != nil) {
            kControl = [RCMusicControlConfig yy_modelWithDictionary:data[kConfigControlKey]];
        } else {
            NSLog(@"RCMusicControlConfig 加载失败");
        }
    } else if (key == kConfigsSoundEffectKey) {
        if (data[kConfigsSoundEffectKey] != nil) {
            kSoundEffect = [RCMusicSoundEffectConfig yy_modelWithDictionary:data[kConfigsSoundEffectKey]];
        } else {
            NSLog(@"RCMusicSoundEffectConfig 加载失败");
        }
    }
}

+ (void)checkNil:(NSString *)key object:(id)object {
    if (object == nil) {
        [self loadConfigWithKey:key data:[self defaultData]];
    }
}

+ (NSString *)defaultAssetsPath {
    
    NSBundle *bundle = [NSBundle bundleForClass:NSClassFromString(@"RCMusicEngine")];
    
    NSString *resourcePath = [bundle resourcePath];
    
    NSString *kitBundle = [resourcePath stringByAppendingPathComponent:@"RCMusicControlKit.bundle"];
    
    NSString *assets = [kitBundle stringByAppendingPathComponent:@"Assets"];
    
    return assets;
}

+ (NSDictionary *)defaultData {
        
    NSString *path = [[NSBundle bundleWithPath:[self defaultAssetsPath]] pathForResource:@"config" ofType:@"json"];

    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    
    if (data == nil) {
        NSLog(@"无默认配置数据");
        return nil;
    }
    
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

static RCMusicToolBarConfig *kToolBar;
+ (RCMusicToolBarConfig *)toolBar {
    [self checkNil:kConfigToolBarKey object:kToolBar];
    return kToolBar;
}
+ (void)setToolBar:(RCMusicToolBarConfig *)toolBar {}

static RCMusicThemeConfig *kTheme;
+ (RCMusicThemeConfig *)theme {
    [self checkNil:kConfigThemeKey object:kTheme];
    return kTheme;
}
+(void)setTheme:(RCMusicThemeConfig *)theme {}

static RCMusicCollectListConfig *kCollect;
+(RCMusicCollectListConfig *)collect {
    [self checkNil:kConfigCollectKey object:kCollect];
    return kCollect;
}
+ (void)setCollect:(RCMusicCollectListConfig *)collect {}

static RCMusicOnlineListConfig *kOnline;
+ (RCMusicOnlineListConfig *)online {
    [self checkNil:kConfigOnlineKey object:kOnline];
    return kOnline;
}
+ (void)setOnline:(RCMusicOnlineListConfig *)online {}

static RCMusicControlConfig *kControl;
+ (RCMusicControlConfig *)control {
    [self checkNil:kConfigControlKey object:kControl];
    return kControl;
}
+(void)setControl:(RCMusicControlConfig *)control {}

static RCMusicSoundEffectConfig *kSoundEffect;
+ (RCMusicSoundEffectConfig *)soundEffect {
    [self checkNil:kConfigsSoundEffectKey object:kSoundEffect];
    return kSoundEffect;
}
+ (void)setSoundEffect:(RCMusicSoundEffectConfig *)soundEffect {}
@end
