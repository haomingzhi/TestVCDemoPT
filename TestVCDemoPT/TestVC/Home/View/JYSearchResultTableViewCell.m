//
    //  SearchResultViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    
#import "JYSearchResultTableViewCell.h"
    
@interface JYSearchResultTableViewCell()
@property(nonatomic,strong)UILabel *titleLb;
@property(nonatomic,strong)UILabel *markLb;
@end
@implementation JYSearchResultTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    [self.contentView addSubview:self.titleLb];
    [self.contentView addSubview:self.markLb];
    }
    return self;
}
-(void)refresh:(NSDictionary *)dic
{
    self.titleLb.text = dic[@"titleLb"];
self.markLb.text = dic[@"markLb"];
    [self setNeedsLayout];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
       _titleLb.height = 24;
    _titleLb.width = 160;
    _titleLb.top = 0;
    _titleLb.left = 0;

    _markLb.height = 24;
    _markLb.width = 160;
    _markLb.top = 0;
    _markLb.left = 0;

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
-(UILabel *)markLb
{
    if (!_markLb) {
    _markLb = [UILabel new];
    _markLb.height = 24;
    _markLb.width = 160;
    _markLb.top = 0;
    _markLb.left = 0;
    }
    return _markLb;
}
@end