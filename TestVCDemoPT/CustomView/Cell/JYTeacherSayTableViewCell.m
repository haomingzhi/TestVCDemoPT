//
//  JYTeacherSayTableViewCell.m
//  TestVCDemoPT
//
//  Created by apple on 2019/3/4.
//  Copyright © 2019 wjy. All rights reserved.
//

#import "JYTeacherSayTableViewCell.h"
#import "UILabel+JYStyle.h"

@interface JYTeacherSayTableViewCell()
@property(nonatomic,strong)UILabel *teacherSayLb;
@end


@implementation JYTeacherSayTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.teacherSayLb];
    }
    return self;
}

-(UILabel *)teacherSayLb
{
    if (!_teacherSayLb) {
        _teacherSayLb = [UILabel newLabel:UIColorFromRGB(0x525252) withFont:[UIFont systemFontOfSize:14] ];
        _teacherSayLb.left = 17.5;
        _teacherSayLb.top = 2;
    }
    return _teacherSayLb;
}

-(void)refresh:(NSDictionary *)dic
{
    self.teacherSayLb.text = dic[@"title"];
    [self.teacherSayLb resetSize];
    [self setNeedsLayout];
}

@end
