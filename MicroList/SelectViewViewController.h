//
//  SelectViewViewController.h
//  MicroList
//
//  Created by Mac on 15/11/12.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectViewViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *nickName;
@property (weak, nonatomic) IBOutlet UILabel *sex;
@property (weak, nonatomic) IBOutlet UILabel *area;
@property (weak, nonatomic) IBOutlet UILabel *signature;
- (IBAction)submitButton:(UIButton *)sender;



@property (weak, nonatomic) IBOutlet UIImageView *headPath;
- (IBAction)Photo:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *nicknameTag;
- (IBAction)nickNameButton:(id)sender;



- (IBAction)sexButton:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *sextag;


- (IBAction)areaButton:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *areatag;


@property (weak, nonatomic) IBOutlet UILabel *signaturetag;
- (IBAction)signatureButton:(id)sender;
@end
