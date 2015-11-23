//
//  AppDef.h
//  MicroList
//
//  Created by Michael on 15-11-21.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#ifndef MicroList_AppDef_h
#define MicroList_AppDef_h


typedef NS_ENUM(NSInteger, Sex) {
    Male = 1,
    Femal
};
/**
 *  显示群资料
 */
typedef NS_ENUM(NSInteger, GroupDetailType){
    /**
     *  根据搜索的群资料显示
     */
    GroupDetailBySearch = 1,
    /**
     *  根据我的群列表显示
     */
    GroupDetailByMyList
};
#define UserId  @"18552123120"
#define UserName  @"15271519188"
#define UserPassword  @"123123"

#define UserNameKey  @"username"
#define PassWordKey @"password"
#define KEY @"key"
#define HXKey       @"huanXinId"

#define LocationKey [[NSUserDefaults standardUserDefaults] objectForKey:@"key"];

#define URL_HEAD [NSString stringWithFormat:@"http://%@",kLoginServer]

#define userDefault [NSUserDefaults standardUserDefaults]


#endif
