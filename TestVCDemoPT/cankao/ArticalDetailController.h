//
//  ArticalDetailController.h
//  LMSY
//
//  Created by 侯 on 2018/10/22.
//  Copyright © 2018年 DaDaoZhiXing. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ArticalDetailController : BaseViewController

@property(nonatomic,assign)NSInteger articalId;

@property(nonatomic,strong)NSString *articalTitle;
@end

NS_ASSUME_NONNULL_END
