//
    //  TeacherDonViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    

    

@property(nonatomic,strong)UIView *backgroundView;







@end

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    [self.contentView addSubview:self.backgroundView];
    [self.contentView addSubview:self.imgV];
    [self.contentView addSubview:self.nameLb];
    [self.contentView addSubview:self.subjectLb];
    [self.contentView addSubview:self.schoolLb];
    [self.contentView addSubview:self.levelLb];
    [self.contentView addSubview:self.demoLb];
    [self.contentView addSubview:self.countLb];
    }
    return self;
}

{
    







    [self setNeedsLayout];
}

{
    [super layoutSubviews];
       _backgroundView.height = 24;
    _backgroundView.width = 160;
    _backgroundView.top = 0;
    _backgroundView.left = 0;


    _imgV.width = 160;
    _imgV.top = 0;
    _imgV.left = 0;


    _nameLb.width = 160;
    _nameLb.top = 0;
    _nameLb.left = 0;


    _subjectLb.width = 160;
    _subjectLb.top = 0;
    _subjectLb.left = 0;


    _schoolLb.width = 160;
    _schoolLb.top = 0;
    _schoolLb.left = 0;


    _levelLb.width = 160;
    _levelLb.top = 0;
    _levelLb.left = 0;


    _demoLb.width = 160;
    _demoLb.top = 0;
    _demoLb.left = 0;


    _countLb.width = 160;
    _countLb.top = 0;
    _countLb.left = 0;

}

{
    if (!_backgroundView) {
    _backgroundView = [UIView new];
    _backgroundView.height = 24;
    _backgroundView.width = 160;
    _backgroundView.top = 0;
    _backgroundView.left = 0;
    }
    return _backgroundView;
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
    if (!_subjectLb) {
    _subjectLb = [UILabel new];
    _subjectLb.height = 24;
    _subjectLb.width = 160;
    _subjectLb.top = 0;
    _subjectLb.left = 0;
    }
    return _subjectLb;
}

{
    if (!_schoolLb) {
    _schoolLb = [UILabel new];
    _schoolLb.height = 24;
    _schoolLb.width = 160;
    _schoolLb.top = 0;
    _schoolLb.left = 0;
    }
    return _schoolLb;
}

{
    if (!_levelLb) {
    _levelLb = [UILabel new];
    _levelLb.height = 24;
    _levelLb.width = 160;
    _levelLb.top = 0;
    _levelLb.left = 0;
    }
    return _levelLb;
}

{
    if (!_demoLb) {
    _demoLb = [UILabel new];
    _demoLb.height = 24;
    _demoLb.width = 160;
    _demoLb.top = 0;
    _demoLb.left = 0;
    }
    return _demoLb;
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
@end