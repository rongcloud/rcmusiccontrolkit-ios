//
//  RCMusicSoundEffectToolView.m
//  RCMusicControlKit
//
//  Created by xuefeng on 2021/11/22.
//

#import "RCMusicSoundEffectToolView.h"
#import <Masonry/Masonry.h>
#import "RCMUsicColors.h"
#import "RCMusicEffectCell.h"
#import "RCMusicSoundEffectAppearance.h"

@interface RCMusicSoundEffectToolView ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UIVisualEffectView *backgroundView;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) RCMusicSoundEffectAppearance *appearance;
@end

@implementation RCMusicSoundEffectToolView

- (instancetype)init {
    if (self = [super init]) {
        [self buildLayout];
    }
    return self;
}

#pragma mark - COLLECTION VIEW DELEGATE

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.items.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RCMusicEffectCell *cell = (RCMusicEffectCell *)[collectionView dequeueReusableCellWithReuseIdentifier:RCMusicEffectCell.identifier forIndexPath:indexPath];
    cell.item = self.items[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.itemClick) {
        self.itemClick(self.items[indexPath.row]);
    }
}

- (void)buildLayout {
    [self addSubview:self.backgroundView];
    [self.backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [self addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.top.equalTo(self);
        make.leading.equalTo(self).offset(self.appearance.insets.left);
        make.trailing.equalTo(self).offset(-self.appearance.insets.right);
    }];
}

- (void)setItems:(NSArray<RCMusicEffectInfo> *)items {
    _items = items;
    [self.collectionView reloadData];
}

- (UIVisualEffectView *)backgroundView {
    if (_backgroundView == nil) {
        _backgroundView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
        _backgroundView.backgroundColor = self.appearance.backgroundColor;
    }
    return _backgroundView;;
}

- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.minimumInteritemSpacing = self.appearance.itemSpace;
        layout.estimatedItemSize = CGSizeMake(64, self.appearance.itemSize.height);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor clearColor];
        [_collectionView registerClass:[RCMusicEffectCell class] forCellWithReuseIdentifier:RCMusicEffectCell.identifier];
    }
    return _collectionView;
}

- (RCMusicSoundEffectAppearance *)appearance {
    if (_appearance == nil) {
        _appearance = [[RCMusicSoundEffectAppearance alloc] init];
    }
    return _appearance;
}
@end
