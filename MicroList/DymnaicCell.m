//
//  DymnaicCell.m
//  MicroList
//
//  Created by 黄相杰 on 15/10/15.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "DymnaicCell.h"

@implementation DymnaicCell



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        
        [self _loadSubView];
        
    }
    
    return self;
}


- (void)_loadSubView{

    self.avatArray = @[@"picture2",@"picture3", @"picture4", @"picture5", @"picture6"];
    
    CGRect rect = [[UIScreen mainScreen] bounds];
    self.photoAvat = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
    [self.photoAvat setBackgroundImage:[UIImage imageNamed:@"picture7"] forState:UIControlStateNormal];
    self.photoAvat.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.photoAvat];
    
    
    
    self.photoName = [[UILabel alloc] initWithFrame:CGRectMake(self.photoAvat.frame.size.width + 15, 10, 50, 30)];
    self.photoName.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.photoName];
    
    
    
    self.topTabel = [[UIButton alloc] initWithFrame:CGRectMake(self.photoAvat.frame.size.width + 15, self.photoName.frame.size.height + 10, 50, 20)];
    self.topTabel.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.topTabel];
    
    
    self.imageScenery = [[UIImageView alloc] initWithFrame:CGRectMake(10, self.photoAvat.frame.size.height + 20, rect.size.width - 20, 250)];
    self.imageScenery.image =[UIImage imageNamed:@"picture12"];
    self.imageScenery.backgroundColor = [UIColor yellowColor];
    [self addSubview:self.imageScenery];
    
    
    int a = 0;
    
    for (int i = 0; i <5; i++) {
        
        self.smallAvatar = [[UIButton alloc] initWithFrame:CGRectMake(10 + a, self.imageScenery.frame.size.height + 80, 20, 20)];
        [self.smallAvatar setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", self.avatArray[i]]] forState:UIControlStateNormal];
        self.smallAvatar.backgroundColor = [UIColor blueColor];
        [self addSubview:self.smallAvatar];
        
        
        
        a = a + 30;
    }
    
    
    self.zamB = [[UIButton alloc] initWithFrame:CGRectMake(10, self.imageScenery.frame.size.height + 110 , 40, 28)];
    [self.zamB setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    self.zamB.backgroundColor = [UIColor redColor];
    [self addSubview:self.zamB];
    
    
    self.badB = [[UIButton alloc] initWithFrame:CGRectMake(self.zamB.frame.size.width + 15, self.imageScenery.frame.size.height + 110 , 40, 28)];
    self.badB.backgroundColor = [UIColor blackColor];
    [self addSubview:self.badB];
    
    


}

- (void)setModel:(NowShowModel *)model{

    if (_model != model) {
        
        _model = model;
        
        
    }

}


@end
