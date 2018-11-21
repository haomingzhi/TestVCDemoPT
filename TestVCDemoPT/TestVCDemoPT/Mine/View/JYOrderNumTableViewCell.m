//
    //  OrderNumViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    

#import "JYOrderNumTableViewCell.h"
//#import "UIView+NTES.h"

@interface JYOrderNumTableViewCell()
@property(nonatomic,strong)UILabel *orderNumLb;

@property(nonatomic,strong)UILabel *tipLb;
@end

@implementation JYOrderNumTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    [self.contentView addSubview:self.orderNumLb];
    [self.contentView addSubview:self.tipLb];
    }
    return self;
}

-(void)refresh:(NSDictionary *)dic
{
    self.orderNumLb.text = dic[@"orderNum"];

self.tipLb.text = dic[@"tip"];
    [self setNeedsLayout];
}

-(void)layoutSubviews
{
    [super layoutSubviews];

    _orderNumLb.top = 5;
    _orderNumLb.left = 15;



    _tipLb.top = 5;
    _tipLb.left = UIScreenWidth - 15 - _tipLb.width;

}

-(UILabel *)orderNumLb
{
    if (!_orderNumLb) {
    _orderNumLb = [UILabel new];
    _orderNumLb.height = 24;
    _orderNumLb.width = 190;
    _orderNumLb.top = 0;
    _orderNumLb.left = 0;
        _orderNumLb.textColor = UIColorFromRGB(0x666666);
        _orderNumLb.font = [UIFont systemFontOfSize:12];
    }
    return _orderNumLb;
}

-(UILabel *)tipLb
{
    if (!_tipLb) {
    _tipLb = [UILabel new];
    _tipLb.height = 24;
    _tipLb.width = 160;
        _tipLb.textAlignment = NSTextAlignmentRight;
    _tipLb.top = 0;
    _tipLb.left = 0;
        _tipLb.textColor = UIColorFromRGB(0xF93948);
        _tipLb.font = [UIFont systemFontOfSize:12];
    }
    return _tipLb;
}
@end
