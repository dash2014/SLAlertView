//
//  SLAlertView.m
//  SLAlertViewDemo
//
//  Created by dash on 14-8-19.
//  Copyright (c) 2014年 com.dash.Qjie. All rights reserved.
//

#import "SLAlertView.h"

static NSInteger const kDefaultAlertViewWidth = 240;
static NSInteger const kDefaultAlertViewHeight = 160;
static NSInteger const kDefaultTitleLabelHeight = 40;
static NSInteger const kDefaultMesssageLabelHeight = 80;
static NSInteger const kDefaultButtonHeight = 40;
static NSInteger const kDefaultTransformDistance = 300;
static NSInteger const kDefaultOKButtonTag = 1001;
static NSInteger const kDefaultCancelButtonTag = 1002;

@interface SLAlertView ()

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) NSString *okButtonTitle;
@property (nonatomic, copy) NSString *cancelButtonTitle;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *messageLabel;
@property (nonatomic, strong) UIButton *okButton;
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) UIWindow *alertWindow;

@end

@implementation SLAlertView

- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
                okButtonTitle:(NSString *)okButtonTitle
            cancelButtonTitle:(NSString *)cancelButtonTitle
{
    if (self = [super init]) {
        self.title = title;
        self.message = message;
        self.okButtonTitle = okButtonTitle;
        self.cancelButtonTitle = cancelButtonTitle;
        [self configAlertView];
    }
    return self;
}

- (void)configAlertView
{
    self.frame = CGRectMake(0, 0, kDefaultAlertViewWidth, kDefaultAlertViewHeight);
    CGPoint point = CGPointMake([UIScreen mainScreen].bounds.size.width / 2, [UIScreen mainScreen].bounds.size.height / 2);
    self.center = point;
    self.layer.cornerRadius = 5;
    self.backgroundColor = [UIColor colorWithWhite:1.0f alpha:0.5];
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, kDefaultTitleLabelHeight)];
        _titleLabel.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.5];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont boldSystemFontOfSize:14];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
        _titleLabel.text = self.title;
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (UILabel *)messageLabel
{
    if (!_messageLabel) {
        _messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.titleLabel.bounds.size.height, self.bounds.size.width, kDefaultMesssageLabelHeight)];
        _messageLabel.backgroundColor = [UIColor redColor];
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        _messageLabel.font = [UIFont systemFontOfSize:14];
        _messageLabel.textColor = [UIColor greenColor];
        _messageLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _messageLabel.text = self.message;
        [self addSubview:_messageLabel];
    }
    return _messageLabel;
}

- (UIButton *)okButton
{
    if (!_okButton) {
        _okButton = [[UIButton alloc] initWithFrame:CGRectMake(0, self.messageLabel.bounds.size.height + self.titleLabel.bounds.size.height, self.bounds.size.width / 2, kDefaultButtonHeight)];
        _okButton.backgroundColor = [UIColor greenColor];
        [_okButton setTitle:self.okButtonTitle forState:UIControlStateNormal];
        _okButton.tag = kDefaultOKButtonTag;
        [_okButton addTarget:self action:@selector(didTapButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_okButton];
    }
    return _okButton;
}

- (UIButton *)cancelButton
{
    if (!_cancelButton) {
        _cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(self.okButton.bounds.size.width, self.messageLabel.bounds.size.height + self.titleLabel.bounds.size.height, self.okButton.bounds.size.width, self.okButton.bounds.size.height)];
        [_cancelButton setTitle:self.cancelButtonTitle forState:UIControlStateNormal];
        _cancelButton.backgroundColor = [UIColor greenColor];
        _cancelButton.tag = kDefaultCancelButtonTag;
        [_cancelButton addTarget:self action:@selector(didTapButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_cancelButton];
    }
    return _cancelButton;
}

- (void)didTapButton:(id)sender
{
    [self dismiss];
    if ([sender tag] == kDefaultOKButtonTag && self.okBlock) {
        self.okBlock();
    } else if ([sender tag] == kDefaultCancelButtonTag && self.cancelBlock){
        self.cancelBlock();
    }
}

- (void)show
{
    self.alertWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.alertWindow.hidden = NO;
    [self.alertWindow addSubview:self];
}

- (void)didMoveToWindow
{
    self.clipsToBounds = NO;
    self.titleLabel.transform = CGAffineTransformMakeTranslation(0, -kDefaultTransformDistance);
    self.messageLabel.transform = CGAffineTransformMakeTranslation(0, kDefaultTransformDistance);
    self.okButton.transform = CGAffineTransformMakeTranslation(-kDefaultTransformDistance, 0);
    self.cancelButton.transform = CGAffineTransformMakeTranslation(kDefaultTransformDistance, 0);
    [UIView animateWithDuration:0.45f delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.titleLabel.transform = CGAffineTransformIdentity;
        self.messageLabel.transform = CGAffineTransformIdentity;
        self.okButton.transform = CGAffineTransformIdentity;
        self.cancelButton.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        self.clipsToBounds = YES;
    }];
    [super didMoveToWindow];
}

- (void)dismiss
{
    self.clipsToBounds = NO;
    [UIView animateWithDuration:0.45f delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.titleLabel.transform = CGAffineTransformMakeTranslation(0, -kDefaultTransformDistance);
        self.messageLabel.transform = CGAffineTransformMakeTranslation(0, kDefaultTransformDistance);
        self.okButton.transform = CGAffineTransformMakeTranslation(-kDefaultTransformDistance, 0);
        self.cancelButton.transform = CGAffineTransformMakeTranslation(kDefaultTransformDistance, 0);
    } completion:^(BOOL finished) {
        self.clipsToBounds = YES;
        [self removeFromSuperview];
    }];
}

@end
