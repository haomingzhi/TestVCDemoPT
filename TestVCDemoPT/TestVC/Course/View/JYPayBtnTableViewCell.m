//
    //  PayBtnViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    
#import "JYPayBtnTableViewCell.h"
    
@interface JYPayBtnTableViewCell()
@property(nonatomic,strong)UIButton *btn;
@end
@implementation JYPayBtnTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    [self.contentView addSubview:self.btn];
    }
    return self;
}
-(void)refresh:(NSDictionary *)dic
{
    [self.btn setTitle:dic[@"title"] forState:UIControlStateNormal];
    [self setNeedsLayout];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
       _btn.height = 24;
    _btn.width = 160;
    _btn.top = 0;
    _btn.left = 0;

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