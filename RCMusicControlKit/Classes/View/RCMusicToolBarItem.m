//
//  RCMusicToolBarItem.m
//  RCMusicControlKit
//
//  Created by xuefeng on 2021/11/15.
//

#import "RCMusicToolBarItem.h"
#import "RCMusicBarItemAppearance.h"
#import <Masonry/Masonry.h>
#import "UIButton+RCMusicControl.h"
#import "RCImage.h"

@interface UIButton (RCMMutex)
@property (class, nonatomic, strong) NSPointerArray *mutexButtons;
@end

@implementation UIButton (RCMMutex)

static NSPointerArray *k_btns;

+ (NSPointerArray *)mutexButtons {
    if (k_btns == nil) {
        k_btns = [NSPointerArray weakObjectsPointerArray];
    }
    return k_btns;
}

+ (void)setMutexButtons:(NSPointerArray *)mutexButtons {}

- (void)record {
    [UIButton.mutexButtons compact];
    [UIButton.mutexButtons addPointer:(__bridge void*)self];
}

- (void)resetRecordButtonSelectedState {
    [UIButton.mutexButtons compact];
    for (UIButton *btn in UIButton.mutexButtons) {
        btn.selected = NO;
    }
}

@end

@interface RCMusicToolBarItem ()
@property (nonatomic, copy) NSString *normalImagePath;
@property (nonatomic, copy) NSString *normalImageUrl;
@property (nonatomic, copy) NSString *selectedImagePath;
@property (nonatomic, copy) NSString *selectedImageUrl;
@property (nonatomic, strong) UIButton *contentButton;
@property (nonatomic, weak) id<NSObject> target;
@property (nonatomic, assign) SEL action;
@property (nonatomic, assign, readwrite, getter=isRecord) BOOL record;
@property (nonatomic, strong) RCMusicBarItemAppearance *appearance;
@end

@implementation RCMusicToolBarItem

- (void)dealloc {
    
}

- (instancetype)initWithNormalImagePath:(nullable NSString *)normalImagePath
                         normalImageUrl:(nullable NSString *)normalImageUrl
                      selectedImagePath:(nullable NSString *)selectedImagePath
                       selectedImageUrl:(nullable NSString *)selectedImageUrl
                             record:(BOOL)record
                             target:(nullable id)target
                             action:(nullable SEL)action {
    if (self = [self initWithFrame:CGRectMake(0, 0, self.size.width, self.size.height)]) {
        self.target = target;
        self.action = action;
        self.normalImagePath = normalImagePath;
        self.normalImageUrl = normalImageUrl;
        self.selectedImagePath = selectedImagePath;
        self.selectedImageUrl = selectedImageUrl;
        self.record = record;
        [self buildLayout];
    }
    return self;
}

- (void)buildLayout {
    [self addSubview:self.contentButton];
    [self.contentButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.appearance.size);
        make.center.mas_equalTo(self);
    }];
}

#pragma mark - ACTION

- (void)buttonClick:(UIButton *)button {
    if (self.isRecord) {
        [button resetRecordButtonSelectedState];
    }
    button.selected = !button.selected;
    if ([self.target respondsToSelector:self.action]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self.target performSelector:self.action];
#pragma clang diagnostic pop
    }
}

#pragma mark -GETTER

- (UIButton *)contentButton {
    if (_contentButton == nil) {
        _contentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _contentButton.backgroundColor = self.appearance.backgroundColor;
        [self buttonSetBgImage:_contentButton imagePath:self.normalImagePath imageUrl:self.normalImageUrl state:UIControlStateNormal];
        [self buttonSetBgImage:_contentButton imagePath:self.selectedImagePath imageUrl:self.selectedImageUrl state:UIControlStateSelected];
        [_contentButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        _contentButton.layer.masksToBounds = YES;
        _contentButton.layer.cornerRadius = self.appearance.size.width/2;
        if (_record) {
            [_contentButton record];
        }
    }
    return _contentButton;
}

- (void)buttonSetBgImage:(UIButton *)button imagePath:(NSString *)path imageUrl:(NSString *)url state:(UIControlState)state {
    [button rcm_setImage:path url:url forState:state];
}

- (CGSize)size {
    return self.appearance.size;
}

- (BOOL)isSelected {
    return self.contentButton.selected;
}

- (RCMusicBarItemAppearance *)appearance {
    if (_appearance == nil) {
        _appearance = [[RCMusicBarItemAppearance alloc] init];
    }
    return _appearance;
}
#pragma  mark -SETTER

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.appearance.size = frame.size;
}

- (void)setSelected:(BOOL)selected {
    [self.contentButton resetRecordButtonSelectedState];
    self.contentButton.selected = YES;
}
@end
