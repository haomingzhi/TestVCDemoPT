//
    //  VideoBarViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    
#import "JYVideoBarTableViewCell.h"
    
@interface JYVideoBarTableViewCell()
@property(nonatomic,strong)UIButton *aBtn;
@property(nonatomic,strong)UIButton *bBtn;
@property(nonatomic,strong)UIButton *cBtn;
@property(nonatomic,strong)UILabel *checkLineLb;
@end
@implementation JYVideoBarTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    [self.contentView addSubview:self.aBtn];
    [self.contentView addSubview:self.bBtn];
    [self.contentView addSubview:self.cBtn];
    [self.contentView addSubview:self.checkLineLb];
    }
    return self;
}
-(void)refresh:(NSDictionary *)dic
{
    [self.aBtn setTitle:dic[@"title"] forState:UIControlStateNormal];
[self.bBtn setTitle:dic[@"title"] forState:UIControlStateNormal];
[self.cBtn setTitle:dic[@"title"] forState:UIControlStateNormal];
self.checkLineLb.text = dic[@"checkLineLb"];
    [self setNeedsLayout];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
       _aBtn.height = 24;
    _aBtn.width = 160;
    _aBtn.top = 0;
    _aBtn.left = 0;

    _bBtn.height = 24;
    _bBtn.width = 160;
    _bBtn.top = 0;
    _bBtn.left = 0;

    _cBtn.height = 24;
    _cBtn.width = 160;
    _cBtn.top = 0;
    _cBtn.left = 0;

    _checkLineLb.height = 24;
    _checkLineLb.width = 160;
    _checkLineLb.top = 0;
    _checkLineLb.left = 0;

}
-(UIButton *)aBtn
{
    if (!_aBtn) {
    _aBtn = [UIButton new];
    _aBtn.height = 24;
    _aBtn.width = 160;
    _aBtn.top = 0;
    _aBtn.left = 0;
    }
    return _aBtn;
}
-(UIButton *)bBtn
{
    if (!_bBtn) {
    _bBtn = [UIButton new];
    _bBtn.height = 24;
    _bBtn.width = 160;
    _bBtn.top = 0;
    _bBtn.left = 0;
    }
    return _bBtn;
}
-(UIButton *)cBtn
{
    if (!_cBtn) {
    _cBtn = [UIButton new];
    _cBtn.height = 24;
    _cBtn.width = 160;
    _cBtn.top = 0;
    _cBtn.left = 0;
    }
    return _cBtn;
}
-(UILabel *)checkLineLb
{
    if (!_checkLineLb) {
    _checkLineLb = [UILabel new];
    _checkLineLb.height = 24;
    _checkLineLb.width = 160;
    _checkLineLb.top = 0;
    _checkLineLb.left = 0;
    }
    return _checkLineLb;
}
@end