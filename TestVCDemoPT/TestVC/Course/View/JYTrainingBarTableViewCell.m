//
    //  TrainingBarViewController.m
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
@end