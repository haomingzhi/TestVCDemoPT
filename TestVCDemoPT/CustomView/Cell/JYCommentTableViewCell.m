//
//  JYCommentTableViewCell.m
//  TestVCDemoPT
//
//  Created by apple on 2019/3/4.
//  Copyright © 2019 wjy. All rights reserved.
//

#import "JYCommentTableViewCell.h"
#import "UILabel+JYStyle.h"
#import "JYPointView.h"
#import "UIView+JYLayerEdit.h"
@interface JYCommentTableViewCell()
@property(nonatomic,strong)UIImageView *imgV;
@property(nonatomic,strong)UILabel *nameLb;
@property(nonatomic,strong)JYPointView *pointView;
@property(nonatomic,strong)UILabel *contentLb;
@property(nonatomic,strong)UILabel *timeLb;
@property(nonatomic,strong)UILabel *lineLb;
@end

@implementation JYCommentTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.imgV];
          [self.contentView addSubview:self.nameLb];
          [self.contentView addSubview:self.pointView];
          [self.contentView addSubview:self.contentLb];
          [self.contentView addSubview:self.timeLb];
        [self.contentView addSubview:self.lineLb];
    }
    return self;
}

-(UILabel *)lineLb
{
    if (!_lineLb) {
        _lineLb = [UILabel newHLineLb];
        _lineLb.width = UIScreenWidth - 35;
        _lineLb.left = 17.5;
    }
    return _lineLb;
}

-(UIImageView *)imgV
{
    if (!_imgV) {
        _imgV = [UIImageView new];
        _imgV.width = 30;
        _imgV.height = 30;
        [_imgV allCorners:_imgV.height];
        _imgV.left = 17.5;
        _imgV.top = 15;
        _imgV.backgroundColor = [UIColor redColor];
    }
    return _imgV;
}

-(UILabel *)nameLb
{
    if (!_nameLb) {
        _nameLb = [UILabel newLabel];
        _nameLb.width = 140;
        _nameLb.height = 30;
        _nameLb.font = [UIFont systemFontOfSize:12];
        _nameLb.textColor = UIColorFromRGB(0x999999);
        _nameLb.top = 15;
        _nameLb.left = 55;
    }
    return _nameLb;
}

-(JYPointView *)pointView
{
    if (!_pointView) {
        _pointView = [JYPointView new];
        _pointView.top = 22;
        _pointView.left = UIScreenWidth - 19 - _pointView.width;
    }
    return _pointView;
}

-(UILabel *)contentLb
{
    if (!_contentLb) {
        _contentLb = [UILabel newLabel:UIColorFromRGB(0x333333) withFont:[UIFont systemFontOfSize:14]];
        _contentLb.left = 17.5;
        _contentLb.top = 57;
    }
    return _contentLb;
}

-(UILabel *)timeLb
{
    if (!_timeLb) {
        _timeLb = [UILabel newLabel];
        _timeLb.width = 130;
        _timeLb.height = 13;
        _timeLb.font = [UIFont systemFontOfSize:11];
        _timeLb.textColor = UIColorFromRGB(0x999999);
        _timeLb.left = 17.5;
        _timeLb.top = 5;
    }
    return _timeLb;
}

-(void)refresh:(NSDictionary *)dic
{
    self.imgV.image = [UIImage imageNamed:dic[@"name"]];
    self.pointView.point = [dic[@"point"] integerValue];
    self.contentLb.text = dic[@"title"];
    [self.contentLb resetSize];
    self.timeLb.text = dic[@"time"];
    self.nameLb.text = dic[@"name"];
    [self setNeedsLayout];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    _contentLb.left = 17.5;
    _contentLb.top = 57;
     _timeLb.top = 5 + _contentLb.height + _contentLb.top;
    _lineLb.top = self.height - _lineLb.height;
}

@end
