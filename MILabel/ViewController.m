//
//  ViewController.m
//  MILabel
//
//  Created by 罗壮燊 on 2017/2/6.
//  Copyright © 2017年 罗壮燊. All rights reserved.
//

#import "ViewController.h"

#import "MIView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet MIView *miLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"按住屏幕分享歌词";
    label.textColor = [UIColor redColor];
    label.textAlignment = NSTextAlignmentCenter;
    
    self.miLabel.maskLabel = label;
    self.miLabel.miColor = [UIColor whiteColor];
    
    self.view.backgroundColor = [UIColor blackColor];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
