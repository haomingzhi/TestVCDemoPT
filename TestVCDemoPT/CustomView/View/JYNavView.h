//
//  JYNavView.h
//  TestVCDemoPT
//
//  Created by apple on 2019/3/6.
//  Copyright © 2019 wjy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JYNavView : UIView
+(JYNavView *)newNavView:(NSString *)title;
-(UIButton *)setNavLeftBtn;
-(UIButton *)setNavRightBtn;
-(UIButton *)setNavLeftBtnImg:(NSString *)img;
-(UIButton *)setNavRightBtnImg:(NSString *)img;
-(void)setNavLeftView:(UIView *)lv;
-(void)setNavRightView:(UIView *)rv;
@property(nonatomic,strong)UIView *leftV;
@property(nonatomic,strong)UIView *rightV;
@property(nonatomic,strong)UIView *titleV;
@property(nonatomic,strong)NSString *title;
@end

NS_ASSUME_NONNULL_END
