//
    //  DirctViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    
#import "JYDirctTableViewCell.h"
    
@interface JYDirctTableViewCell()
@property(nonatomic,strong)UILabel *typeLb;
@property(nonatomic,strong)UILabel *titleLb;
@property(nonatomic,strong)UIButton *btn;
@end
@implementation JYDirctTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    [self.contentView addSubview:self.typeLb];
    [self.contentView addSubview:self.titleLb];
    [self.contentView addSubview:self.btn];
    }
    return self;
}
-(void)refresh:(NSDictionary *)dic
{
    self.typeLb.text = dic[@"type"];
self.titleLb.text = dic[@"title"];
//[self.btn setTitle:dic[@"title"] forState:UIControlStateNormal];
    [self setNeedsLayout];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
   
    _typeLb.centerY = self.height/2.0;
    _typeLb.left = 15;


    _titleLb.centerY = self.height/2.0;
    _titleLb.left = 16 + _typeLb.left + _typeLb.width;


    _btn.centerY = self.height/2.0;
    _btn.left = UIScreenWidth - 10 - _btn.width;

}
-(UILabel *)typeLb
{
    if (!_typeLb) {
    _typeLb = [UILabel new];
    _typeLb.height = 23;
    _typeLb.width = 41;
        _typeLb.textAlignment = NSTextAlignmentCenter;
        _typeLb.backgroundColor = UIColorFromRGB(0xb4acf7);
        _typeLb.textColor = UIColorFromRGB(0xffffff);
        _typeLb.font = [UIFont systemFontOfSize:13];
    _typeLb.top = 0;
    _typeLb.left = 0;
    }
    return _typeLb;
}
-(UILabel *)titleLb
{
    if (!_titleLb) {
    _titleLb = [UILabel new];
    _titleLb.height = 16;
    _titleLb.width = UIScreenWidth - 30 - 30;
        _titleLb.font = [UIFont systemFontOfSize:15];
        _titleLb.textColor = UIColorFromRGB(0x222222);
    _titleLb.top = 0;
    _titleLb.left = 0;
    }
    return _titleLb;
}
-(UIButton *)btn
{
    if (!_btn) {
    _btn = [UIButton new];
    _btn.height = 30;
    _btn.width = 30;
        [_btn setImage:[UIImage imageNamed:@"锁"] forState:UIControlStateNormal];
    _btn.top = 0;
    _btn.left = 0;
    }
    return _btn;
}
@end
