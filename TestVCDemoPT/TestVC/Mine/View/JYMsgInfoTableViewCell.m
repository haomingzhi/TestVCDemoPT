//
    //  MsgInfoViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    
#import "JYMsgInfoTableViewCell.h"
    
@interface JYMsgInfoTableViewCell()
@property(nonatomic,strong)UILabel *titleLb;
@property(nonatomic,strong)UILabel *timeLb;
@property(nonatomic,strong)UILabel *detailLb;
@end
@implementation JYMsgInfoTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    [self.contentView addSubview:self.titleLb];
    [self.contentView addSubview:self.timeLb];
    [self.contentView addSubview:self.detailLb];
    }
    return self;
}
-(void)refresh:(NSDictionary *)dic
{
    self.titleLb.text = dic[@"titleLb"];
self.timeLb.text = dic[@"timeLb"];
self.detailLb.text = dic[@"detailLb"];
    [self setNeedsLayout];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
       _titleLb.height = 24;
    _titleLb.width = 160;
    _titleLb.top = 0;
    _titleLb.left = 0;

    _timeLb.height = 24;
    _timeLb.width = 160;
    _timeLb.top = 0;
    _timeLb.left = 0;

    _detailLb.height = 24;
    _detailLb.width = 160;
    _detailLb.top = 0;
    _detailLb.left = 0;

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
-(UILabel *)timeLb
{
    if (!_timeLb) {
    _timeLb = [UILabel new];
    _timeLb.height = 24;
    _timeLb.width = 160;
    _timeLb.top = 0;
    _timeLb.left = 0;
    }
    return _timeLb;
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
@end