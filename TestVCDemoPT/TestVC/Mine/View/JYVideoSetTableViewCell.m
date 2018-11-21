//
    //  VideoSetViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    
#import "JYVideoSetTableViewCell.h"
    
@interface JYVideoSetTableViewCell()
@property(nonatomic,strong)UILabel *titleLb;
@property(nonatomic,strong)UIButton *aBtn;
@property(nonatomic,strong)UIButton *bBtn;
@property(nonatomic,strong)UILabel *lineLb;
@end
@implementation JYVideoSetTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    [self.contentView addSubview:self.titleLb];
    [self.contentView addSubview:self.aBtn];
    [self.contentView addSubview:self.bBtn];
    [self.contentView addSubview:self.lineLb];
    }
    return self;
}
-(void)refresh:(NSDictionary *)dic
{
    self.titleLb.text = dic[@"titleLb"];
[self.aBtn setTitle:dic[@"title"] forState:UIControlStateNormal];
[self.bBtn setTitle:dic[@"title"] forState:UIControlStateNormal];
self.lineLb.text = dic[@"lineLb"];
    [self setNeedsLayout];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
       _titleLb.height = 24;
    _titleLb.width = 160;
    _titleLb.top = 0;
    _titleLb.left = 0;

    _aBtn.height = 24;
    _aBtn.width = 160;
    _aBtn.top = 0;
    _aBtn.left = 0;

    _bBtn.height = 24;
    _bBtn.width = 160;
    _bBtn.top = 0;
    _bBtn.left = 0;

    _lineLb.height = 24;
    _lineLb.width = 160;
    _lineLb.top = 0;
    _lineLb.left = 0;

}
-(UILabel *)titleLb
{
    if (!_titleLb) {
    _titleLb = [UILabel new];
    _titleLb.height = 24;
    _titleLb.width = 160;
    _titleLb.top = 0;
    _titleLb.left = 0;
    }
    return _titleLb;
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
-(UILabel *)lineLb
{
    if (!_lineLb) {
    _lineLb = [UILabel new];
    _lineLb.height = 24;
    _lineLb.width = 160;
    _lineLb.top = 0;
    _lineLb.left = 0;
    }
    return _lineLb;
}
@end