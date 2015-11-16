//
//  MassageViewCell.m
//  WeChat
//
//  Created by mac on 15-8-11.
//  Copyright (c) 2015年 wxhl. All rights reserved.
//

#import "MassageViewCell.h"
#import "MessageModel.h"
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
@implementation MassageViewCell

{
    //子视图
    UIImageView *_userImg;//用户图像
    UIImageView *_bgImg;  //背景视图
    UILabel     *_msgLable;//消息内容

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self _creatSubViews];
    }
    
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

//1.创建子类
- (void)_creatSubViews {

    _userImg = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:_userImg];
    
    _bgImg = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:_bgImg];
    
    
    _msgLable = [[UILabel alloc] initWithFrame:CGRectZero];
    _msgLable.font = [UIFont systemFontOfSize:16];
    _msgLable.textColor = [UIColor blackColor];
    [self.contentView addSubview:_msgLable];
    
    
    //self.selectionStyle = UITableViewCellSelectionStyleNone;
    
}


//2.加载数据

- (void)setModel:(MessageModel *)model {

    if (_model != model) {
        _model = model;
    }
    
    //用户头像
    UIImage *userIcon = [UIImage imageNamed:_model.icon];
    _userImg.image = userIcon;
    _userImg.backgroundColor = [UIColor clearColor];
    //背景图片
    UIImage *img1 = [UIImage imageNamed:@"chatfrom_bg_normal"];
    UIImage *img2 = [UIImage imageNamed:@"chatto_bg_normal"];
    
    //三目运算符
    
    UIImage *img = _model.isSelf ? img2 : img1;
    
    img = [img stretchableImageWithLeftCapWidth:img.size.width * 0.5 topCapHeight:img.size.height * 0.7];
    
    _bgImg.image = img;
    _bgImg.backgroundColor = [UIColor clearColor];
    
    //显示内容
    _msgLable.text = _model.content;
    _msgLable.backgroundColor = [UIColor clearColor];
    _msgLable.numberOfLines = 0;
    //开始渲染视图
    [self setNeedsLayout];
}

//3.渲染子视图
- (void)layoutSubviews {

    [super layoutSubviews];
    
    
    UIFont *font = [UIFont systemFontOfSize:16];
    
    //设置分割方式
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    
    NSDictionary *attrDic = @{
                              NSFontAttributeName : font,
                              
                              NSParagraphStyleAttributeName : paragraph
                              
                              };
    
  CGRect rect = [_model.content boundingRectWithSize:CGSizeMake(200, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrDic context:nil];
    
    
    if (_model.isSelf) {//自己发送的
        
        _userImg.frame = CGRectMake(kScreenWidth - 70, 10, 40, 40);
        _bgImg.frame = CGRectMake(kScreenWidth - 290 , 10, 220, rect.size.height + 30);
        _msgLable.frame = CGRectMake(kScreenWidth - 270, 22, 180, rect.size.height);
        
    }else {
    
        _userImg.frame = CGRectMake(10, 10, 40, 40);
        _bgImg.frame = CGRectMake(40 , 10, 220, rect.size.height + 30);
        _msgLable.frame = CGRectMake(70, 25, 180, rect.size.height);
    }
    
    
}


@end
