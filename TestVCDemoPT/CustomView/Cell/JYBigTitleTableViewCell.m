//
//  JYBigTitleTableViewCell.m
//  TestVCDemoPT
//
//  Created by apple on 2019/3/4.
//  Copyright © 2019 wjy. All rights reserved.
//

#import "JYBigTitleTableViewCell.h"
#import "JYBigTitleView.h"
@interface JYBigTitleTableViewCell()
@property(nonatomic,strong)JYBigTitleView *bigTitleView;
@end


@implementation JYBigTitleTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
         [self.contentView addSubview:self.bigTitleView];
    }
    return self;
}

-(JYBigTitleView*)bigTitleView
{
    if (!_bigTitleView) {
        _bigTitleView = [JYBigTitleView newTitleView:@""];
        _bigTitleView.top = 3;
    }
    return _bigTitleView;
}

-(void)refresh:(NSDictionary *)dic
{
    _bigTitleView.title = dic[@"title"];
    _bigTitleView.marks = dic[@"mark"];
    if ([dic[@"hiddenMark"] boolValue]) {
        _bigTitleView.markV.hidden = YES;
    }
    else
    {
         _bigTitleView.markV.hidden = NO;
    }
    [self setNeedsLayout];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    _bigTitleView.top = 3;
}
@end
