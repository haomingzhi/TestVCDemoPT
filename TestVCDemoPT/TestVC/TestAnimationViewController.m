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
