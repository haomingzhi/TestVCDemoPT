//
    //  TeacherDonViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    
#import "JYTeacherDonTableViewCell.h"
    
@interface JYTeacherDonTableViewCell()
@property(nonatomic,strong)UIView *backgroundView;
@property(nonatomic,strong)UIImageView *imgV;
@property(nonatomic,strong)UILabel *nameLb;
@property(nonatomic,strong)UILabel *subjectLb;
@property(nonatomic,strong)UILabel *schoolLb;
@property(nonatomic,strong)UILabel *levelLb;
@property(nonatomic,strong)UILabel *demoLb;
@property(nonatomic,strong)UILabel *countLb;
@end
@implementation JYTeacherDonTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    [self.contentView addSubview:self.backgroundView];
    [self.contentView addSubview:self.imgV];
    [self.contentView addSubview:self.nameLb];
    [self.contentView addSubview:self.subjectLb];
    [self.contentView addSubview:self.schoolLb];
    [self.contentView addSubview:self.levelLb];
    [self.contentView addSubview:self.demoLb];
    [self.contentView addSubview:self.countLb];
    }
    return self;
}
-(void)refresh:(NSDictionary *)dic
{
    
self.imgV.image = [UIImage imageNamed:dic[@"img"]];
self.nameLb.text = dic[@"nameLb"];
self.subjectLb.text = dic[@"subjectLb"];
self.schoolLb.text = dic[@"schoolLb"];
self.levelLb.text = dic[@"levelLb"];
self.demoLb.text = dic[@"demoLb"];
self.countLb.text = dic[@"countLb"];
    [self setNeedsLayout];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
       _backgroundView.height = 24;
    _backgroundView.width = 160;
    _backgroundView.top = 0;
    _backgroundView.left = 0;

    _imgV.height = 24;
    _imgV.width = 160;
    _imgV.top = 0;
    _imgV.left = 0;

    _nameLb.height = 24;
    _nameLb.width = 160;
    _nameLb.top = 0;
    _nameLb.left = 0;

    _subjectLb.height = 24;
    _subjectLb.width = 160;
    _subjectLb.top = 0;
    _subjectLb.left = 0;

    _schoolLb.height = 24;
    _schoolLb.width = 160;
    _schoolLb.top = 0;
    _schoolLb.left = 0;

    _levelLb.height = 24;
    _levelLb.width = 160;
    _levelLb.top = 0;
    _levelLb.left = 0;

    _demoLb.height = 24;
    _demoLb.width = 160;
    _demoLb.top = 0;
    _demoLb.left = 0;

    _countLb.height = 24;
    _countLb.width = 160;
    _countLb.top = 0;
    _countLb.left = 0;

}
-(UIView *)backgroundView
{
    if (!_backgroundView) {
    _backgroundView = [UIView new];
    _backgroundView.height = 24;
    _backgroundView.width = 160;
    _backgroundView.top = 0;
    _backgroundView.left = 0;
    }
    return _backgroundView;
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
-(UILabel *)subjectLb
{
    if (!_subjectLb) {
    _subjectLb = [UILabel new];
    _subjectLb.height = 24;
    _subjectLb.width = 160;
    _subjectLb.top = 0;
    _subjectLb.left = 0;
    }
    return _subjectLb;
}
-(UILabel *)schoolLb
{
    if (!_schoolLb) {
    _schoolLb = [UILabel new];
    _schoolLb.height = 24;
    _schoolLb.width = 160;
    _schoolLb.top = 0;
    _schoolLb.left = 0;
    }
    return _schoolLb;
}
-(UILabel *)levelLb
{
    if (!_levelLb) {
    _levelLb = [UILabel new];
    _levelLb.height = 24;
    _levelLb.width = 160;
    _levelLb.top = 0;
    _levelLb.left = 0;
    }
    return _levelLb;
}
-(UILabel *)demoLb
{
    if (!_demoLb) {
    _demoLb = [UILabel new];
    _demoLb.height = 24;
    _demoLb.width = 160;
    _demoLb.top = 0;
    _demoLb.left = 0;
    }
    return _demoLb;
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