//
    //  TitleTextTfViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    
#import "JYTitleTextTfTableViewCell.h"
    
@interface JYTitleTextTfTableViewCell()
@property(nonatomic,strong)UILabel *titleLb;
@end
@implementation JYTitleTextTfTableViewCell
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
    self.titleLb.text = dic[@"titleLb"];
    [self setNeedsLayout];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
       _titleLb.height = 24;
    _titleLb.width = 160;
    _titleLb.top = 0;
    _titleLb.left = 0;

}
-(UILabel *)titleLb
{
    if (!_titleLb) {
    _titleLb = [UILabel new];
    _titleLb.height = 24;
    _titleLb.width = 160;
    _titleLb.top = 0;
    _titleLb.left = 0;
    }
    return _titleLb;
}
@end