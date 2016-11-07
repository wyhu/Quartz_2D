//
//  ViewController.m
//  Quartz_2D
//
//  Created by huweiya on 16/11/7.
//  Copyright © 2016年 5i5j. All rights reserved.
//

#import "ViewController.h"
#import "KCView.h"

@import AVFoundation;
@class KCView;

@interface ViewController ()


@property (nonatomic, copy) NSString *name;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    KCView *view=[[KCView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    view.backgroundColor=[UIColor lightGrayColor];
    [self.view addSubview:view];
    
    
}


- (void)setName:(NSString *)name
{
    _name = name;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
