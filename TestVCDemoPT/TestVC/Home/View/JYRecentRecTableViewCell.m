//
    //  RecentRecViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    
#import "JYRecentRecTableViewCell.h"
    
@interface JYRecentRecTableViewCell()
@property(nonatomic,strong)UIImageView *imgV;
@property(nonatomic,strong)UILabel *adrLb;
@property(nonatomic,strong)UILabel *titleLb;
@property(nonatomic,strong)UILabel *posLb;
@property(nonatomic,strong)UILabel *priceLb;
@property(nonatomic,strong)UILabel *oldPriceLb;
@end
@implementation JYRecentRecTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    [self.contentView addSubview:self.imgV];
    [self.contentView addSubview:self.adrLb];
    [self.contentView addSubview:self.titleLb];
    [self.contentView addSubview:self.posLb];
    [self.contentView addSubview:self.priceLb];
    [self.contentView addSubview:self.oldPriceLb];
    }
    return self;
}
-(void)refresh:(NSDictionary *)dic
{
    self.imgV.image = [UIImage imageNamed:dic[@"img"]];
self.adrLb.text = dic[@"adrLb"];
self.titleLb.text = dic[@"titleLb"];
self.posLb.text = dic[@"posLb"];
self.priceLb.text = dic[@"priceLb"];
self.oldPriceLb.text = dic[@"oldPriceLb"];
    [self setNeedsLayout];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
       _imgV.height = 24;
    _imgV.width = 160;
    _imgV.top = 0;
    _imgV.left = 0;

    _adrLb.height = 24;
    _adrLb.width = 160;
    _adrLb.top = 0;
    _adrLb.left = 0;

    _titleLb.height = 24;
    _titleLb.width = 160;
    _titleLb.top = 0;
    _titleLb.left = 0;

    _posLb.height = 24;
    _posLb.width = 160;
    _posLb.top = 0;
    _posLb.left = 0;

    _priceLb.height = 24;
    _priceLb.width = 160;
    _priceLb.top = 0;
    _priceLb.left = 0;

    _oldPriceLb.height = 24;
    _oldPriceLb.width = 160;
    _oldPriceLb.top = 0;
    _oldPriceLb.left = 0;

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
-(UILabel *)posLb
{
    if (!_posLb) {
    _posLb = [UILabel new];
    _posLb.height = 24;
    _posLb.width = 160;
    _posLb.top = 0;
    _posLb.left = 0;
    }
    return _posLb;
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
-(UILabel *)oldPriceLb
{
    if (!_oldPriceLb) {
    _oldPriceLb = [UILabel new];
    _oldPriceLb.height = 24;
    _oldPriceLb.width = 160;
    _oldPriceLb.top = 0;
    _oldPriceLb.left = 0;
    }
    return _oldPriceLb;
}
@end