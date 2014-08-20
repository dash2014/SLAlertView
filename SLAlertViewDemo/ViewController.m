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
    SLAlertView *alertView = [[SLAlertView alloc] initWithTitle:@"woqu" message:@"123" okButtonTitle:@"324" cancelButtonTitle:@"23443"];
    [alertView show];
}

@end
