//
//  JYHistoryTableViewCell.m
//  TestVCDemoPT
//
//  Created by apple on 2019/3/4.
//  Copyright © 2019 wjy. All rights reserved.
//

#import "JYHistoryTableViewCell.h"
#import "UILabel+JYStyle.h"
#import "UIButton+JYStyle.h"
@interface JYHistoryTableViewCell()
@property(nonatomic,strong)UILabel *yearsLb;
@property(nonatomic,strong)UILabel *timeZxLb;
@property(nonatomic,strong)UIButton *lvliBtn;
@end


@implementation JYHistoryTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.yearsLb];
        [self.contentView addSubview:self.timeZxLb];
        [self.contentView addSubview:self.lvliBtn];
    }
    return self;
}

-(UILabel *)yearsLb
{
    if (!_yearsLb) {
        _yearsLb = [UILabel newLabel:UIColorFromRGB(0x151515) withFont:[UIFont systemFontOfSize:15]];
        _yearsLb.numberOfLines = 1;
        _yearsLb.width = 180;
        _yearsLb.height = 18;
        _yearsLb.left = 17.5;
        _yearsLb.top = 10;
    }
    return _yearsLb;
}

-(UILabel *)timeZxLb
{
    if (!_timeZxLb) {
        _timeZxLb = [UILabel newLabel:UIColorFromRGB(0x151515) withFont:[UIFont systemFontOfSize:15]];
        _timeZxLb.numberOfLines = 1;
        _timeZxLb.width = 140;
        _timeZxLb.height = 18;
        _timeZxLb.left = 17.5;
        _timeZxLb.top = 10;
    }
    return _timeZxLb;
}

-(UIButton *)lvliBtn
{
    if (!_lvliBtn) {
        _lvliBtn = [UIButton newMoreBtn:@"老师履历"];
        _lvliBtn.top = 4;
        _lvliBtn.left = UIScreenWidth - _lvliBtn.width - 16;
        _lvliBtn.userInteractionEnabled = NO;
    }
    return _lvliBtn;
}

-(void)refresh:(NSDictionary *)dic
{
    self.yearsLb.text = dic[@"title"];
    self.timeZxLb.text = dic[@"info"];
    [self.yearsLb setRichText:@"从业"  withColor:UIColorFromRGB(0x525252) withFont:[UIFont systemFontOfSize:12]];
      self.yearsLb.width = self.yearsLb.attributedText.size.width;
    
     [self.timeZxLb setRichText:@"咨询"  withColor:UIColorFromRGB(0x525252) withFont:[UIFont systemFontOfSize:12]];
 
    
    self.timeZxLb.left = self.yearsLb.left + self.yearsLb.width + 20;
    [self setNeedsLayout];
}
@end
