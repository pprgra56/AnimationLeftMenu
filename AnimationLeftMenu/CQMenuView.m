//
//  CQMenuView.m
//  AnimationLeftMenu
//
//  Created by 常琼 on 16/3/15.
//  Copyright © 2016年 shouhuobao. All rights reserved.
//

#import "CQMenuView.h"

#define KeyWindow [UIApplication sharedApplication].keyWindow
#define Offset 50

@interface CQMenuView()
@property(strong,nonatomic) UIColor *backgroundColor;

@property(strong,nonatomic) UIView *temporaryView1;
@property(strong,nonatomic) UIView *temporaryView2;



@end


@implementation CQMenuView

-(instancetype)init{
    self = [super init];
    if(self){
        
        self.temporaryView1.frame = CGRectMake(-40, KeyWindow.center.y, 40, 40);
        self.temporaryView2.frame = CGRectMake(-40, KeyWindow.center.y, 40, 40);
        [KeyWindow addSubview:self.temporaryView1];
        [KeyWindow addSubview:self.temporaryView2];
    }
    return self;
}



-(void)triggler{
    [UIView animateWithDuration:.7 animations:^{
        
        self.frame = CGRectMake(0, 0, KeyWindow.frame.size.width/2+Offset, KeyWindow.frame.size.height);
        
    }];
}




@end
