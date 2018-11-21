//
    //  PhotoCheckViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    
#import "JYPhotoCheckTableViewCell.h"
    
@interface JYPhotoCheckTableViewCell()
@property(nonatomic,strong)UIImageView *backgroundImgV;
@property(nonatomic,strong)UIImageView *imgV;
@property(nonatomic,strong)UIButton *btn;
@end
@implementation JYPhotoCheckTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    [self.contentView addSubview:self.backgroundImgV];
    [self.contentView addSubview:self.imgV];
    [self.contentView addSubview:self.btn];
    }
    return self;
}
-(void)refresh:(NSDictionary *)dic
{
    self.backgroundImgV.image = [UIImage imageNamed:dic[@"img"]];
self.imgV.image = [UIImage imageNamed:dic[@"img"]];
[self.btn setTitle:dic[@"title"] forState:UIControlStateNormal];
    [self setNeedsLayout];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
       _backgroundImgV.height = 24;
    _backgroundImgV.width = 160;
    _backgroundImgV.top = 0;
    _backgroundImgV.left = 0;

    _imgV.height = 24;
    _imgV.width = 160;
    _imgV.top = 0;
    _imgV.left = 0;

    _btn.height = 24;
    _btn.width = 160;
    _btn.top = 0;
    _btn.left = 0;

}
-(UIImageView *)backgroundImgV
{
    if (!_backgroundImgV) {
    _backgroundImgV = [UIImageView new];
    _backgroundImgV.height = 24;
    _backgroundImgV.width = 160;
    _backgroundImgV.top = 0;
    _backgroundImgV.left = 0;
    }
    return _backgroundImgV;
}
-(UIImageView *)imgV
{
    if (!_imgV) {
    _imgV = [UIImageView new];
    _imgV.height = 24;
    _imgV.width = 160;
    _imgV.top = 0;
    _imgV.left = 0;
    }
    return _imgV;
}
-(UIButton *)btn
{
    if (!_btn) {
    _btn = [UIButton new];
    _btn.height = 24;
    _btn.width = 160;
    _btn.top = 0;
    _btn.left = 0;
    }
    return _btn;
}
@end