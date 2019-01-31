//
//  JYUserInfoModel.m
//  TestVCDemoPT
//
//  Created by apple on 2019/1/31.
//  Copyright © 2019 wjy. All rights reserved.
//

#import "JYUserInfoModel.h"

@implementation JYUserInfoModel
singleton_implementation(JYUserInfoModel)
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"eid"];
    }
    if ([key isEqualToString:@"username"]) {
        [self setValue:value forKey:@"user_name"];
    }
    if ([key isEqualToString:@"member_id"]) {
        [self setValue:value forKey:@"user_id"];
    }
    if ([key isEqualToString:@"tenure_school"]) {
        [self setValue:value forKey:@"school_id"];
    }
    if ([key isEqualToString:@"mobile"]) {
        [self setValue:value forKey:@"phone_tel"];
    }
    if ([key isEqualToString:@"tenure_school_name"]) {
        [self setValue:value forKey:@"school_name"];
    }
}

- (NSString *)auditing_flag {
    return UserDefaultObjectForKey(@"auditing_flag");
}
- (void)setAuditing_flag:(NSString *)auditing_flag {
    UserDefaultSetObjectForKey(auditing_flag, @"auditing_flag");
}

- (NSNumber *)college_id {
    return UserDefaultObjectForKey(@"college_id");
}
- (void)setCollege_id:(NSNumber *)college_id {
    UserDefaultSetObjectForKey(college_id, @"college_id");
}

- (NSNumber *)education_id {
    return UserDefaultObjectForKey(@"education_id");
}
- (void)setEducation_id:(NSNumber *)education_id {
    UserDefaultSetObjectForKey(education_id, @"education_id");
}

- (NSNumber *)is_auth {
    return UserDefaultObjectForKey(@"is_auth");
}
- (void)setIs_auth:(NSNumber *)is_auth {
    UserDefaultSetObjectForKey(is_auth, @"is_auth");
}

- (NSNumber *)is_formal {
    return UserDefaultObjectForKey(@"is_formal");
}
- (void)setIs_formal:(NSNumber *)is_formal {
    UserDefaultSetObjectForKey(is_formal, @"is_formal");
}

- (NSNumber *)is_guest {
    return UserDefaultObjectForKey(@"is_guest");
}
- (void)setIs_guest:(NSNumber *)is_guest {
    UserDefaultSetObjectForKey(is_guest, @"is_guest");
}

//- (NSNumber *)logins {
//    return UserDefaultObjectForKey(@"logins");
//}
//- (void)setLogins:(NSNumber *)logins {
//    UserDefaultSetObjectForKey(logins, @"logins");
//}

- (NSString *)phone_tel {
    return UserDefaultObjectForKey(@"phone_tel");
}
- (void)setPhone_tel:(NSString *)phone_tel {
    UserDefaultSetObjectForKey(phone_tel, @"phone_tel");
}

//- (NSString *)region_name {
//    return UserDefaultObjectForKey(@"region_name");
//}
//- (void)setRegion_name:(NSString *)region_name {
//    UserDefaultSetObjectForKey(region_name, @"region_name");
//}

//- (NSNumber *)school_id {
//    return UserDefaultObjectForKey(@"school_id");
//}
//- (void)setSchool_id:(NSNumber *)school_id {
//    UserDefaultSetObjectForKey(school_id, @"school_id");
//}
//
//- (NSString *)school_name {
//    return UserDefaultObjectForKey(@"school_name");
//}
//- (void)setSchool_name:(NSString *)school_name {
//    UserDefaultSetObjectForKey(school_name, @"school_name");
//}
//
- (NSNumber *)status {
    return UserDefaultObjectForKey(@"status");
}
- (void)setStatus:(NSNumber *)status {
    UserDefaultSetObjectForKey(status, @"status");
}

- (NSString *)token {
    return UserDefaultObjectForKey(@"token");
}
- (void)setToken:(NSString *)token {
    UserDefaultSetObjectForKey(token, @"token");
}

- (NSNumber *)user_id {
    return UserDefaultObjectForKey(@"user_id");
}
- (void)setUser_id:(NSNumber *)user_id {
    UserDefaultSetObjectForKey(user_id, @"user_id");
}

- (NSString *)user_name {
    return UserDefaultObjectForKey(@"user_name");
}
- (void)setUser_name:(NSString *)user_name {
    UserDefaultSetObjectForKey(user_name, @"user_name");
}

- (NSNumber *)utype {
    return UserDefaultObjectForKey(@"utype");
}
- (void)setUtype:(NSNumber *)utype {
    UserDefaultSetObjectForKey(utype, @"utype");
}

//- (NSString *)work_number {
//    return UserDefaultObjectForKey(@"work_number");
//}
//- (void)setWork_number:(NSString *)work_number {
//    UserDefaultSetObjectForKey(work_number, @"work_number");
//}

- (NSString *)user_password {
    return UserDefaultObjectForKey(@"user_password");
}
-(void)setUser_password:(NSString *)user_password {
    UserDefaultSetObjectForKey(user_password, @"user_password");
}

- (NSString *)city_Name {
    return UserDefaultObjectForKey(@"city_Name");
}
- (void)setCity_Name:(NSString *)city_Name {
    UserDefaultSetObjectForKey(city_Name, @"city_Name");
}
- (NSNumber *)city_id {
    return UserDefaultObjectForKey(@"city_id");
}
- (void)setCity_id:(NSNumber *)city_id {
    UserDefaultSetObjectForKey(city_id, @"city_id");
}

- (NSString *)IMToken
{
    return UserDefaultObjectForKey(@"IMToken");
}


-(void)setIMToken:(NSString *)IMToken
{
    UserDefaultSetObjectForKey(IMToken, @"IMToken");
}

- (void)setAccid:(NSString *)accid
{
    //    _accid = accid;
    UserDefaultSetObjectForKey(accid, @"accid");
}

-(NSString *)accid
{
    return UserDefaultObjectForKey(@"accid");
}

-(void)cleanUp
{
    self.accid = nil;
    self.IMToken = nil;
    self.city_id = nil;
    self.city_Name = nil;
    self.user_password = nil;
    self.user_id = nil;
    self.user_name = nil;
    self.token = nil;
    self.status = nil;
    self.lat = nil;
    self.lon = nil;
    self.phone_tel = nil;
   
}
@end
