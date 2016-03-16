//
//  ViewController.m
//  AnimationLeftMenu
//
//  Created by 常琼 on 16/3/14.
//  Copyright © 2016年 shouhuobao. All rights reserved.
//

#import "ViewController.h"
#import "CQMenuView.h"

//#define keyWindow [UIApplication sharedApplication].keyWindow

@interface ViewController ()
@property(strong,nonatomic) CQMenuView *menu;

@property(strong,nonatomic) UIWindow *win;

@end

@implementation ViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.menu = [[CQMenuView alloc] initWithColor:[UIColor redColor]];
//    [keyWindow addSubview:self.menu];
    
    UIView *vv =  [[UIView alloc] initWithFrame:CGRectMake(100, 100, 40, 40)];
    vv.backgroundColor = [UIColor purpleColor];
    self.win =  [[UIApplication sharedApplication] keyWindow];
    
    [self.win addSubview:vv];
}
- (IBAction)trigger:(id)sender {
    
    [self.menu triggler];
    
}


@end
