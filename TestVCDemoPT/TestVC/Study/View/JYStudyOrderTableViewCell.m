//
    //  StudyOrderViewController.m
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
    [self.contentView addSubview:self.orderNumLb];
    [self.contentView addSubview:self.titleLb];
    [self.contentView addSubview:self.nameLb];
    [self.contentView addSubview:self.countLb];
    [self.contentView addSubview:self.priceLb];
    [self.contentView addSubview:self.openTimeLb];
    [self.contentView addSubview:self.adrLb];
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


    _orderNumLb.width = 160;
    _orderNumLb.top = 0;
    _orderNumLb.left = 0;


    _titleLb.width = 160;
    _titleLb.top = 0;
    _titleLb.left = 0;


    _nameLb.width = 160;
    _nameLb.top = 0;
    _nameLb.left = 0;


    _countLb.width = 160;
    _countLb.top = 0;
    _countLb.left = 0;


    _priceLb.width = 160;
    _priceLb.top = 0;
    _priceLb.left = 0;


    _openTimeLb.width = 160;
    _openTimeLb.top = 0;
    _openTimeLb.left = 0;


    _adrLb.width = 160;
    _adrLb.top = 0;
    _adrLb.left = 0;

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
    if (!_orderNumLb) {
    _orderNumLb = [UILabel new];
    _orderNumLb.height = 24;
    _orderNumLb.width = 160;
    _orderNumLb.top = 0;
    _orderNumLb.left = 0;
    }
    return _orderNumLb;
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

{
    if (!_openTimeLb) {
    _openTimeLb = [UILabel new];
    _openTimeLb.height = 24;
    _openTimeLb.width = 160;
    _openTimeLb.top = 0;
    _openTimeLb.left = 0;
    }
    return _openTimeLb;
}

{
    if (!_adrLb) {
    _adrLb = [UILabel new];
    _adrLb.height = 24;
    _adrLb.width = 160;
    _adrLb.top = 0;
    _adrLb.left = 0;
    }
    return _adrLb;
}
@end