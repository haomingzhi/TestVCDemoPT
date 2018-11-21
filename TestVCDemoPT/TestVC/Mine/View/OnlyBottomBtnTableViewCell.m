//
//  OnlyBottomBtnTableViewCell.m
//  ChaoLiu
//
//  Created by air on 15/7/27.
//  Copyright (c) 2015年 ORANLLC_IOS1. All rights reserved.
//

#import "OnlyBottomBtnTableViewCell.h"
//#import "WBStatusHelper.h"
//#import "WBStatusLayout.h"
//#import "WBStatusComposeTextParser.h"

@implementation OnlyBottomBtnTableViewCell
{
    NSInteger _row;
    IBOutlet UIButton *btn;
    NSDictionary *_dataDic;
//    YYLabel *_contentYYLb;
     NSIndexPath *_curIndexPath;
}
- (void)awakeFromNib {
    // Initialization code
    btn.width = UIScreenWidth;
//    self.width = __SCREEN_SIZE.width;
}
-(UIButton *)getBtn
{
     return btn;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)handleAction:(id)sender {
    if (self.handleAction) {
         self.handleAction(@{@"obj":sender,@"row":@(_row),@"indexPath":_curIndexPath?:[NSIndexPath indexPathForRow:0 inSection:0]});
    }
}

-(void)setPadding:(CGFloat)padding
{
    btn.x = padding;
    btn.width = UIScreenWidth - padding * 2;
}
-(void)setHeightPadding:(CGFloat)padding
{
    btn.y = padding;
    btn.height = self.height - padding * 2;
}
-(void)setBtnBackgroundColor:(UIColor *)color
{

    
    btn.backgroundColor = color;
}
-(void)setBtnEnabled:(BOOL)b
{
    btn.enabled = b;
}
-(void)btnLayer:(BOOL)J
{
    if (J==YES)
    {
        btn.layer.borderWidth = 1;
        btn.layer.borderColor = [[UIColor colorWithRed:0.831f green:0.831f blue:0.843f alpha:1.00f] CGColor];
    }
    else
    {
        btn.layer.borderWidth = 0;
        btn.layer.borderColor = [[UIColor blackColor] CGColor];
    }
}

-(void)setBtnTitleColor:(UIColor *)color
{
    [btn setTitleColor:color forState:UIControlStateNormal];
}

-(void)setCellData:(NSDictionary *)dataDic
{
    _dataDic = dataDic;
     _curIndexPath = dataDic[@"indexPath"];
    _row = [dataDic[@"row"] integerValue];
    [btn setTitle:dataDic[@"title"] forState:UIControlStateNormal];
//    [super setCellData:dataDic];
}

-(void)fitMineMode
{
    
}

@end
