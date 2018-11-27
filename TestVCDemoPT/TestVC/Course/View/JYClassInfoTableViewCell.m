//
    //  ClassInfoViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    

    

@property(nonatomic,strong)UIImageView *imgV;






@end

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    [self.contentView addSubview:self.imgV];
    [self.contentView addSubview:self.markImgV];
    [self.contentView addSubview:self.titleLb];
    [self.contentView addSubview:self.nameLb];
    [self.contentView addSubview:self.infoLb];
    [self.contentView addSubview:self.countLb];
    [self.contentView addSubview:self.priceLb];
    }
    return self;
}

{
    self.imgV.image = [UIImage imageNamed:dic[@"img"]];






    [self setNeedsLayout];
}

{
    [super layoutSubviews];
       _imgV.height = 24;
    _imgV.width = 160;
    _imgV.top = 0;
    _imgV.left = 0;


    _markImgV.width = 160;
    _markImgV.top = 0;
    _markImgV.left = 0;


    _titleLb.width = 160;
    _titleLb.top = 0;
    _titleLb.left = 0;


    _nameLb.width = 160;
    _nameLb.top = 0;
    _nameLb.left = 0;


    _infoLb.width = 160;
    _infoLb.top = 0;
    _infoLb.left = 0;


    _countLb.width = 160;
    _countLb.top = 0;
    _countLb.left = 0;


    _priceLb.width = 160;
    _priceLb.top = 0;
    _priceLb.left = 0;

}

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

{
    if (!_markImgV) {
    _markImgV = [UIImageView new];
    _markImgV.height = 24;
    _markImgV.width = 160;
    _markImgV.top = 0;
    _markImgV.left = 0;
    }
    return _markImgV;
}

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

{
    if (!_nameLb) {
    _nameLb = [UILabel new];
    _nameLb.height = 24;
    _nameLb.width = 160;
    _nameLb.top = 0;
    _nameLb.left = 0;
    }
    return _nameLb;
}

{
    if (!_infoLb) {
    _infoLb = [UILabel new];
    _infoLb.height = 24;
    _infoLb.width = 160;
    _infoLb.top = 0;
    _infoLb.left = 0;
    }
    return _infoLb;
}

{
    if (!_countLb) {
    _countLb = [UILabel new];
    _countLb.height = 24;
    _countLb.width = 160;
    _countLb.top = 0;
    _countLb.left = 0;
    }
    return _countLb;
}

{
    if (!_priceLb) {
    _priceLb = [UILabel new];
    _priceLb.height = 24;
    _priceLb.width = 160;
    _priceLb.top = 0;
    _priceLb.left = 0;
    }
    return _priceLb;
}
@end