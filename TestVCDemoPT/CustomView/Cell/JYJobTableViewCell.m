//
//  JYJobTableViewCell.m
//  TestVCDemoPT
//
//  Created by apple on 2019/3/4.
//  Copyright © 2019 wjy. All rights reserved.
//

#import "JYJobTableViewCell.h"
#import "UILabel+JYStyle.h"

@interface JYJobTableViewCell()
@property(nonatomic,strong)UILabel *jobLb;
@end


@implementation JYJobTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.jobLb];
    }
    return self;
}
-(UILabel *)jobLb
{
    if (!_jobLb) {
        _jobLb = [UILabel newLabel:UIColorFromRGB(0x525252) withFont:[UIFont systemFontOfSize:13]];
        _jobLb.left = 17.5;
        _jobLb.top = 2;
    }
    return _jobLb;
}
-(void)refresh:(NSDictionary *)dic
{
    _jobLb.text = dic[@"title"];
    [_jobLb resetSize];
    [self setNeedsLayout];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    _jobLb.left = 17.5;
    _jobLb.top = 2;
}

@end
