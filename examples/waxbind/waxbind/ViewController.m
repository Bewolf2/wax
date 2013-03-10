//
//  ViewController.m
//  waxbind
//
//  Created by baiyi on 13-3-10.
//  Copyright (c) 2013年 taobao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)loadView {
    
    [super loadView];

    wax_bind([[[NSBundle mainBundle] resourcePath] cStringUsingEncoding:NSUTF8StringEncoding],
             [@"waxbind.lua" cStringUsingEncoding:NSUTF8StringEncoding],
             self);
    
    
    
}

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

@end
