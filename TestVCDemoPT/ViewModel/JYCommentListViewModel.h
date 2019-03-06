//
//  JYCommentListViewModel.h
//  TestVCDemoPT
//
//  Created by apple on 2019/3/5.
//  Copyright © 2019 wjy. All rights reserved.
//

#import "JYBaseViewModel.h"
#import "JYCommentModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JYCommentListViewModel : JYBaseViewModel
-(CGFloat)getCommentHeight:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
