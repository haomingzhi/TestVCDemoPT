//
    //  OrderInfoViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    

#import "JYOrderInfoTableViewCell.h"
//#import "UIView+NTES.h"

@interface JYOrderInfoTableViewCell()
@property(nonatomic,strong)UIImageView *imgV;

@property(nonatomic,strong)UILabel *titleLb;

@property(nonatomic,strong)UILabel *nameLb;

@property(nonatomic,strong)UILabel *priceLb;
@property(nonatomic,strong)UILabel *lineLb;
@end

@implementation JYOrderInfoTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    [self.contentView addSubview:self.imgV];
    [self.contentView addSubview:self.titleLb];
    [self.contentView addSubview:self.nameLb];
    [self.contentView addSubview:self.priceLb];
        [self.contentView addSubview:self.lineLb];
    }
    return self;
}

-(void)refresh:(NSDictionary *)dic
{
    self.imgV.image = [UIImage imageNamed:dic[@"img"]];

self.titleLb.text = dic[@"title"];

self.nameLb.text = dic[@"name"];

self.priceLb.text = dic[@"price"];
    [self setNeedsLayout];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
 
    _imgV.top = 1;
    _imgV.left = 15;


 
    _titleLb.top = _imgV.top;
    _titleLb.left = 16 + _imgV.width + _imgV.left;
    _titleLb.width = UIScreenWidth - _titleLb.left - 15;

 
    _nameLb.top = 12 + _titleLb.top + _titleLb.height;
    _nameLb.left = _titleLb.left;
     _nameLb.width = UIScreenWidth - _nameLb.left - 15;

    
    _priceLb.top = 23 + _nameLb.height + _nameLb.top;
    _priceLb.left = _titleLb.left;
     _priceLb.width = UIScreenWidth - _priceLb.left - 15;
    
    _lineLb.top = 95.5;
}

-(UIImageView *)imgV
{
    if (!_imgV) {
        _imgV = [UIImageView new];
        _imgV.height = 80;
        _imgV.width = 125;
        _imgV.top = 0;
        _imgV.left = 0;
    }
    return _imgV;
}

-(UILabel *)titleLb
{
    if (!_titleLb) {
    _titleLb = [UILabel new];
    _titleLb.height = 16;
    _titleLb.width = 190;
    _titleLb.top = 0;
    _titleLb.left = 0;
        _titleLb.font = [UIFont systemFontOfSize:15];
        _titleLb.textColor = UIColorFromRGB(0x222222);
    }
    return _titleLb;
}

-(UILabel *)nameLb
{
    if (!_nameLb) {
    _nameLb = [UILabel new];
    _nameLb.height = 14;
    _nameLb.width = 160;
    _nameLb.top = 0;
    _nameLb.left = 0;
    _nameLb.font = [UIFont systemFontOfSize:13];
     _nameLb.textColor = UIColorFromRGB(0x666666);
    }
    return _nameLb;
}

-(UILabel *)priceLb
{
    if (!_priceLb) {
    _priceLb = [UILabel new];
    _priceLb.height = 17;
    _priceLb.width = 190;
    _priceLb.top = 0;
    _priceLb.left = 0;
    _priceLb.font = [UIFont systemFontOfSize:16];
         _priceLb.textColor = UIColorFromRGB(0xFC505D);
    }
    return _priceLb;
}

-(UILabel *)lineLb
{
    if (!_lineLb) {
        _lineLb = [UILabel new];
        _lineLb.height = 0.5;
        _lineLb.width = UIScreenWidth ;
        _lineLb.backgroundColor = UIColorFromRGB(0xDCDCDC);
        _lineLb.left = 0;
    }
    return _lineLb;
}
@end
