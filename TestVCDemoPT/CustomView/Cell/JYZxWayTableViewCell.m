//
//  JYZxWayTableViewCell.m
//  TestVCDemoPT
//
//  Created by apple on 2019/3/4.
//  Copyright © 2019 wjy. All rights reserved.
//

#import "JYZxWayTableViewCell.h"
#import "UILabel+JYStyle.h"

@interface JYZxWayTableViewCell()
@property(nonatomic,strong)UILabel *zxWayLb;
@property(nonatomic,strong)UILabel *infoLb;
@property(nonatomic,strong)UIImageView *imgV;
@end


@implementation JYZxWayTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.zxWayLb];
       [self.contentView addSubview:self.infoLb];
       [self.contentView addSubview:self.imgV];
    }
    return self;
}

-(UILabel *)zxWayLb
{
    if (!_zxWayLb) {
        _zxWayLb = [UILabel newLabel];
        _zxWayLb.font = [UIFont systemFontOfSize:12];
        _zxWayLb.textColor = UIColorFromRGB(0x525252);
        _zxWayLb.height = 20;
        _zxWayLb.top = 15;
        _zxWayLb.width = 100;
        _zxWayLb.left = 53;
    }
    return _zxWayLb;
}

-(UILabel *)infoLb
{
    if (!_infoLb) {
        _infoLb = [UILabel newLabel];
        _infoLb.font = [UIFont systemFontOfSize:12];
        _infoLb.textColor = UIColorFromRGB(0x525252);
        _infoLb.height = 20;
        _infoLb.top = 15;
        _infoLb.width = 160;
        _infoLb.textAlignment = NSTextAlignmentRight;
        _infoLb.left = UIScreenWidth - 15 - _infoLb.width;
    }
    return _infoLb;
}

-(UIImageView *)imgV
{
    if (!_imgV) {
        _imgV = [UIImageView new];
        _imgV.width = 30;
        _imgV.height = 30;
        _imgV.top = 10;
        _imgV.left = 17.5;
    }
    return _imgV;
}

-(void)refresh:(NSDictionary *)dic
{
    _imgV.image = [UIImage imageNamed:dic[@"img"]];
    _zxWayLb.text = dic[@"title"];
    _infoLb.text = dic[@"info"];
    [self setNeedsLayout];
}

@end
