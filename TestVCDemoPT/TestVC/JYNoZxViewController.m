//
//  JYNoZxViewController.m
//  TestVCDemoPT
//
//  Created by apple on 2019/3/5.
//  Copyright © 2019 wjy. All rights reserved.
//

#import "JYNoZxViewController.h"
#import "UIButton+JYStyle.h"
#import "UILabel+JYStyle.h"
#import "JYSearchZxViewController.h"
@interface JYNoZxViewController ()
@property(nonatomic,strong)UIButton *zxBtn;
@property(nonatomic,strong)UIImageView *imgV;
@property(nonatomic,strong)UILabel *tipLb;
@end

@implementation JYNoZxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:UIColorFromRGB(0xffffff)];
    [self.view addSubview:self.imgV];
    [self.view addSubview:self.tipLb];
    [self.view addSubview:self.zxBtn];
}

-(UIButton *)zxBtn
{
    if (!_zxBtn) {
        _zxBtn = [UIButton newFindTeacherBtn];
        _zxBtn.left = self.view.width/2.0 - _zxBtn.width/2.0;
        _zxBtn.top = 30 + self.tipLb.top + self.tipLb.height;
        [_zxBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _zxBtn;
}

-(void)click:(UIButton *)btn
{
    JYSearchZxViewController *vc = [JYSearchZxViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

-(UILabel *)tipLb
{
    if (!_tipLb) {
        _tipLb = [UILabel newLabel];
        _tipLb.font = [UIFont systemFontOfSize:13];
        _tipLb.textColor = UIColorFromRGB(0x999999);
        _tipLb.width = 150;
        _tipLb.textAlignment = NSTextAlignmentCenter;
        _tipLb.height = 15;
        _tipLb.left = self.view.width/2.0 - _tipLb.width/2.0;
        _tipLb.top = 15 + self.imgV.height + self.imgV.top;
        _tipLb.text = @"暂时没有进行中的咨询";
    }
    return _tipLb;
}

-(UIImageView *)imgV
{
    if (!_imgV) {
        _imgV = [UIImageView new];
        _imgV.width = 194;
        _imgV.height = 130;
        _imgV.left = self.view.width/2.0 - _imgV.width/2.0;
        _imgV.top = 105;
        _imgV.image = [UIImage imageNamed:@"暂无咨询图片"];
    }
    return _imgV;
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
