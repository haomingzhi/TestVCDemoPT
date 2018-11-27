//
    //  DownloadInfoViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    

    

@property(nonatomic,strong)UILabel *markLb;


@end

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    [self.contentView addSubview:self.markLb];
    [self.contentView addSubview:self.titleLb];
    [self.contentView addSubview:self.infoLb];
    }
    return self;
}

{
    self.markLb.text = dic[@"markLb"];


    [self setNeedsLayout];
}

{
    [super layoutSubviews];
       _markLb.height = 24;
    _markLb.width = 160;
    _markLb.top = 0;
    _markLb.left = 0;


    _titleLb.width = 160;
    _titleLb.top = 0;
    _titleLb.left = 0;


    _infoLb.width = 160;
    _infoLb.top = 0;
    _infoLb.left = 0;

}

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
    if (!_infoLb) {
    _infoLb = [UILabel new];
    _infoLb.height = 24;
    _infoLb.width = 160;
    _infoLb.top = 0;
    _infoLb.left = 0;
    }
    return _infoLb;
}
@end