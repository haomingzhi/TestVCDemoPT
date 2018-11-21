//
    //  ClassReadBarViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    
#import "JYClassReadBarTableViewCell.h"
    
@interface JYClassReadBarTableViewCell()
@property(nonatomic,strong)UIButton *aBtn;
@property(nonatomic,strong)UIButton *bBtn;
@end
@implementation JYClassReadBarTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    [self.contentView addSubview:self.aBtn];
    [self.contentView addSubview:self.bBtn];
    }
    return self;
}
-(void)refresh:(NSDictionary *)dic
{
    [self.aBtn setTitle:dic[@"title"] forState:UIControlStateNormal];
[self.bBtn setTitle:dic[@"title"] forState:UIControlStateNormal];
    [self setNeedsLayout];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
       _aBtn.height = 24;
    _aBtn.width = 160;
    _aBtn.top = 0;
    _aBtn.left = 0;

    _bBtn.height = 24;
    _bBtn.width = 160;
    _bBtn.top = 0;
    _bBtn.left = 0;

}
-(UIButton *)aBtn
{
    if (!_aBtn) {
    _aBtn = [UIButton new];
    _aBtn.height = 24;
    _aBtn.width = 160;
    _aBtn.top = 0;
    _aBtn.left = 0;
    }
    return _aBtn;
}
-(UIButton *)bBtn
{
    if (!_bBtn) {
    _bBtn = [UIButton new];
    _bBtn.height = 24;
    _bBtn.width = 160;
    _bBtn.top = 0;
    _bBtn.left = 0;
    }
    return _bBtn;
}
@end