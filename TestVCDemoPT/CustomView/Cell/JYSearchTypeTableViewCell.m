//
//  JYSearchTypeTableViewCell.m
//  TestVCDemoPT
//
//  Created by apple on 2019/3/5.
//  Copyright © 2019 wjy. All rights reserved.
//

#import "JYSearchTypeTableViewCell.h"
#import "UILabel+JYStyle.h"
#import "UIView+JYLayerEdit.h"
#import "UIButton+JYStyle.h"

@interface JYSearchTypeTableViewCell()
@property(nonatomic,strong)UIView *containerView;
@property(nonatomic,strong)UIImageView *imgV;
@property(nonatomic,strong)UIImageView *arrowImgV;
@property(nonatomic,strong)UILabel *typeLb;
@property(nonatomic,strong)UILabel *leveLb;
@end
@implementation JYSearchTypeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.containerView];
        [self.containerView shadowColor:UIColorFromRGBA(0x000000, 0.1)];
        [self.containerView addSubview:self.imgV];
        [self.containerView addSubview:self.arrowImgV];
        [self.containerView addSubview:self.typeLb];
            [self.containerView addSubview:self.leveLb];
    }
    return self;
}

-(UIView*)containerView
{
    if (!_containerView) {
        _containerView = [UIView new];
        _containerView.width = UIScreenWidth - 35;
        _containerView.left = 17.5;
        _containerView.height = 80;
        _containerView.top = 7.5;
        [_containerView allCorners:9];
        _containerView.backgroundColor = UIColorFromRGB(0xffffff);
    }
    return _containerView;
}

-(UIImageView*)imgV
{
    if (!_imgV) {
        _imgV = [UIImageView new];
        _imgV.height = 47;
        _imgV.width = 47;
        _imgV.backgroundColor = [UIColor purpleColor];
    }
    return _imgV;
}

-(UIImageView *)arrowImgV
{
    if (!_arrowImgV) {
        _arrowImgV = [UIImageView new];
        _arrowImgV.width = 7;
        _arrowImgV.height = 11;
        _arrowImgV.image = [UIImage imageNamed:@"查看更多箭头"];
    }
    return _arrowImgV;
}

-(UILabel *)typeLb
{
    if (!_typeLb) {
        _typeLb = [UILabel newTitleLb:@""];
        _typeLb.font = [UIFont systemFontOfSize:15];
        _typeLb.width = 260;
        _typeLb.height = 17;
    }
    return _typeLb;
}

-(UILabel *)leveLb
{
    if (!_leveLb) {
        _leveLb = [UILabel newLabel];
        _leveLb.font = [UIFont systemFontOfSize:12];
        _leveLb.textColor = UIColorFromRGB(0x525252);
        _leveLb.width = 260;
        _leveLb.height = 14;
    }
    return _leveLb;
}

-(void)refresh:(NSDictionary *)dic
{
    _imgV.image = [UIImage imageNamed:dic[@"img"]];
    _typeLb.text = dic[@"title"];
    _leveLb.text = dic[@"level"];
    [self setNeedsLayout];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    _imgV.left = 15.5;
    _imgV.top = 16.5;
    
    _typeLb.left = 10.5 + _imgV.width + _imgV.left;
    _typeLb.top = 20;
    
    _leveLb.top = 5 + _typeLb.top + _typeLb.height;
    _leveLb.left = _typeLb.left;
    
    _arrowImgV.left = self.containerView.width - 15.5 - _arrowImgV.width;
    _arrowImgV.top = self.containerView.height/2.0 - self.arrowImgV.height/2.0;
}

@end
