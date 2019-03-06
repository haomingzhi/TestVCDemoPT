//
//  JYGoodAtTableViewCell.m
//  TestVCDemoPT
//
//  Created by apple on 2019/3/4.
//  Copyright © 2019 wjy. All rights reserved.
//

#import "JYGoodAtTableViewCell.h"
#import "UILabel+JYStyle.h"

@interface JYGoodAtTableViewCell()
@property(nonatomic,strong)UILabel *goodAtLb;
@property(nonatomic,strong)UILabel *lineLb;
@end

@implementation JYGoodAtTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.goodAtLb];
        [self.contentView addSubview:self.lineLb];
    }
    return self;
}
-(UILabel *)lineLb
{
    if (!_lineLb) {
        _lineLb = [UILabel newHLineLb];
        _lineLb.width = UIScreenWidth - 35;
        _lineLb.left = 17.5;
    }
    return _lineLb;
}
-(UILabel *)goodAtLb
{
    if (!_goodAtLb) {
        _goodAtLb = [UILabel newLabel:UIColorFromRGB(0x333333) withFont:[UIFont boldSystemFontOfSize:12]];
        _goodAtLb.numberOfLines = 1;
        _goodAtLb.left = 17.5;
        _goodAtLb.top = 11;
    }
    return _goodAtLb;
}

-(void)refresh:(NSDictionary *)dic
{
    _goodAtLb.text = dic[@"title"];
    [_goodAtLb resetSize];
    if ([dic[@"hiddenLine"] boolValue]) {
        _lineLb.hidden = YES;
    }
    else
    {
        _lineLb.hidden = NO;
    }
    [self setNeedsLayout];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
      _goodAtLb.top = 11;
    _lineLb.top = self.height - _lineLb.height;
}

@end
