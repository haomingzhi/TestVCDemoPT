//
    //  MsgCenterViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    
#import "JYMsgCenterTableViewCell.h"
    
@interface JYMsgCenterTableViewCell()
@property(nonatomic,strong)UIImageView *imgV;
@property(nonatomic,strong)UILabel *titleLb;
@property(nonatomic,strong)UILabel *detailLb;
@property(nonatomic,strong)UILabel *markLb;
@end
@implementation JYMsgCenterTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    [self.contentView addSubview:self.imgV];
    [self.contentView addSubview:self.titleLb];
    [self.contentView addSubview:self.detailLb];
    [self.contentView addSubview:self.markLb];
    }
    return self;
}
-(void)refresh:(NSDictionary *)dic
{
    self.imgV.image = [UIImage imageNamed:dic[@"img"]];
self.titleLb.text = dic[@"titleLb"];
self.detailLb.text = dic[@"detailLb"];
self.markLb.text = dic[@"markLb"];
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

    _detailLb.height = 24;
    _detailLb.width = 160;
    _detailLb.top = 0;
    _detailLb.left = 0;

    _markLb.height = 24;
    _markLb.width = 160;
    _markLb.top = 0;
    _markLb.left = 0;

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
-(UILabel *)detailLb
{
    if (!_detailLb) {
    _detailLb = [UILabel new];
    _detailLb.height = 24;
    _detailLb.width = 160;
    _detailLb.top = 0;
    _detailLb.left = 0;
    }
    return _detailLb;
}
-(UILabel *)markLb
{
    if (!_markLb) {
    _markLb = [UILabel new];
    _markLb.height = 24;
    _markLb.width = 160;
    _markLb.top = 0;
    _markLb.left = 0;
    }
    return _markLb;
}
@end