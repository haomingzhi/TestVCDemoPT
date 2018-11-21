//
    //  CodeViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    
#import "JYCodeTableViewCell.h"
    
@interface JYCodeTableViewCell()
@property(nonatomic,strong)UILabel *titleLb;
@property(nonatomic,strong)UIButton *codeBtn;
@end
@implementation JYCodeTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    [self.contentView addSubview:self.titleLb];
    [self.contentView addSubview:self.codeBtn];
    }
    return self;
}
-(void)refresh:(NSDictionary *)dic
{
    self.titleLb.text = dic[@"titleLb"];
[self.codeBtn setTitle:dic[@"title"] forState:UIControlStateNormal];
    [self setNeedsLayout];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
       _titleLb.height = 24;
    _titleLb.width = 160;
    _titleLb.top = 0;
    _titleLb.left = 0;

    _codeBtn.height = 24;
    _codeBtn.width = 160;
    _codeBtn.top = 0;
    _codeBtn.left = 0;

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
-(UIButton *)codeBtn
{
    if (!_codeBtn) {
    _codeBtn = [UIButton new];
    _codeBtn.height = 24;
    _codeBtn.width = 160;
    _codeBtn.top = 0;
    _codeBtn.left = 0;
    }
    return _codeBtn;
}
@end