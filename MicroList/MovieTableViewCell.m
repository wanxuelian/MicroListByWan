//
//  MovieTableViewCell.m
//  MicroList
//
//  Created by sks on 15/10/27.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "MovieTableViewCell.h"

@implementation MovieTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect rect = [[UIScreen mainScreen] bounds];
        UIImageView *imageMovie = [[UIImageView alloc] initWithFrame:CGRectMake(5, 0, rect.size.width * 1 / 4, rect.size.height * 1 / 5)];
        imageMovie.image = [UIImage imageNamed:@"1"];
        [self addSubview:imageMovie];
        
        UILabel *movieLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imageMovie.frame) + 5, 0, rect.size.width * 1 / 2, 35)];
        movieLabel.text = @"电影";
        [self addSubview:movieLabel];
        
        UILabel *introduce = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageMovie.frame) + 5, rect.size.width, 70)];
        introduce.backgroundColor = [UIColor yellowColor];
        [self addSubview:introduce];
        
        
    }
    
    
    return self;
    
    
}

@end
