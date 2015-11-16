//
//  BaseAlertView.m
//  MicroList
//
//  Created by Mac on 15/11/11.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "BaseAlertView.h"

@implementation BaseAlertView


/**弹框设置*/
+ (void)AlertView:(NSString *)text{
    
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:text
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    alert = nil;
    
}


@end
