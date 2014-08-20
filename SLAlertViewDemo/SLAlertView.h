//
//  SLAlertView.h
//  SLAlertViewDemo
//
//  Created by dash on 14-8-19.
//  Copyright (c) 2014年 com.dash.Qjie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLAlertView : UIView

@property (nonatomic, copy) dispatch_block_t okBlock;
@property (nonatomic, copy) dispatch_block_t cancelBlock;

- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
                okButtonTitle:(NSString *)okButtonTitle
            cancelButtonTitle:(NSString *)cancelButtonTitle;
- (void)show;

@end
