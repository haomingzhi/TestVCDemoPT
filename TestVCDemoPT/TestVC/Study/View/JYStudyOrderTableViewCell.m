//
    //  StudyOrderViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    
#import "JYStudyOrderTableViewCell.h"
    
@interface JYStudyOrderTableViewCell()
@property(nonatomic,strong)UIImageView *imgV;
@property(nonatomic,strong)UIImageView *markImgV;
@property(nonatomic,strong)UILabel *orderNumLb;
@property(nonatomic,strong)UILabel *titleLb;
@property(nonatomic,strong)UILabel *nameLb;
@property(nonatomic,strong)UILabel *countLb;
@property(nonatomic,strong)UILabel *priceLb;
@property(nonatomic,strong)UILabel *openTimeLb;
@property(nonatomic,strong)UILabel *adrLb;
@end
@implementation JYStudyOrderTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    [self.contentView addSubview:self.imgV];
    [self.contentView addSubview:self.markImgV];
    [self.contentView addSubview:self.orderNumLb];
    [self.contentView addSubview:self.titleLb];
    [self.contentView addSubview:self.nameLb];
    [self.contentView addSubview:self.countLb];
    [self.contentView addSubview:self.priceLb];
    [self.contentView addSubview:self.openTimeLb];
    [self.contentView addSubview:self.adrLb];
    }
    return self;
}
-(void)refresh:(NSDictionary *)dic
{
    self.imgV.image = [UIImage imageNamed:dic[@"img"]];
self.markImgV.image = [UIImage imageNamed:dic[@"img"]];
self.orderNumLb.text = dic[@"orderNumLb"];
self.titleLb.text = dic[@"titleLb"];
self.nameLb.text = dic[@"nameLb"];
self.countLb.text = dic[@"countLb"];
self.priceLb.text = dic[@"priceLb"];
self.openTimeLb.text = dic[@"openTimeLb"];
self.adrLb.text = dic[@"adrLb"];
    [self setNeedsLayout];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
       _imgV.height = 24;
    _imgV.width = 160;
    _imgV.top = 0;
    _imgV.left = 0;

    _markImgV.height = 24;
    _markImgV.width = 160;
    _markImgV.top = 0;
    _markImgV.left = 0;

    _orderNumLb.height = 24;
    _orderNumLb.width = 160;
    _orderNumLb.top = 0;
    _orderNumLb.left = 0;

    _titleLb.height = 24;
    _titleLb.width = 160;
    _titleLb.top = 0;
    _titleLb.left = 0;

    _nameLb.height = 24;
    _nameLb.width = 160;
    _nameLb.top = 0;
    _nameLb.left = 0;

    _countLb.height = 24;
    _countLb.width = 160;
    _countLb.top = 0;
    _countLb.left = 0;

    _priceLb.height = 24;
    _priceLb.width = 160;
    _priceLb.top = 0;
    _priceLb.left = 0;

    _openTimeLb.height = 24;
    _openTimeLb.width = 160;
    _openTimeLb.top = 0;
    _openTimeLb.left = 0;

    _adrLb.height = 24;
    _adrLb.width = 160;
    _adrLb.top = 0;
    _adrLb.left = 0;

}
-(UIImageView *)imgV
{
    if (!_imgV) {
    _imgV = [UIImageView new];
    _imgV.height = 24;
    _imgV.width = 160;
    _imgV.top = 0;
    _imgV.left = 0;
    }
    return _imgV;
}
-(UIImageView *)markImgV
{
    if (!_markImgV) {
    _markImgV = [UIImageView new];
    _markImgV.height = 24;
    _markImgV.width = 160;
    _markImgV.top = 0;
    _markImgV.left = 0;
    }
    return _markImgV;
}
-(UILabel *)orderNumLb
{
    if (!_orderNumLb) {
    _orderNumLb = [UILabel new];
    _orderNumLb.height = 24;
    _orderNumLb.width = 160;
    _orderNumLb.top = 0;
    _orderNumLb.left = 0;
    }
    return _orderNumLb;
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
-(UILabel *)nameLb
{
    if (!_nameLb) {
    _nameLb = [UILabel new];
    _nameLb.height = 24;
    _nameLb.width = 160;
    _nameLb.top = 0;
    _nameLb.left = 0;
    }
    return _nameLb;
}
-(UILabel *)countLb
{
    if (!_countLb) {
    _countLb = [UILabel new];
    _countLb.height = 24;
    _countLb.width = 160;
    _countLb.top = 0;
    _countLb.left = 0;
    }
    return _countLb;
}
-(UILabel *)priceLb
{
    if (!_priceLb) {
    _priceLb = [UILabel new];
    _priceLb.height = 24;
    _priceLb.width = 160;
    _priceLb.top = 0;
    _priceLb.left = 0;
    }
    return _priceLb;
}
-(UILabel *)openTimeLb
{
    if (!_openTimeLb) {
    _openTimeLb = [UILabel new];
    _openTimeLb.height = 24;
    _openTimeLb.width = 160;
    _openTimeLb.top = 0;
    _openTimeLb.left = 0;
    }
    return _openTimeLb;
}
-(UILabel *)adrLb
{
    if (!_adrLb) {
    _adrLb = [UILabel new];
    _adrLb.height = 24;
    _adrLb.width = 160;
    _adrLb.top = 0;
    _adrLb.left = 0;
    }
    return _adrLb;
}
@end