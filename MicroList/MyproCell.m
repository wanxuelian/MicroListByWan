//
//  MyproCell.m
//  MicroList
//
//  Created by Mac on 15/10/27.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "MyproCell.h"
#import "UIImageView+WebCache.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height


@implementation MyproCell




- (UIImageView *)imgView{

    if(_imgView == nil){
    
        _imgView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _imgView.contentMode = UIViewContentModeScaleAspectFill;
        _imgView.backgroundColor = [UIColor yellowColor];
        [self addSubview:_imgView];
    
    }

    return _imgView;
}


- (UILabel *)titleLable{
    
    if (_titleLable == nil) {
        
        _titleLable = [[UILabel alloc]initWithFrame:CGRectZero];
        _titleLable.font = [UIFont systemFontOfSize:18];
        
        _titleLable.textAlignment = NSTextAlignmentLeft;
//        _titleLable.backgroundColor = [UIColor yellowColor];
        [self addSubview:_titleLable];

    }

    return _titleLable;

}


- (UILabel *)detailLable{


    if (_detailLable == nil) {
        
        _detailLable = [[UILabel alloc]initWithFrame:CGRectZero];
        _detailLable.font = [UIFont systemFontOfSize:13];
        _detailLable.textAlignment = NSTextAlignmentRight;
//        _detailLable.backgroundColor = [UIColor yellowColor];
        [self addSubview:_detailLable];
        
        
    }
    return _detailLable;

}

- (UIImageView *)personImg{

    if (_personImg == nil) {
        
        _personImg = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 60, 60)];
        _personImg.contentMode = UIViewContentModeScaleAspectFill;
//        _personImg.backgroundColor = [UIColor yellowColor];
        [self addSubview:_personImg];
        
        
    }
    return _personImg;

}



- (void)layoutSubviews{

    [super layoutSubviews];
    

    /*
    _imgView.frame = CGRectMake(10, 5, 30, 30);
    
    
    if (_detailLable != nil) {
        
        _titleLable.frame = CGRectMake(60, 5, 100, 30);
        _detailLable.frame = CGRectMake(kScreenWidth - 110, 5, 70, 30);
        
    }else if (_imgView == nil && _detailLable == nil) {
        
        _titleLable.frame = CGRectMake(0, 0, self.bounds.size.width, 40);
        
        
    }else if (_detailLable == nil){
    
       _titleLable.frame = CGRectMake(60, 5, 100, 30);
        
    }else if (_imgView == nil && _detailLable != nil) {
    
        _titleLable.frame = CGRectMake(0, 5, 100, 30);
        _detailLable.frame = CGRectMake(kScreenWidth - 110, 5, 70, 30);
        
        
    }else{
        
        
         _titleLable.frame = CGRectMake(0, 5, 100, 30);
    
    
    }
    */
    
    
    _imgView.frame = CGRectMake(10, 5, 30, 30);
    _titleLable.frame = CGRectMake(60, 5, 130, 30);
    _detailLable.frame = CGRectMake(kScreenWidth - 110, 5, 70, 30);
    
    if (_imgView == nil && _detailLable != nil) {
        
        _titleLable.frame = CGRectMake(10, 5, 130, 30);
        _detailLable.frame = CGRectMake(kScreenWidth - 110, 5, 70, 30);

        
    }else if (_detailLable == nil && _imgView == nil){
    
         _titleLable.frame = CGRectMake(140, 5, 100, 30);
        
    
    }
    
    
    
    
    
    
    
    
    

    
    
    
}








@end
