//
//  JYGoodAtTableViewCell.h
//  TestVCDemoPT
//
//  Created by apple on 2019/3/4.
//  Copyright © 2019 wjy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JYGoodAtTableViewCell : UITableViewCell
@property(nonatomic)BOOL hiddenLine;
-(void)refresh:(NSDictionary *)dic;
@end

NS_ASSUME_NONNULL_END
