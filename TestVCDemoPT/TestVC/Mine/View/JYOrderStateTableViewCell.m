//
//  OrderStateViewController.m
//  Model
//
//  Created by wjy on 2018/10/25.
//  Copyright © 2018 wjy. All rights reserved.
//


#import "JYOrderStateTableViewCell.h"
//#import "UIView+NTES.h"

@interface JYOrderStateTableViewCell()
@property(nonatomic,strong)UILabel *stateLb;

@property(nonatomic,strong)UIButton *aBtn;

@property(nonatomic,strong)UIButton *bBtn;
@property(nonatomic,strong)NSDictionary *dataDic;
@end

@implementation JYOrderStateTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.stateLb];
        [self.contentView addSubview:self.aBtn];
        [self.contentView addSubview:self.bBtn];
    }
    return self;
}

-(void)refresh:(NSDictionary *)dic
{
    _dataDic = dic;
    self.stateLb.text = dic[@"stateTag"];
    
    [self.aBtn setTitle:dic[@"aTitle"] forState:UIControlStateNormal];
    
    [self.bBtn setTitle:dic[@"bTitle"] forState:UIControlStateNormal];
    [self setNeedsLayout];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    _stateLb.centerY = self.height/2.0;
    _stateLb.left = 15;
    
    _bBtn.centerY = self.height/2.0;
    _bBtn.left = UIScreenWidth - 15 - _bBtn.width;
    
    _aBtn.centerY = self.height/2.0;
    _aBtn.left = _bBtn.left - 20 - _aBtn.width;
  
}

-(UILabel *)stateLb
{
    if (!_stateLb) {
        _stateLb = [UILabel new];
        _stateLb.height = 24;
        _stateLb.width = 160;
        _stateLb.top = 0;
        _stateLb.left = 0;
        _stateLb.font = [UIFont systemFontOfSize:15];
        _stateLb.textColor = UIColorFromRGB(0x999999);
    }
    return _stateLb;
}

-(UIButton *)aBtn
{
    if (!_aBtn) {
        _aBtn = [UIButton new];
        _aBtn.height = 25;
        _aBtn.width = 68;
        _aBtn.layer.cornerRadius = _aBtn.height/2.0;
        _aBtn.layer.masksToBounds = YES;
        _aBtn.layer.borderWidth = 0.5;
        _aBtn.layer.borderColor = UIColorFromRGB(0x8B80F1).CGColor;
        [_aBtn setTitleColor:UIColorFromRGB(0x8B80F1) forState:UIControlStateNormal];
        _aBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        _aBtn.top = 0;
        _aBtn.left = 0;
    }
    return _aBtn;
}

-(UIButton *)bBtn
{
    if (!_bBtn) {
        _bBtn = [UIButton new];
        _bBtn.height = 25;
        _bBtn.width = 68;
        _bBtn.layer.cornerRadius = _bBtn.height/2.0;
        _bBtn.layer.masksToBounds = YES;
        _bBtn.backgroundColor = UIColorFromRGB(0x8B80F1);
        _bBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        _bBtn.top = 0;
        _bBtn.left = 0;
    }
    return _bBtn;
}
@end
