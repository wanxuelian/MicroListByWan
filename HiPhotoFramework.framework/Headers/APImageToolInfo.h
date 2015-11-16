//
//  APImageToolInfo.h
//
//  Created by JerryChui on 2015/06/26.
//  Copyright (c) 2015 Appsoon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface APImageToolInfo : NSObject

@property (nonatomic, readonly) NSString *toolName;
@property (nonatomic, strong)   NSString *title;
@property (nonatomic, assign)   BOOL      available;
@property (nonatomic, assign)   CGFloat   dockedNumber;
@property (nonatomic, strong)   NSString *iconImagePath;
@property (nonatomic, readonly) UIImage  *iconImage;
@property (nonatomic, readonly) NSArray  *subtools;
@property (nonatomic, strong) NSMutableDictionary *optionalInfo;


- (NSString*)toolTreeDescription;
- (NSArray*)sortedSubtools;

- (APImageToolInfo*)subToolInfoWithToolName:(NSString*)toolName recursive:(BOOL)recursive;

@end
