//
//  JYTeacherListTableViewCell.m
//  TestVCDemoPT
//
//  Created by apple on 2019/3/5.
//  Copyright © 2019 wjy. All rights reserved.
//

#import "JYTeacherListTableViewCell.h"
#import "UILabel+JYStyle.h"
#import "UIView+JYLayerEdit.h"
#import "JYMarkView.h"
#import "UIImageView+WebCache.h"
@interface JYTeacherListTableViewCell()
@property(nonatomic,strong)UIImageView *imgV;
@property(nonatomic,strong)UILabel *nameLb;
@property(nonatomic,strong)JYMarkView *markV;
@property(nonatomic,strong)UILabel *jobLb;
@property(nonatomic,strong)UILabel *goodAtLb;
@property(nonatomic,strong)JYMarkView *infoMarkV;
@property(nonatomic,strong)UILabel *zxLb;
@property(nonatomic,strong)UIView *containerView;
@end

@implementation JYTeacherListTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.containerView];
        [self.containerView shadowColor:UIColorFromRGBA(0x000000, 1) shadowOffset:CGSizeMake(0, 0) shadowOpacity:0.1];
        [self.containerView addSubview:self.imgV];
        [self.containerView addSubview:self.nameLb];
        [self.containerView addSubview:self.markV];
        [self.containerView addSubview:self.jobLb];
        [self.containerView addSubview:self.goodAtLb];
        [self.containerView addSubview:self.infoMarkV];
        [self.containerView addSubview:self.zxLb];
    }
    return self;
}

-(UIView *)containerView
{
    if (!_containerView) {
        _containerView = [UIView new];
        _containerView.height = 160;
        _containerView.width = UIScreenWidth - 35;
        _containerView.left = 17.5;
        _containerView.top = 10;
        [_containerView allCorners:9];
        _containerView.backgroundColor = UIColorFromRGB(0xffffff);
    }
    return _containerView;
}

-(UIImageView *)imgV
{
    if (!_imgV) {
        _imgV = [UIImageView new];
        _imgV.height = 60;
        _imgV.width = 60;
        [_imgV allCorners:_imgV.width/2.0];
//        _imgV.backgroundColor = [UIColor yellowColor];
    }
    return _imgV;
}

-(UILabel *)nameLb
{
    if (!_nameLb) {
        _nameLb = [UILabel newTitleLb:@""];
        
    }
    return _nameLb;
}

-(UILabel *)jobLb
{
    if (!_jobLb) {
        _jobLb = [UILabel newTeacherInfoLabel:@""];
        
    }
    return _jobLb;
}

-(UILabel *)goodAtLb
{
    if (!_goodAtLb) {
        _goodAtLb = [UILabel newTeacherGoodAtLabel:@""];
    }
    return _goodAtLb;
}

-(UILabel *)zxLb
{
    if (!_zxLb) {
        _zxLb = [UILabel newTeacherZxLabel:@""];
    }
    return _zxLb;
}

-(JYMarkView *)markV
{
    if (!_markV) {
        _markV = [JYMarkView newMarkView:0];
        
    }
    return _markV;
}

-(JYMarkView *)infoMarkV
{
    if (!_infoMarkV) {
        _infoMarkV = [JYMarkView newMarkView:1];
    }
    return _infoMarkV;
}

-(void)refresh:(NSDictionary *)dic
{
//    self.imgV.image = [UIImage imageNamed:dic[@"img"]];
    _imgV.contentMode = UIViewContentModeCenter;
    __weak typeof(self) weak_self = self;
    [self.imgV sd_setImageWithURL:[NSURL URLWithString:dic[@"img"]] placeholderImage:[UIImage imageNamed:@""] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        if (image) {
            weak_self.imgV.contentMode = UIViewContentModeScaleToFill;
        }
        
    }];
    self.nameLb.text = dic[@"name"];
    [self.nameLb resetSize];
    self.markV.titleArr = dic[@"mark"];
    self.infoMarkV.titleArr = dic[@"infoMark"];
    self.jobLb.text = dic[@"job"];
    self.goodAtLb.text = dic[@"goodAt"];
    self.zxLb.text = dic[@"zx"];
    
    [self setNeedsLayout];
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    _imgV.left = 15;
    _imgV.top = 20;
    
    _nameLb.left = 15 + _imgV.left + _imgV.width;
    _nameLb.top = 20;
    
    _markV.left = _nameLb.left + _nameLb.width + 5;
    _markV.top = 18;
    
    _jobLb.left = _nameLb.left;
    _jobLb.top = _nameLb.height + _nameLb.top + 3;
    
    _goodAtLb.left = _nameLb.left;
    _goodAtLb.top = _jobLb.height + _jobLb.top + 3;
    
    _infoMarkV.left = _nameLb.left;
    _infoMarkV.top = _goodAtLb.top + _goodAtLb.height + 10;
    
    _zxLb.top = self.containerView.height - 20 - _zxLb.height;
    _zxLb.left = _nameLb.left;
}
@end
