//
    //  ClassReadInfoViewController.m
    //  Model
    //
    //  Created by wjy on 2018/10/25.
    //  Copyright © 2018 wjy. All rights reserved.
    //
    
#import "JYClassReadInfoTableViewCell.h"
    
@interface JYClassReadInfoTableViewCell()

@end
@implementation JYClassReadInfoTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

    }
    return self;
}
-(void)refresh:(NSDictionary *)dic
{
    
    [self setNeedsLayout];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
   
}

@end