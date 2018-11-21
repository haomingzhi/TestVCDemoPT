//
    //  TitleSwitchViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    
#import "JYTitleSwitchTableViewCell.h"
    
@interface JYTitleSwitchTableViewCell()
@property(nonatomic,strong)UILabel *titleLb;
@property(nonatomic,strong)UIButton *btn;
@end
@implementation JYTitleSwitchTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    [self.contentView addSubview:self.titleLb];
    [self.contentView addSubview:self.btn];
    }
    return self;
}
-(void)refresh:(NSDictionary *)dic
{
    self.titleLb.text = dic[@"titleLb"];
[self.btn setTitle:dic[@"title"] forState:UIControlStateNormal];
    [self setNeedsLayout];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
       _titleLb.height = 24;
    _titleLb.width = 160;
    _titleLb.top = 0;
    _titleLb.left = 0;

    _btn.height = 24;
    _btn.width = 160;
    _btn.top = 0;
    _btn.left = 0;

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
-(UIButton *)btn
{
    if (!_btn) {
    _btn = [UIButton new];
    _btn.height = 24;
    _btn.width = 160;
    _btn.top = 0;
    _btn.left = 0;
    }
    return _btn;
}
@end