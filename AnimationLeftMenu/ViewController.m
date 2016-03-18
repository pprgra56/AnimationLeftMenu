//
//  ViewController.m
//  AnimationLeftMenu
//
//  Created by 常琼 on 16/3/14.
//  Copyright © 2016年 shouhuobao. All rights reserved.
//

#import "ViewController.h"
#import "CQMenuView.h"


#define ScreenBounds     [UIScreen mainScreen].bounds
#define KeyWindow [[[UIApplication sharedApplication] delegate] window]


@interface ViewController ()

@property(strong,nonatomic) CQMenuView *menu;

@end

@implementation ViewController
//http://182.92.190.64:8010/guoer-appserv/collectSelectCoupons?guoerUserId=2322&cost=3&begin=0&pageSize=1000

-(void)viewDidLoad{
    [super viewDidLoad];

    self.title = @"LeftM";

    self.menu = [[CQMenuView alloc] initwithTitle:@"abc"];
    

}
- (IBAction)trigger:(id)sender {
    [self.menu trigger];
    
}


@end
