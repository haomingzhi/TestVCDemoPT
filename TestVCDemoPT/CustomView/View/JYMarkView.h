//
//  JYMarkView.h
//  TestVCDemoPT
//
//  Created by apple on 2019/3/5.
//  Copyright © 2019 wjy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JYMarkView : UIView
+(JYMarkView *)newMarkView:(NSInteger)type;
@property(nonatomic,strong)NSArray *titleArr;
@end

NS_ASSUME_NONNULL_END
