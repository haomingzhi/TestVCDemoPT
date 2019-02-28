//
//  JYTeacherInfoViewController.m
//  TestVCDemoPT
//
//  Created by apple on 2019/2/26.
//  Copyright © 2019 wjy. All rights reserved.
//

#import "JYTeacherInfoViewController.h"
#import "UIButton+JYStyle.h"
#import "UIView+JYLayerEdit.h"
@interface JYTeacherInfoViewController ()
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation JYTeacherInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = mainBgColor;
    self.title = @"导师详情";
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
