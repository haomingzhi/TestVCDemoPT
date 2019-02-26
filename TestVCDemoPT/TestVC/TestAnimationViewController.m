//
//  TestAnimationViewController.m
//  TestVCDemoPT
//
//  Created by apple on 2019/1/31.
//  Copyright © 2019 wjy. All rights reserved.
//

#import "TestAnimationViewController.h"
#import "TestView.h"
@interface TestAnimationViewController ()
@property(nonatomic,strong)UIView *v;
@property(nonatomic,strong)UIView *v2;
@property(nonatomic,strong)UIView *v3;
@end

@implementation TestAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    TestView *vc = [TestView new];
    vc.width = UIScreenWidth;
    vc.height = UIScreenHeight - 90;
    vc.top = 90;
    [self.view addSubview:vc];
    self.view.backgroundColor = UIColorFromRGB(0xffffff);
    UIButton *btn = [UIButton new];
    btn.backgroundColor = [UIColor blueColor];
    btn.width = 100;
    btn.height = 36;
    btn.top = 86;
    [btn setTitle:@"测试" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(testAnimation) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    UIView *v = [UIView new];
    v.backgroundColor = [UIColor whiteColor];
    v.width = 100;
    v.height = 100;
    v.top = 100;
    v.left = 100;
    [self.view addSubview:v];
    self.v = v;
    
    UIView *v2 = [UIView new];
    v2.backgroundColor = [UIColor redColor];
    v2.width = 100;
    v2.height = 100;
    [v addSubview:v2];
    self.v2 = v2;
    
    UIView *v3 = [UIView new];
    v3.backgroundColor = [UIColor yellowColor];
    v3.width = 100;
    v3.height = 100;
    [v addSubview:v3];
    self.v3 = v3;
}

-(void)testAnimation
{
//    NSLog(@"ccss");
    [UIView beginAnimations:@"imageViewTranslation" context:nil];
    [UIView setAnimationDuration:2.0];
//    [UIView setAnimationDelegate:self];
//    [UIView setAnimationWillStartSelector:@selector(startAnimation)];
//    [UIView setAnimationDidStopSelector:@selector(stopAnimation)];
    [UIView setAnimationRepeatCount:1.0];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationRepeatAutoreverses:YES];
    [UIView setAnimationRepeatCount:MAXFLOAT];
    
  
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.v cache:YES];
    self.v3.hidden = YES;
    [UIView commitAnimations];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
