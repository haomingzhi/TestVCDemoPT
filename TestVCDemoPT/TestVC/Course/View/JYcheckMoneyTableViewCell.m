//
    //  checkMoneyViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    

    

@property(nonatomic,strong)UIButton *aBtn;





@end

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    [self.contentView addSubview:self.aBtn];
    [self.contentView addSubview:self.bBtn];
    [self.contentView addSubview:self.cBtn];
    [self.contentView addSubview:self.dBtn];
    [self.contentView addSubview:self.eBtn];
    [self.contentView addSubview:self.fBtn];
    }
    return self;
}

{
    [self.aBtn setTitle:dic[@"title"] forState:UIControlStateNormal];





    [self setNeedsLayout];
}

{
    [super layoutSubviews];
       _aBtn.height = 24;
    _aBtn.width = 160;
    _aBtn.top = 0;
    _aBtn.left = 0;


    _bBtn.width = 160;
    _bBtn.top = 0;
    _bBtn.left = 0;


    _cBtn.width = 160;
    _cBtn.top = 0;
    _cBtn.left = 0;


    _dBtn.width = 160;
    _dBtn.top = 0;
    _dBtn.left = 0;


    _eBtn.width = 160;
    _eBtn.top = 0;
    _eBtn.left = 0;


    _fBtn.width = 160;
    _fBtn.top = 0;
    _fBtn.left = 0;

}

{
    if (!_aBtn) {
    _aBtn = [UIButton new];
    _aBtn.height = 24;
    _aBtn.width = 160;
    _aBtn.top = 0;
    _aBtn.left = 0;
    }
    return _aBtn;
}

{
    if (!_bBtn) {
    _bBtn = [UIButton new];
    _bBtn.height = 24;
    _bBtn.width = 160;
    _bBtn.top = 0;
    _bBtn.left = 0;
    }
    return _bBtn;
}

{
    if (!_cBtn) {
    _cBtn = [UIButton new];
    _cBtn.height = 24;
    _cBtn.width = 160;
    _cBtn.top = 0;
    _cBtn.left = 0;
    }
    return _cBtn;
}

{
    if (!_dBtn) {
    _dBtn = [UIButton new];
    _dBtn.height = 24;
    _dBtn.width = 160;
    _dBtn.top = 0;
    _dBtn.left = 0;
    }
    return _dBtn;
}

{
    if (!_eBtn) {
    _eBtn = [UIButton new];
    _eBtn.height = 24;
    _eBtn.width = 160;
    _eBtn.top = 0;
    _eBtn.left = 0;
    }
    return _eBtn;
}

{
    if (!_fBtn) {
    _fBtn = [UIButton new];
    _fBtn.height = 24;
    _fBtn.width = 160;
    _fBtn.top = 0;
    _fBtn.left = 0;
    }
    return _fBtn;
}
@end