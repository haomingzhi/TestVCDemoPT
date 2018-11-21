//
    //  PayViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    
#import "JYPayTableViewCell.h"
    
@interface JYPayTableViewCell()
@property(nonatomic,strong)UIImageView *imgV;
@property(nonatomic,strong)UILabel *titleLb;
@property(nonatomic,strong)UIImageView *checkImgV;
@end
@implementation JYPayTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    [self.contentView addSubview:self.imgV];
    [self.contentView addSubview:self.titleLb];
    [self.contentView addSubview:self.checkImgV];
    }
    return self;
}
-(void)refresh:(NSDictionary *)dic
{
    self.imgV.image = [UIImage imageNamed:dic[@"img"]];
self.titleLb.text = dic[@"titleLb"];
self.checkImgV.image = [UIImage imageNamed:dic[@"img"]];
    [self setNeedsLayout];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
       _imgV.height = 24;
    _imgV.width = 160;
    _imgV.top = 0;
    _imgV.left = 0;

    _titleLb.height = 24;
    _titleLb.width = 160;
    _titleLb.top = 0;
    _titleLb.left = 0;

    _checkImgV.height = 24;
    _checkImgV.width = 160;
    _checkImgV.top = 0;
    _checkImgV.left = 0;

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
-(UIImageView *)checkImgV
{
    if (!_checkImgV) {
    _checkImgV = [UIImageView new];
    _checkImgV.height = 24;
    _checkImgV.width = 160;
    _checkImgV.top = 0;
    _checkImgV.left = 0;
    }
    return _checkImgV;
}
@end