//
//  ShangPuTableViewCell.m
//  MyDemos
//
//  Created by Michael on 15-11-9.
//  Copyright (c) 2015年 liguilong. All rights reserved.
//

#import "ShangPuTableViewCell.h"




#define ShangPuNameFont [UIFont systemFontOfSize:15]
#define ShangPuTextFont [UIFont systemFontOfSize:16]
@interface ShangPuTableViewCell()
 /**
  *  头像
  */
 @property(nonatomic,weak)UIImageView *iconView;
 /**
  *  vip图标
  */
 @property(nonatomic,weak)UIImageView *vipView;
 /**
  *  微博昵称
  */
 @property(nonatomic,weak)UILabel *nameLabel;
 /**
  *  配图
  */
 @property(nonatomic,weak)UIImageView *pictureView;
 /**
    34  *  正文
    35  */
 @property(nonatomic,weak)UILabel *textLab;

 @end

@implementation ShangPuTableViewCell

+(ShangPuTableViewCell*)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"ShangPuCell";
    ShangPuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[ShangPuTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
     if (self) {
         //1.添加头像
         UIImageView *img=[[UIImageView alloc]init];
         [self.contentView addSubview:img];
         self.iconView=img;

         //2.添加昵称
         UILabel *namelab=[[UILabel alloc]init];
         //在创建昵称的时候就要告诉它，将来要用15号字体显示
         namelab.font=ShangPuNameFont;
         [self.contentView addSubview:namelab];
         self.nameLabel=namelab;

         //3.vip
         UIImageView  *vipview=[[UIImageView alloc]init];
         vipview.image=[UIImage imageNamed:@"vip"];
         [self.contentView addSubview:vipview];
         self.vipView=vipview;

         //4.正文
         UILabel *textlab=[[UILabel alloc]init];
         //在创建正文的时候就要告诉它，将来要用16号字体显示
         textlab.font=ShangPuTextFont;
         //设置正文在进行显示的时候进行换行
         textlab.numberOfLines=0;
         [self.contentView addSubview:textlab];
         self.textLab=textlab;

         //5.图片
         UIImageView *picture=[[UIImageView alloc]init];
         [self.contentView addSubview:picture];
         self.pictureView=picture;
     }
     return self;
}

-(void)setShangPuFrame:(ShangPuFrame *)shangPuFrame
 {

     _shangPuFrame=shangPuFrame;
     //给子控件赋值数据
     [self settingData];
     //设置子控件的frame
     [self settingFrame];
 }

/**
  *  对子控件的数据进行设置
  */
 -(void)settingData
 {
     //1.设置头像的数据
//     self.iconView.image=[UIImage imageNamed:_shangPuFrame.shangPu.icon];

     //2.设置vip图标的数据
     //判断是否是vip，如果是那么就显示图标，并把字体设置为红色
     //注意这里的判断
//     if (_shangPuFrame.shangPu.vip) {
//         self.vipView.hidden=NO;
// //        [self.textLab setTintColor:[UIColor redColor]];
//         self.nameLabel.textColor=[UIColor redColor];
//     }else
//     {
//         self.vipView.hidden=YES;
         self.nameLabel.textColor=[UIColor blackColor];
//     }


     //所以的vip图标都是一样的，没有必要每次都设置，只需要在构造方法中设置一次就可以了。
    // self.vipView.image=[UIImage imageNamed:@"vip"];

     //3.设置正文内容的数据
     self.textLab.attributedText=[self getAttributeString:_shangPuFrame.shangPu.groupName font:ShangPuTextFont];

     //4.设置配图的数据
//     self.pictureView.image=[UIImage imageNamed:_shangPuFrame.shangPu.image];
     
     

     

     NSString *urlStr= [NSString stringWithFormat:@"http://%@%@",kLoginServer,_shangPuFrame.shangPu.headPath];
     NSURL *url = [NSURL URLWithString:urlStr];
     [self.pictureView sd_setImageWithURL:url];
     
//     self.pictureView.image = [UIImage imageNamed:@"icon01.jpg"];
     
     //5.设置微博昵称数据
     self.nameLabel.text=_shangPuFrame.shangPu.groupName;
 }

-(NSMutableAttributedString *) getAttributeString:(NSString *) str font:(UIFont *)font
{
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:str];
    
    NSRange allRange = [str rangeOfString:str];
    [attrStr addAttribute:NSFontAttributeName
                    value:font
                    range:allRange];
    [attrStr addAttribute:NSForegroundColorAttributeName
                    value:[UIColor blackColor]
                    range:allRange];
    NSString *tagStr = @"京东自营";
    NSRange destRange = [str rangeOfString:tagStr];
    [attrStr addAttribute:NSForegroundColorAttributeName
                    value:[UIColor redColor]
                    range:destRange];
    return attrStr;
    
}


 /**
  *  设置子控件的Frame
  */
 -(void)settingFrame
 {
     //1.设置头像的frame

     self.iconView.frame=_shangPuFrame.iconF;

     //2.设置微博昵称的frame
     self.nameLabel.frame=_shangPuFrame.nameF;

     //3.设置vip图标的frame
     self.vipView.frame=_shangPuFrame.vipF;
     
     //4.设置正文的frame
     self.textLab.frame=_shangPuFrame.textF;
     
     //5.设置配图的frame
     
     if (_shangPuFrame.shangPu.headPath) {
         self.pictureView.frame=_shangPuFrame.pictureF;
     }
 }




- (CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize
{
     NSDictionary *dict = @{NSFontAttributeName : font};
     // 如果将来计算的文字的范围超出了指定的范围,返回的就是指定的范围
     // 如果将来计算的文字的范围小于指定的范围, 返回的就是真实的范围
     CGSize size =  [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
     return size;
 }


@end
