//
//  RCMusicLocalListCell.m
//  RCMusicControlKit
//
//  Created by xuefeng on 2021/11/21.
//

#import "RCMusicLocalListCell.h"
#import "RCMusicOnlineListAppearance.h"
#import "RCMusicDefine.h"
#import "UIImage+RCMusicControl.h"
#import "NSString+RCMusicControl.h"
#import "UIImageView+WebCache.h"
#import <Masonry/Masonry.h>
#import "RCMusicInfo.h"
#import "RCMusicPlayingLayer.h"
#import "RCMusicCollectListAppearance.h"
#import "UIButton+RCMusicControl.h"

@interface RCMusicLocalListCell ()
@property (nonatomic, strong) UIImageView *avatarView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subTitleLabel;
@property (nonatomic, strong) UILabel *fileSizeLabel;
@property (nonatomic, strong) UIButton *playButton;
@property (nonatomic, strong) UIButton *deleteButton;
@property (nonatomic, strong) UIButton *topButton;
@property (nonatomic, strong) RCMusicCollectListAppearance *appearance;
@property (nonatomic, strong) RCMusicPlayingLayer *animationLayer;
@end

@implementation RCMusicLocalListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
        self.appearance = [[RCMusicCollectListAppearance alloc] init];
        [self buildLayout];
    }
    return self;
}

+ (NSString *)identifier {
    return @"RCMusicLocalListCellIdentifier";
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self updatePlayingLayer];
}


- (void)updatePlayingLayer {
    if (self.bounds.size.width <= 0) return;
    if (!CGRectIsEmpty(self.animationLayer.frame)) return;
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    CGFloat x = self.bounds.size.width - 23 - 24;
    CGFloat y = (self.bounds.size.height - 24) * 0.5;
    self.animationLayer.frame = CGRectMake(x, y, 24, 24);
    [CATransaction commit];
    if (self.isPlaying) {
        [self.animationLayer startAnimation];
    }
}
#pragma mark -LAYOUT SUBVIEWS

- (void)buildLayout {
    [self.contentView addSubview:self.avatarView];
    [self.avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView).offset(self.appearance.contentInsets.left);
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(self.appearance.avatarSize);
    }];
    
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.avatarView.mas_trailing).offset(self.appearance.subTitleLabelEdgeInsets.left);
        make.top.equalTo(self.contentView).offset(6);
        make.trailing.equalTo(self.contentView).offset(10);
    }];
    
    [self.contentView addSubview:self.subTitleLabel];
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.avatarView.mas_trailing).offset(self.appearance.subTitleLabelEdgeInsets.left);
        make.centerY.equalTo(self.avatarView);
        make.trailing.equalTo(self.contentView).offset(-10);
    }];
    
    [self.contentView addSubview:self.fileSizeLabel];
    [self.fileSizeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.avatarView.mas_trailing).offset(self.appearance.fileSizeLabelEdgeInsets.left);
        make.bottom.equalTo(self.contentView).offset(-6);
        make.trailing.equalTo(self.contentView).offset(-6);
    }];
    
    [self.contentView addSubview:self.playButton];
    [self.playButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.avatarView);
    }];
    
    [self.contentView addSubview:self.deleteButton];
    [self.deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(44, 44));
        make.centerY.equalTo(self.playButton);
        make.trailing.equalTo(self.contentView).offset(-10);
    }];
    
    [self.contentView addSubview:self.topButton];
    [self.topButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.deleteButton);
        make.size.mas_equalTo(CGSizeMake(44, 44));
        make.trailing.equalTo(self.deleteButton.mas_leading).offset(-10);
    }];
    
    [self.layer addSublayer:self.animationLayer];
}

- (void)setIsPlaying:(BOOL)isPlaying {
    _isPlaying = isPlaying;
    self.playButton.selected = isPlaying;
    self.topButton.hidden = isPlaying;
    self.deleteButton.hidden = isPlaying;
    if (!CGRectIsEmpty(self.animationLayer.frame)) {
        if (isPlaying) {
            [self.animationLayer startAnimation];
        } else {
            [self.animationLayer stopAnimation];
        }
    }
}

