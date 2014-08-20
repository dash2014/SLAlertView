//
//  ViewController.m
//  SLAlertViewDemo
//
//  Created by dash on 14-8-19.
//  Copyright (c) 2014年 com.dash.Qjie. All rights reserved.
//

#import "ViewController.h"

#import "SLAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didTapButton:(id)sender
{
    SLAlertView *alertView = [[SLAlertView alloc] initWithTitle:@"提醒" message:@"这是一个提醒哦" okButtonTitle:@"确定" cancelButtonTitle:@"取消"];
    [alertView show];
}

@end
