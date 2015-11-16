//
//  APImageEditor.h
//
//  Created by JerryChui on 2015/06/17.
//  Copyright (c) 2015 Appsoon. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "APImageToolInfo.h"

#import "APImageEditorTheme.h"

@protocol APImageEditorDelegate;
@protocol APImageEditorTransitionDelegate;

@interface APImageEditor : UIViewController
{
    
}
@property (nonatomic, weak) id<APImageEditorDelegate> delegate;
@property (nonatomic, readonly) APImageEditorTheme *theme;
@property (nonatomic, readonly) APImageToolInfo *toolInfo;

- (id)initWithImage:(UIImage*)image;
- (id)initWithImage:(UIImage*)image delegate:(id<APImageEditorDelegate>)delegate;
- (id)initWithDelegate:(id<APImageEditorDelegate>)delegate;

- (void)showInViewController:(UIViewController<APImageEditorTransitionDelegate>*)controller withImageView:(UIImageView*)imageView;

@end



@protocol APImageEditorDelegate <NSObject>
@optional
- (void)imageEditor:(APImageEditor*)editor didFinishEdittingWithImage:(UIImage*)image;
- (void)imageEditorDidCancel:(APImageEditor*)editor;

@end


@protocol APImageEditorTransitionDelegate <APImageEditorDelegate>
@optional
- (void)imageEditor:(APImageEditor*)editor willDismissWithImageView:(UIImageView*)imageView canceled:(BOOL)canceled;
- (void)imageEditor:(APImageEditor*)editor didDismissWithImageView:(UIImageView*)imageView canceled:(BOOL)canceled;

@end

