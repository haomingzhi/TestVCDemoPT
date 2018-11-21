//
    //  checkMoneyViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    
#import "JYcheckMoneyTableViewCell.h"
    
@interface JYcheckMoneyTableViewCell()
@property(nonatomic,strong)UIButton *aBtn;
@property(nonatomic,strong)UIButton *bBtn;
@property(nonatomic,strong)UIButton *cBtn;
@property(nonatomic,strong)UIButton *dBtn;
@property(nonatomic,strong)UIButton *eBtn;
@property(nonatomic,strong)UIButton *fBtn;
@end
@implementation JYcheckMoneyTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    [self.contentView addSubview:self.aBtn];
    [self.contentView addSubview:self.bBtn];
    [self.contentView addSubview:self.cBtn];
    [self.contentView addSubview:self.dBtn];
    [self.contentView addSubview:self.eBtn];
    [self.contentView addSubview:self.fBtn];
    }
    return self;
}
-(void)refresh:(NSDictionary *)dic
{
    [self.aBtn setTitle:dic[@"title"] forState:UIControlStateNormal];
[self.bBtn setTitle:dic[@"title"] forState:UIControlStateNormal];
[self.cBtn setTitle:dic[@"title"] forState:UIControlStateNormal];
[self.dBtn setTitle:dic[@"title"] forState:UIControlStateNormal];
[self.eBtn setTitle:dic[@"title"] forState:UIControlStateNormal];
[self.fBtn setTitle:dic[@"title"] forState:UIControlStateNormal];
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

    _dBtn.height = 24;
    _dBtn.width = 160;
    _dBtn.top = 0;
    _dBtn.left = 0;

    _eBtn.height = 24;
    _eBtn.width = 160;
    _eBtn.top = 0;
    _eBtn.left = 0;

    _fBtn.height = 24;
    _fBtn.width = 160;
    _fBtn.top = 0;
    _fBtn.left = 0;

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
-(UIButton *)dBtn
{
    if (!_dBtn) {
    _dBtn = [UIButton new];
    _dBtn.height = 24;
    _dBtn.width = 160;
    _dBtn.top = 0;
    _dBtn.left = 0;
    }
    return _dBtn;
}
-(UIButton *)eBtn
{
    if (!_eBtn) {
    _eBtn = [UIButton new];
    _eBtn.height = 24;
    _eBtn.width = 160;
    _eBtn.top = 0;
    _eBtn.left = 0;
    }
    return _eBtn;
}
-(UIButton *)fBtn
{
    if (!_fBtn) {
    _fBtn = [UIButton new];
    _fBtn.height = 24;
    _fBtn.width = 160;
    _fBtn.top = 0;
    _fBtn.left = 0;
    }
    return _fBtn;
}
@end