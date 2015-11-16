//
//  PhotoAvatCollectionViewCell.m
//  MicroList
//
//  Created by 黄相杰 on 15/10/17.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "PhotoAvatCollectionViewCell.h"
#import "LastDymnaicController.h"

@implementation PhotoAvatCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        CGRect rect = [[UIScreen mainScreen] bounds];
        self.nameAvaterView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, rect.size.width / 2 - 20, rect.size.height/4)];
        self.photoImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 40 , rect.size.width / 2 - 20, rect.size.height/4 - 40)];
        self.photoImage.userInteractionEnabled = YES;
        self.nameAvaterView.userInteractionEnabled = YES;

        self.photoImage.image = [UIImage imageNamed:@"1.png"];
        
        [self.nameAvaterView addSubview:self.photoImage];
        
        self.avatarB = [UIButton buttonWithType:UIButtonTypeSystem];
        self.avatarB.frame = CGRectMake(0, 0, 40, 40);
        self.avatarB.backgroundColor = [UIColor redColor];
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.avatarB.frame.size.width + 10, 0, self.nameAvaterView.frame.size.width - 10 - self.avatarB.frame.size.width, 40)];
        self.nameLabel.backgroundColor = [UIColor yellowColor];
        [self.nameAvaterView addSubview:self.avatarB];
        [self.nameAvaterView addSubview:self.nameLabel];
        
        [self addSubview:self.nameAvaterView];
        
    }
    return self;
}


@end
