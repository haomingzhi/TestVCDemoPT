//
//  UIButton+JYStyle.m
//  QQBtn
//
//  Created by apple on 2019/2/27.
//  Copyright © 2019 WJY. All rights reserved.
//

#import "UIButton+JYStyle.h"
#import "UIView+JYLayerEdit.h"
#import "NSString+JYTool.h"
@implementation UIButton (JYStyle)

+(void)createBtns:(NSArray *)arr withBtnsArr:(NSMutableArray *)btnArr withSuperView:(UIView *)supview withSel:(SEL)sel
{
    
    NSInteger c = arr.count;
    NSMutableArray *ab = [NSMutableArray new];
    for (NSInteger i = 0; i < c; i ++) {
        UIButton *btn;
        NSDictionary *dic = arr[i];
        if(btnArr.count != 0)
        {
            btn = btnArr.lastObject;
            [ab addObject:btn];
            [btnArr removeObject:btn];
        }
        else
        {
            btn = [UIButton new];
            [ab addObject:btn];
        }
        btn.width = 84;//UIScreenWidth/3.0;
        btn.left = btn.width * i;
        btn.tag = 100 + i;
        btn.height = 68;
//        btn.title = dic[@"title"];
//        btn.img = dic[@"img"];
        UILabel *lb = [btn viewWithTag:455];
        if (dic[@"detail"] &&![dic[@"detail"] isEqualToString:@""]) {
            if (!lb) {
                lb = [UILabel new];
                lb.width = btn.width;
                lb.height = 14;
                lb.top = 64;
                lb.font = [UIFont systemFontOfSize:14];
                lb.textAlignment = NSTextAlignmentCenter;
                lb.textColor = UIColorFromRGB(0xF2A326);
                [btn addSubview:lb];
                lb.tag = 455;
                
            }
            lb.text = dic[@"detail"];
            lb.hidden = NO;
        }
        else
        {
            if (lb) {
                lb.hidden = YES;
            }
            
        }
        [supview addSubview:btn];
        [btn addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
    }
    if(btnArr.count != 0)
    {
        [btnArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UIButton *b = obj;
            [b removeFromSuperview];
        }];
        [btnArr removeAllObjects];
    }
    
    btnArr = ab;
}


+(UIButton *)newBtn
{
    UIButton *btn = [UIButton new];
    btn.bounds = CGRectMake(0, 0, 60, 30);
//    btn.backgroundColor = [UIColor blueColor];
    [btn setTitle:@"button" forState:UIControlStateNormal];
    return btn;
}

+(UIButton *)newFindTeacherBtn
{
    return [UIButton newStyleBtn:@"找老师咨询"];
}

+(UIButton *)newStyleBtn:(NSString *)text
{
    UIButton *btn = [UIButton newBtn];
    btn.width = 240;
    btn.height = 45;
    [btn allCorners:22];
    [btn setTitle:text forState:UIControlStateNormal];
    [btn setTitleColor:UIColorFromRGB(0x525252) forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [btn gradientColor:UIColorFromRGB(0xFFEF73) toColor:UIColorFromRGB(0xFDDA3F)];
    return btn;
}

+(UIButton *)newAskBtn
{
    UIButton *btn = [UIButton newBtn];
    btn.width = UIScreenWidth - 130;
    btn.height = 44;
     btn.top = 0;
    [btn setTitle:@"向老师提问" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"提问老师"] forState:UIControlStateNormal];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 10)];
//    [btn setBackgroundColor:UIColorFromRGB(0xFDDA3F)];
//    [btn gradientColor:UIColorFromRGB(0xFFEF73) toColor:UIColorFromRGB(0xFDDA3F)];
    return btn;
}

+(UIButton *)newZxKfBtn
{
    UIButton *btn = [UIButton newBtn];
    btn.width = 130;
    btn.height = 44;
    btn.top = 0;
    [btn setTitle:@"咨询客服" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"客服"] forState:UIControlStateNormal];
      [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 10)];
    return btn;
}


+(UIButton *)newNavShareBtn:(NSInteger)type
{
    UIButton *btn = [UIButton newBtn];
    btn.width = 30;
    btn.height = 30;
    [btn setTitle:@"分享" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:8];
    
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    if (type == 0) {
        [btn setImage:[UIImage imageNamed:@"分享-黑色-视频文章"] forState:UIControlStateNormal];
        [btn setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
    }
    else
    {
    [btn setImage:[UIImage imageNamed:@"分享-文章视频"] forState:UIControlStateNormal];
        [btn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
    }
    [btn setImageEdgeInsets:UIEdgeInsetsMake(-4, 0, 0, -14)];
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(20, -16, 0, 0)];
    return btn;
}
+(UIButton *)newNavBackBtn:(NSInteger)type
{
    UIButton *btn = [UIButton newBtn];
    btn.width = 30;
    btn.height = 30;
    [btn setTitle:@"" forState:UIControlStateNormal];
        if (type == 0) {
    [btn setImage:[UIImage imageNamed:@"返回-黑-视频文章"] forState:UIControlStateNormal];
        }else
        {
             [btn setImage:[UIImage imageNamed:@"返回-视频文章"] forState:UIControlStateNormal];
        }
    return btn;
}

+(UIButton *)newCommentBtn:(NSInteger)count
{
    UIButton *btn = [UIButton newBtn];
    btn.width = UIScreenWidth;
    btn.height = 40;
     btn.backgroundColor = UIColorFromRGB(0xffffff);
    [btn setTitle:[NSString stringWithFormat:@"查看更多评价(%@)",@(count)] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"查看更多箭头"] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:11];
    [btn setTitleColor:UIColorFromRGB(0x999999) forState:UIControlStateNormal];
   CGSize sz = [btn.titleLabel.text getSize:btn.titleLabel.font];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, sz.width * 2, 0,0)];
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, -14, 0, 0)];
    return btn;
}

-(void)setCommentBtn:(NSInteger)count
{
    [self setTitle:[NSString stringWithFormat:@"查看更多评价(%@)",@(count)] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:@"查看更多箭头"] forState:UIControlStateNormal];
    
    CGSize sz = [self.titleLabel.text getSize:self.titleLabel.font];
    [self setImageEdgeInsets:UIEdgeInsetsMake(0, sz.width * 2, 0, 0)];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -14, 0, 0)];
}

+(UIButton *)newMoreBtn:(NSString *)str
{
    UIButton *btn = [UIButton newBtn];
    btn.width = 52;
    btn.height = 30;
    btn.backgroundColor = UIColorFromRGB(0xffffff);
    [btn setTitle:str forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"查看更多箭头"] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:11];
    [btn setTitleColor:UIColorFromRGB(0x999999) forState:UIControlStateNormal];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 46, 0, 0)];
       [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, -14, 0, 0)];
    return btn;
}
@end
