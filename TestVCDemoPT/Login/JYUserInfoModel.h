//
//  JYUserInfoModel.h
//  TestVCDemoPT
//
//  Created by apple on 2019/1/31.
//  Copyright © 2019 wjy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JYUserInfoModel : NSObject
singleton_interface(JYUserInfoModel)
@property(nonatomic,copy,nullable) NSString *province;//省份

@property (nonatomic,strong,nullable) NSNumber *is_auth;
@property (nonatomic,strong,nullable) NSNumber *lon;
@property (nonatomic,strong,nullable) NSNumber *lat;
@property (nonatomic,copy,nullable)   NSString *phone_tel;

@property (nonatomic,strong,nullable) NSNumber *status;
@property (nonatomic,copy,nullable)   NSString *token;
@property (nonatomic,strong,nullable) NSNumber *user_id;
@property (nonatomic,copy,nullable)   NSString *user_name;
@property (nonatomic,strong,nullable) NSNumber *utype;
@property(nonatomic,strong,nullable)  NSNumber *province_id;//省份id
@property (nonatomic,copy,nullable)   NSString *pic_url;//头像
@property(nonatomic,strong,nullable)  NSNumber *sex;


//需要自存
@property (nonatomic, copy,nullable) NSString *user_password;
@property (nonatomic, copy,nullable)  NSString *city_Name;
@property (nonatomic, strong,nullable)NSNumber *city_id;
@property (nonatomic,copy,nullable)   NSString *accid;
@property (nonatomic,copy,nullable)   NSString *IMToken;
-(void)cleanUp;
@end

NS_ASSUME_NONNULL_END
