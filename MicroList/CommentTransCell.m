//
//  CommentTransCell.m
//  MicroList
//
//  Created by sks on 15/11/4.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "CommentTransCell.h"

@implementation CommentTransCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self _loadSubView];
    }
    return self;
}



- (void)_loadSubView{


    self.avatArray = @[@"picture2",@"picture3", @"picture4", @"picture5", @"picture6"];
    
    CGRect rect = [[UIScreen mainScreen] bounds];
    self.photoAvat = [UIButton buttonWithType:UIButtonTypeCustom];
    self.photoAvat.frame = CGRectMake(10, 10, 50, 50);
    [self.photoAvat setBackgroundImage:[UIImage imageNamed:@"picture7"] forState:UIControlStateNormal];
    self.photoAvat.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.photoAvat];
    
    
    
    self.photoName = [[UILabel alloc] initWithFrame:CGRectMake(self.photoAvat.frame.size.width + 15, 10, 50, 30)];
    self.photoName.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.photoName];
    
    
    
    self.topTabel = [UIButton buttonWithType:UIButtonTypeCustom];
    self.topTabel.frame = CGRectMake(self.photoAvat.frame.size.width + 15, self.photoName.frame.size.height + 10, 50, 20);
    self.topTabel.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.topTabel];
    
    
    self.imageScenery = [[UIImageView alloc] initWithFrame:CGRectMake(10, self.photoAvat.frame.size.height + 20, rect.size.width - 20, 250)];
    self.imageScenery.image =[UIImage imageNamed:@"picture12"];
    self.imageScenery.backgroundColor = [UIColor yellowColor];
    [self addSubview:self.imageScenery];
    
    
    int a = 0;
    
    for (int i = 0; i <5; i++) {
        
        self.smallAvatar = [UIButton buttonWithType:UIButtonTypeCustom];
        self.smallAvatar.frame = CGRectMake(10 + a, self.imageScenery.frame.size.height + 80, 20, 20);
        [self.smallAvatar setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", self.avatArray[i]]] forState:UIControlStateNormal];
        self.smallAvatar.backgroundColor = [UIColor blueColor];
        [self addSubview:self.smallAvatar];
        
        
        
        a = a + 30;
    }
    
    
    self.zamB = [UIButton buttonWithType:UIButtonTypeSystem];
    self.zamB.frame = CGRectMake(10, self.imageScenery.frame.size.height + 110 , 40, 28);
    
    [self.zamB setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    self.zamB.backgroundColor = [UIColor redColor];
    [self addSubview:self.zamB];
    
    
    self.badB = [UIButton buttonWithType:UIButtonTypeCustom];
    self.badB.frame = CGRectMake(self.zamB.frame.size.width + 15, self.imageScenery.frame.size.height + 110 , 40, 28);
    self.badB.backgroundColor = [UIColor blackColor];
    [self addSubview:self.badB];
    
    
    self.commentB = [UIButton buttonWithType:UIButtonTypeSystem];
    self.commentB.frame = CGRectMake(rect.size.width - 55, self.imageScenery.frame.size.height + 110, 50, 25);
    [self.commentB setTitle:@"评论" forState:UIControlStateNormal];
    [self addSubview:self.commentB];

}

//- (void)CommentTextField {
////    CGRect rect = [[UIScreen mainScreen] bounds];
////    UITextField *commentField = [[UITextField alloc] initWithFrame:CGRectMake(0, rect.size.height - 40, rect.size.width, rect.size.height - rect.size.height *17 / 18)];
////    
////    commentField.backgroundColor = [UIColor whiteColor];
////    commentField.delegate = self;
////    commentField.layer.cornerRadius = 5.0;
////    
////    [self addSubview:self.commentField];
////    
////    
////    self.sendButton.layer.cornerRadius = 5.0;
////    [self.sendButton setTitle:@" 发送" forState:UIControlStateNormal];
////    [self.sendButton addTarget:self action:@selector(sendNews) forControlEvents:UIControlEventTouchUpInside];
////    self.sendButton.backgroundColor = [UIColor blueColor];
////    [self.view addSubview:self.sendButton];
////    
////    [self creatTableViewComment];
//    
//
//    
//}


@end
