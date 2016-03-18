//
//  CQMenuView.m
//  AnimationLeftMenu
//
//  Created by 常琼 on 16/3/15.
//  Copyright © 2016年 shouhuobao. All rights reserved.
//

#import "CQMenuView.h"

#define ScreenBounds     [UIScreen mainScreen].bounds
#define KeyWindow [[[UIApplication sharedApplication] delegate] window]
#define Offset 50

@interface CQMenuView()


@property(strong,nonatomic) UIView *temporaryView1;
@property(strong,nonatomic) UIView *temporaryView2;

@property(strong,nonatomic) CADisplayLink *displayLink;

@property(assign,nonatomic) int animCount;

@property(assign,nonatomic) CGFloat diff;

@property(assign,nonatomic) BOOL opening;//yes.开 no.关

@end


@implementation CQMenuView


-(id)initwithTitle:(NSString *)title{
	    return [self initWithTitles:@[title] withButtonHeight:20.0f withMenuColor:[UIColor colorWithRed:0 green:0.722 blue:1 alpha:1] withBackBlurStyle:UIBlurEffectStyleLight];
}
-(id)initWithTitles:(NSArray *)titles withButtonHeight:(CGFloat)height withMenuColor:(UIColor *)menuColor withBackBlurStyle:(UIBlurEffectStyle)style{
	self = [super init];
	if (self) {

		self.frame = CGRectMake( -(ScreenBounds.size.width/2+Offset), 0, ScreenBounds.size.width/2+Offset, ScreenBounds.size.height);
		
		self.temporaryView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
		self.temporaryView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
		
		[KeyWindow addSubview: self.temporaryView1];
		[KeyWindow addSubview:self.temporaryView2];
		
		self.backgroundColor = [UIColor clearColor];
		
		[KeyWindow addSubview:self];
	}
	return self;
	
}
-(void)drawRect:(CGRect)rect{
 
	UIBezierPath *path = [UIBezierPath bezierPath];
	
	[path moveToPoint:CGPointMake(0, 0)];
	[path addLineToPoint:CGPointMake(self.frame.size.width-Offset, 0)];
	[path addQuadCurveToPoint:CGPointMake(self.frame.size.width-Offset, KeyWindow.frame.size.height) controlPoint:CGPointMake(self.frame.size.width-Offset+self.diff, KeyWindow.frame.size.height/2)];
	[path addLineToPoint:CGPointMake(0, KeyWindow.frame.size.height)];
	[path closePath];
	
	[[UIColor blueColor] setFill];
	 [path fillWithBlendMode:kCGBlendModeColorBurn alpha:1];
	
	[path stroke];
	
	
	NSLog(@"Joker %f",self.diff);
}
-(void)trigger{
	
	if(!self.opening){
		
		[UIView animateWithDuration:.3 animations:^{
			
			self.frame = self.bounds;
			
		}];
		
		//1
		[self startAnimation];
		[UIView animateWithDuration:.7 delay:0 usingSpringWithDamping:.5 initialSpringVelocity:.9 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionAllowUserInteraction animations:^{
			self.temporaryView1.center =CGPointMake(KeyWindow.center.x, 0);
			
		} completion:^(BOOL finished) {
			
			[self stopAnimation];
		}];
		
		//2
		[self startAnimation];
		[UIView animateWithDuration:.7 delay:0 usingSpringWithDamping:.8 initialSpringVelocity:2.0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionAllowUserInteraction animations:^{
			self.temporaryView2.center =CGPointMake(KeyWindow.center.x, 0);
			
		} completion:^(BOOL finished) {
			
			[self stopAnimation];
		}];

	}else{
		[UIView animateWithDuration:.3 animations:^{
			CGRect tempFrame = self.frame;
			tempFrame.origin.x = -tempFrame.size.width;
			self.frame = tempFrame;
			
		}];
		//1
		[self startAnimation];
		[UIView animateWithDuration:.7 delay:0 usingSpringWithDamping:.5 initialSpringVelocity:.9 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionAllowUserInteraction animations:^{
			self.temporaryView1.center =CGPointMake(0, 0);
			
		} completion:^(BOOL finished) {
			
			[self stopAnimation];
		}];
		
		//2
		[self startAnimation];
		[UIView animateWithDuration:.7 delay:0 usingSpringWithDamping:.8 initialSpringVelocity:2.0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionAllowUserInteraction animations:^{
			self.temporaryView2.center =CGPointMake(0, 0);
			
		} completion:^(BOOL finished) {
			
			[self stopAnimation];
		}];
	}
	
	self.opening  = !self.opening;
	
	
}
-(void)startAnimation{
	
	if(self.animCount == 0){
		self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(DisplayLink)];
		[self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
		
	}
	self.animCount++;
}
-(void)stopAnimation{
	self.animCount--;
	if(self.animCount == 0){
		[self.displayLink invalidate];
	}
}

-(void)DisplayLink{
	CALayer *layer = [self.temporaryView1.layer presentationLayer];
	CALayer *layer2 = [self.temporaryView2.layer presentationLayer];
	
	self.diff = layer.frame.origin.x - layer2.frame.origin.x;
	[self setNeedsDisplay];

	
}

@end
