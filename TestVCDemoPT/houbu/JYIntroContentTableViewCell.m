//
    //  IntroContentViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    
#import "JYIntroContentTableViewCell.h"
    
@interface JYIntroContentTableViewCell()
@property(nonatomic,strong)UILabel *titleLb;
@end
@implementation JYIntroContentTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    [self.contentView addSubview:self.titleLb];
    }
    return self;
}
-(void)refresh:(NSDictionary *)dic
{
    self.titleLb.text = dic[@"title"];
    [self setNeedsLayout];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
   
    _titleLb.top = 16;
    _titleLb.left = 15;
    [_titleLb sizeToFit];
}
-(UILabel *)titleLb
{
    if (!_titleLb) {
    _titleLb = [UILabel new];
    _titleLb.height = 100000;
    _titleLb.width = UIScreenWidth - 30;
        _titleLb.numberOfLines = 0;
        _titleLb.lineBreakMode = NSLineBreakByCharWrapping;
        _titleLb.font = [UIFont systemFontOfSize:13];
        _titleLb.textColor = UIColorFromRGB(0x666666);
    _titleLb.top = 0;
    _titleLb.left = 0;
    }
    return _titleLb;
}
@end
