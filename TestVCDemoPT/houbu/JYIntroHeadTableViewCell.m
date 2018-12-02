//
    //  IntroHeadViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    
#import "JYIntroHeadTableViewCell.h"
        #import "JYStarView.h"
@interface JYIntroHeadTableViewCell()
@property(nonatomic,strong)UILabel *titleLb;
@property(nonatomic,strong)UILabel *infoLb;
@property(nonatomic,strong)UILabel *countLb;
@property(nonatomic,strong)UILabel *priceLb;
@property(nonatomic,strong)JYStarView *starView;@property(nonatomic,strong)UIImageView *markImgV;
@end
@implementation JYIntroHeadTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    [self.contentView addSubview:self.titleLb];
           [self.contentView addSubview:self.starView];
    [self.contentView addSubview:self.infoLb];
    [self.contentView addSubview:self.countLb];
    [self.contentView addSubview:self.priceLb];
    [self.contentView addSubview:self.markImgV];
    }
    return self;
}
-(void)refresh:(NSDictionary *)dic
{
    self.titleLb.text = dic[@"title"];
self.infoLb.text = dic[@"info"];
self.countLb.text = dic[@"count"];
self.priceLb.text = dic[@"price"];
  [self.starView refresh:@{@"count":dic[@"star"]}];self.markImgV.image = [UIImage imageNamed:dic[@"img"]];
    [self setNeedsLayout];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
   
    _titleLb.top = 10;
    _titleLb.left = 15;

    _starView.left = _titleLb.left;
    _starView.top = 15 + _titleLb.top + _titleLb.height;


    _countLb.top = 13 + _titleLb.top + _titleLb.height;
      [_countLb sizeToFit];
    _countLb.left = UIScreenWidth - 15 - _countLb.width;
  
    
    _markImgV.top = 13 + _titleLb.top + _titleLb.height;
    _markImgV.left =  _countLb.left - 10 - _markImgV.width;
    
    _infoLb.top = 15 + _titleLb.top + _titleLb.height;
    _infoLb.left = _markImgV.left - 31 - _infoLb.width;
    
    _priceLb.top = 8 + _starView.top + _starView.height;
    _priceLb.left = _titleLb.left;



}
-(UILabel *)titleLb
{
    if (!_titleLb) {
    _titleLb = [UILabel new];
    _titleLb.height = 17;
    _titleLb.width = UIScreenWidth - 30;
        _titleLb.font = [UIFont systemFontOfSize:16];
        _titleLb.textColor = UIColorFromRGB(0x222222);
    _titleLb.top = 0;
    _titleLb.left = 0;
    }
    return _titleLb;
}
-(UILabel *)infoLb
{
    if (!_infoLb) {
    _infoLb = [UILabel new];
    _infoLb.height = 13;
    _infoLb.width = 160;
        _infoLb.font = [UIFont systemFontOfSize:12];
        _infoLb.textColor = UIColorFromRGB(0x666666);
         _infoLb.textAlignment = NSTextAlignmentRight;
    _infoLb.top = 0;
    _infoLb.left = 0;
    }
    return _infoLb;
}
-(UILabel *)countLb
{
    if (!_countLb) {
    _countLb = [UILabel new];
    _countLb.height = 14;
    _countLb.width = 60;
        _countLb.font = [UIFont systemFontOfSize:13];
        _countLb.textColor = UIColorFromRGB(0x666666);
    _countLb.top = 0;
    _countLb.left = 0;
    }
    return _countLb;
}
-(UILabel *)priceLb
{
    if (!_priceLb) {
    _priceLb = [UILabel new];
    _priceLb.height = 17;
    _priceLb.width = 160;
        _priceLb.font = [UIFont systemFontOfSize:16];
        _priceLb.textColor = UIColorFromRGB(0xfc505d);
    _priceLb.top = 0;
    _priceLb.left = 0;
    }
    return _priceLb;
}
-(UIImageView *)markImgV
{
    if (!_markImgV) {
    _markImgV = [UIImageView new];
    _markImgV.height = 15;
    _markImgV.width = 15;
    _markImgV.top = 0;
    _markImgV.left = 0;
    }
    return _markImgV;
}

-(JYStarView *)starView
{
    if (!_starView) {
        _starView = [JYStarView new];
//        _starView.infoHidden = YES;
    }
    return _starView;
}

@end
