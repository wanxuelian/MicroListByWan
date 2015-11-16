//
//  APImageEditorViewController.h
//
//  Created by JerryChui on 2015/06/05.
//  Copyright (c) 2015 Appsoon. All rights reserved.
//

#import "APImageEditor.h"

@protocol APImageEditorViewControllerDelegate <NSObject>

@optional

- (void)didTapedWapCancleBtn;

- (void)didTapedWapDoneBtnWithImage:(UIImage *) image;

@end


@interface APImageEditorViewController : APImageEditor
<UIScrollViewDelegate, UIBarPositioningDelegate>
{
    IBOutlet __weak UINavigationBar *_navigationBar;
    IBOutlet __weak UIScrollView *_scrollView;
}
@property (nonatomic, strong) UIImageView  *imageView;

@property (nonatomic, weak) IBOutlet UIScrollView *menuView;

@property (nonatomic, readonly) UIScrollView *scrollView;

@property (nonatomic, assign) NSInteger toolIndex;

@property (nonatomic, weak) id<APImageEditorViewControllerDelegate> singal;

- (IBAction)pushedCloseBtn:(id)sender;
- (IBAction)pushedFinishBtn:(id)sender;


- (id)initWithImage:(UIImage*)image;


- (void)fixZoomScaleWithAnimated:(BOOL)animated;


- (void)resetZoomScaleWithAnimated:(BOOL)animated;




@end



