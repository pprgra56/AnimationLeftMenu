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

@interface ViewController ()

@property(strong,nonatomic) CQMenuView *menu;

@property(strong,nonatomic) UIWindow *win;

@end

@implementation ViewController

-(CQMenuView *)menu{
    if (_menu == nil) {
        _menu = [CQMenuView new];
    }
    return _menu;
}


-(void)viewDidLoad{
    [super viewDidLoad];

    self.title = @"demo";

    UIWindow *keywindow = [[UIApplication sharedApplication] windows][0];
    NSLog(@"%p",keywindow);
    
    [self.navigationController.view setBackgroundColor:[UIColor blueColor]];
    NSLog(@"Joker %p",self.navigationController.view);
    
    
    
  

}
- (IBAction)trigger:(id)sender {
    
    [self.menu triggler];
    
}


@end
