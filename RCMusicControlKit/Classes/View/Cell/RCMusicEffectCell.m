//
//  RCMusicEffectCell.m
//  RCE
//
//  Created by xuefeng on 2021/11/26.
//

#import "RCMusicEffectCell.h"
#import "RCMusicSoundEffectAppearance.h"
#import <Masonry/Masonry.h>

@interface RCMusicEffectCell ()
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) RCMusicSoundEffectAppearance *appearance;
@end

@implementation RCMusicEffectCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self buildLayout];
    }
    return self;
}

- (void)setSelected:(BOOL)selected {
    if (selected) {
        self.contentLabel.backgroundColor = self.appearance.itemSelectedBackgroundColor;
        self.contentLabel.textColor = self.appearance.normalTextColor;
        self.contentLabel.layer.borderColor = self.appearance.normalBorderColor.CGColor;
    } else {
        self.contentLabel.backgroundColor = self.appearance.itemNormalBackgroundColor;
        self.contentLabel.textColor = self.appearance.selectedTextColor;
        self.contentLabel.layer.borderColor = self.appearance.selectedBorderColor.CGColor;
    }
}

- (void)buildLayout {
    [self addSubview:self.contentLabel];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(64, 38));
    }];
}

+ (NSString *)identifier {
    return @"RCMusicEffectCellIdentifier";
}

+ (void)setIdentifier:(NSString *)identifier {};

- (void)setItem:(id<RCMusicEffectInfo>)item {
    _item = item;
    self.contentLabel.text = item.effectName ?: @"";
}

- (UILabel *)contentLabel {
    if (_contentLabel == nil) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.layer.masksToBounds = YES;
        _contentLabel.layer.cornerRadius = self.appearance.itemSize.height/2;
        _contentLabel.textAlignment = NSTextAlignmentCenter;
        _contentLabel.textColor = self.appearance.normalTextColor;
        _contentLabel.layer.borderWidth = self.appearance.borderWidth;
        _contentLabel.layer.borderColor = self.appearance.normalBorderColor.CGColor;
    }
    return _contentLabel;
}

- (RCMusicSoundEffectAppearance *)appearance {
    if (_appearance == nil) {
        _appearance = [[RCMusicSoundEffectAppearance alloc] init];
    }
    return _appearance;
}
@end
