//
//  JYTeacherInfoViewController.h
//  TestVCDemoPT
//
//  Created by apple on 2019/2/26.
//  Copyright © 2019 wjy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JYTeacherInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JYTeacherInfoViewController : UIViewController
@property(nonatomic,strong) NSString *ID;
@property(nonatomic,strong)JYTeacherInfoModel *model;
@end

NS_ASSUME_NONNULL_END
