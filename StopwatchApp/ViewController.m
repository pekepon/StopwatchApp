//
//  ViewController.m
//  StopwatchApp
//
//  Created by 井上圭一 on 2016/01/07.
//  Copyright © 2016年 keiichi, inoue. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    UILabel *timeLabel;
    NSTimer *timer;
    NSInteger countNumber;
    NSInteger countMinute;
    NSInteger countSecond;
    UIButton *button1;
    UIButton *button2;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    countNumber = 0;
    countMinute = 0;
    countSecond = 0;
    
    [self setupParts];
    [self setupButton];
    
    //timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick:) userInfo:nil repeats:YES];

    
}-(void)tick:(NSTimer*)timer{
    countSecond++;
    if (countSecond == 60){
        countSecond = 0;
        countMinute++;
    }
    timeLabel.text = [NSString stringWithFormat:@"%02d:%02d", countMinute, countSecond];
}
-(void)setupParts{
    timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 100)];
    timeLabel.center = CGPointMake(185, 230);
    timeLabel.font = [UIFont fontWithName:@"HirakakuProN-W6" size:48];
    timeLabel.text = @"00:00";
    timeLabel.textAlignment = NSTextAlignmentCenter;
    timeLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:timeLabel];
}
-(void)setupButton{
    button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button1.frame = CGRectMake(0, 0, 100, 50);
    button1.center = CGPointMake(185, 400);
    [button1 setTitle:@"START" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(timer:)forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button1];
    
    button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.frame = CGRectMake(0, 0, 100, 50);
    button2.center = CGPointMake(185, 500);
    [button2 setTitle:@"RESET" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(timerreset:)forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button2];
}
-(void)timer:(id)sender{
    countNumber++;
    if (countNumber == 1){
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick:) userInfo:nil repeats:YES];
        [button1 setTitle:@"STOP" forState:UIControlStateNormal];
    } else {
        [timer invalidate];
        timer = nil;
        [button1 setTitle:@"START" forState:UIControlStateNormal];
        countNumber = 0;
    }
}
-(void)timerreset:(id)sender{
    countMinute = 0;
    countSecond = 0;
    timeLabel.text = [NSString stringWithFormat:@"00:00"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
