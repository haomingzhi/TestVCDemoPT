//
    //  FreeClassViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    
#import "JYFreeClassTableViewCell.h"
    
@interface JYFreeClassTableViewCell()
@property(nonatomic,strong)UIImageView *imgV;
@property(nonatomic,strong)UIImageView *markImgV;
@property(nonatomic,strong)UILabel *titleLb;
@property(nonatomic,strong)UILabel *nameLb;
@property(nonatomic,strong)UILabel *countLb;
@end
@implementation JYFreeClassTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    [self.contentView addSubview:self.imgV];
    [self.contentView addSubview:self.markImgV];
    [self.contentView addSubview:self.titleLb];
    [self.contentView addSubview:self.nameLb];
    [self.contentView addSubview:self.countLb];
    }
    return self;
}
-(void)refresh:(NSDictionary *)dic
{
    self.imgV.image = [UIImage imageNamed:dic[@"img"]];
self.markImgV.image = [UIImage imageNamed:dic[@"img"]];
self.titleLb.text = dic[@"titleLb"];
self.nameLb.text = dic[@"nameLb"];
self.countLb.text = dic[@"countLb"];
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
@end