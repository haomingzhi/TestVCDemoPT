//
//  JYTitleTableViewCell.m
//  TestVCDemoPT
//
//  Created by apple on 2019/3/4.
//  Copyright © 2019 wjy. All rights reserved.
//

#import "JYTitleTableViewCell.h"
#import "JYTitleView.h"
@interface JYTitleTableViewCell()
@property(nonatomic,strong)JYTitleView *titleView;
@end
@implementation JYTitleTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.titleView];
    }
    return self;
}
-(JYTitleView*)titleView
{
    if (!_titleView) {
        _titleView = [JYTitleView newTitleView:@""];
       
    }
    return _titleView;
}
-(void)refresh:(NSDictionary *)dic
{
     _titleView.title = dic[@"title"];
    [self setNeedsLayout];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
     _titleView.top = 17;
}
@end
