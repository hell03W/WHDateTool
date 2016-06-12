//
//  ViewController.m
//  WHDateTool
//
//  Created by Walden on 16/2/2.
//  Copyright © 2016年 Walden. All rights reserved.
//

#import "ViewController.h"
#import "NSDate+WHDateTools.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSDate *date = [NSDate date];
    NSInteger weekDay = [date weekDay];
    
    NSDate *endDate = [@"2016-07-07" dateWithFormater:@"yyyy-MM-dd"];
    date = [date dateByAddingDays:2];
    NSInteger count = [NSDate countWeekdayFrom:date to:endDate weekDay:7];
    
    NSLog(@"count = %ld", count);
//    NSLog(@"date = %@, weekDay = %ld", date, weekDay);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