- (void)setMusic:(id <RCMusicInfo>)music {
    _music = music;
    if (music.coverUrl != nil) {
        [self.avatarView sd_setImageWithURL:[NSURL URLWithString:music.coverUrl] placeholderImage:[UIImage rcm_imageNamed:@"music_placeholder"] options:SDWebImageQueryDiskDataSync completed:nil];
    } else {
        NSLog(@"歌曲封面图片为空");
    }
    
    self.titleLabel.text = music.musicName ?: @"";
    self.subTitleLabel.text = music.author ?: @"";
    self.fileSizeLabel.text = [music.size rcm_sizeFormatString] ?: @"";
}

#pragma mark - BUTTON ACTION

- (void)play:(UIButton *)button {
    if (self.clickAction) {
        if (!self.isPlaying) {
            self.clickAction(RCMusicLocalListCellActionTypePlay);
        } else {
            self.clickAction(RCMusicLocalListCellActionTypeStop);
        }
    }
}

- (void)top:(UIButton *)button {
    if (self.clickAction) {
        self.clickAction(RCMusicLocalListCellActionTypeTop);
    }
}

- (void)_delete:(UIButton *)button {
    if (self.clickAction) {
        self.clickAction(RCMusicLocalListCellActionTypeDelete);
    }
}

#pragma mark - GETTER
- (UIImageView *)avatarView {
    if (_avatarView == nil) {
        _avatarView = [[UIImageView alloc] init];
        _avatarView.layer.cornerRadius = self.appearance.avatarSize.height/2;
        _avatarView.layer.masksToBounds = YES;
    }
    return _avatarView;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"DefaultValue";
        _titleLabel.textColor = self.appearance.titleLabelTextColor;
        _titleLabel.font = self.appearance.titleLabelFont;
    }
    return _titleLabel;
}

-(UILabel *)subTitleLabel {
    if (_subTitleLabel == nil) {
        _subTitleLabel = [[UILabel alloc] init];
        _subTitleLabel.text = @"sub DefaultValue";
        _subTitleLabel.textColor = self.appearance.subTitleLabelTextColor;
        _subTitleLabel.font = self.appearance.subTitleLabelFont;
    }
    return _subTitleLabel;
}

-(UILabel *)fileSizeLabel {
    if (_fileSizeLabel == nil) {
        _fileSizeLabel = [[UILabel alloc] init];
        _fileSizeLabel.text = @"file size DefaultValue";
        _fileSizeLabel.textColor = self.appearance.fileSizeLabelTextColor;
        _fileSizeLabel.font = self.appearance.fileSizeLabelFont;
    }
    return _fileSizeLabel;
}

- (UIButton *)playButton {
    if (_playButton == nil) {
        _playButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_playButton setImage:[UIImage rcm_imageNamed:@"play_icon"] forState:UIControlStateNormal];
        [_playButton setImage:[UIImage rcm_imageNamed:@"pause_icon"] forState:UIControlStateSelected];
        [_playButton addTarget:self action:@selector(play:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _playButton;
}

- (UIButton *)topButton {
    if (_topButton == nil) {
        _topButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_topButton rcm_setImage:self.appearance.topIconPath url:self.appearance.topIconUrl forState:UIControlStateNormal];
        [_topButton addTarget:self action:@selector(top:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _topButton;
}


- (UIButton *)deleteButton {
    if (_deleteButton == nil) {
        _deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_deleteButton rcm_setImage:self.appearance.delIconPath url:self.appearance.delIconUrl forState:UIControlStateNormal];
        [_deleteButton addTarget:self action:@selector(_delete:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _deleteButton;
}

- (RCMusicPlayingLayer *)animationLayer {
    if (_animationLayer == nil) {
        _animationLayer = [[RCMusicPlayingLayer alloc] init];
    }
    return _animationLayer;
}

- (RCMusicCollectListAppearance *)appearance {
    if (_appearance == nil) {
        _appearance = [[RCMusicCollectListAppearance alloc] init];
    }
    return _appearance;
}

@end
