//
//  JYMarkView.m
//  TestVCDemoPT
//
//  Created by apple on 2019/3/5.
//  Copyright © 2019 wjy. All rights reserved.
//

#import "JYMarkView.h"
#import "UILabel+JYStyle.h"
@interface JYMarkView()
@property(nonatomic,strong)NSMutableArray *vArr;
@property(nonatomic)NSInteger type;
@end


@implementation JYMarkView
-(id)init
{
    self = [super init];
    if(self)
    {
        self.vArr = [NSMutableArray new];
    }
    return self;
}

-(void)setTitleArr:(NSArray *)titleArr
{
    _titleArr = titleArr;
    [self createView:titleArr withVArr:self.vArr withSuperView:self];
    [self setNeedsLayout];
}

-(void)createView:(NSArray *)arr  withVArr:(NSMutableArray *)vArr withSuperView:(UIView *)supview
{
    NSInteger c = arr.count;
    NSMutableArray *ab = [NSMutableArray new];
    for (NSInteger i = 0; i < c; i ++) {
        UILabel *lab;
        NSString *title = arr[i];
        if(vArr.count != 0)
        {
            lab = vArr.lastObject;
            [ab addObject:lab];
            [vArr removeObject:lab];
        }
        else
        {
            if (self.type == 0) {
                 lab = [UILabel newMarkStyleLabel:title];
            }
           else
           {
               lab = [UILabel newInfoMarkStyleLabel:title];
           }
            [ab addObject:lab];
        }
        if (i> 0) {
            UIButton *b = ab[i - 1];
            
            lab.left = b.width + 10 + b.left;
            
            
        }
        else
        {
            
            lab.left = 0;
        }
        lab.tag = 100 + i;
        lab.top = 1;
//        lab.height = 22;
        //        btn.title = dic[@"title"];
        //        btn.img = dic[@"img"];
        
        [supview addSubview:lab];
       
    }
    if(vArr.count != 0)
    {
        [vArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UIButton *b = obj;
            [b removeFromSuperview];
        }];
        [vArr removeAllObjects];
    }
    
    vArr = ab;
}

+(JYMarkView *)newMarkView:(NSInteger)type
{
   JYMarkView *v = [JYMarkView new];
    v->_type = type;
    return v;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    UIView *v = _vArr.lastObject;
    if (v) {
        self.height = v.height + 2;
        self.width = v.left + v.width + 2;
    }
    else
    {
        self.height = 10;
        self.width = 10;
    }
}

@end
