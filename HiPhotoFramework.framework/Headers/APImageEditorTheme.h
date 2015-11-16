//
//  APImageEditorTheme.h
//
//  Created by JerryChui on 2015/06/05.
//  Copyright (c) 2015 Appsoon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol APImageEditorThemeDelegate;

@interface APImageEditorTheme : NSObject

@property (nonatomic, weak) id<APImageEditorThemeDelegate> delegate;
@property (nonatomic, strong) NSString *bundleName;
@property (nonatomic, strong) UIColor  *backgroundColor;
@property (nonatomic, strong) UIColor  *toolbarColor;
@property (nonatomic, strong) NSString *toolIconColor;
@property (nonatomic, strong) UIColor  *toolbarTextColor;
@property (nonatomic, strong) UIColor  *toolbarSelectedButtonColor;
@property (nonatomic, strong) UIFont   *toolbarTextFont;

+ (APImageEditorTheme*)theme;

@end


@protocol APImageEditorThemeDelegate <NSObject>
@optional
- (UIActivityIndicatorView*)imageEditorThemeActivityIndicatorView;

@end
