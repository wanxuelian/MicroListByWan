//
//  ShangPuFrame.m
//  MyDemos
//
//  Created by Michael on 15-11-10.
//  Copyright (c) 2015年 liguilong. All rights reserved.
//

#import "ShangPuFrame.h"

#define ShangPuNameFont [UIFont systemFontOfSize:15]
#define ShangPuTextFont [UIFont systemFontOfSize:16]
@implementation ShangPuFrame

-(instancetype)init
{
    if (self = [super init]) {
        self.cellWidth = [[UIScreen mainScreen] bounds].size.width;
    }
    
    return self;
}

-(void)setShangPu:(GroupListModel *)shangPu
{
    
    _shangPu=shangPu;

         //1.设置头像的frame
//     CGFloat padding=10;
//     CGFloat iconViewX=padding;
//     CGFloat iconViewY=padding;
//     CGFloat iconViewW=30;
//     CGFloat iconViewH=30;
//
//     self.iconF=CGRectMake(iconViewX, iconViewY, iconViewW, iconViewH);
//
//     //2.设置微博昵称的frame
//     //昵称的X值=头像的最大的x值+padding
//     CGFloat nameLabelX=CGRectGetMaxX(self.iconF)+padding;
//     CGSize nameSize=[self sizeWithString:_shangPu.name font:ShangPuNameFont maxSize:CGSizeMake(MAXFLOAT,MAXFLOAT)];
//     //昵称的Y值=（头像高度-整个文本字体的高度）*0.5+头像的Y值
//     CGFloat nameLableY=(iconViewH-nameSize.height)*0.5+iconViewY;
//     self.nameF=CGRectMake(nameLabelX, nameLableY, nameSize.width, nameSize.height);
//
//     //3.设置vip图标的frame
//     //vip图标的x值=昵称的最大x值+间隙
//     CGFloat vipX=CGRectGetMaxX(self.nameF)+padding;
//     CGFloat vipY=nameLableY;
//     CGFloat vipW=14;
//     CGFloat vipH=14;
//     self.vipF=CGRectMake(vipX, vipY, vipW, vipH);
//
//     //4.设置正文的frame
//     CGFloat textLabX=iconViewX;
//     CGFloat textLabY=CGRectGetMaxY(self.iconF)+padding;
//     CGSize textSize=[self sizeWithString:_shangPu.descript font:ShangPuTextFont maxSize:CGSizeMake(300,MAXFLOAT)];
//     self.textF=CGRectMake(textLabX, textLabY, textSize.width, textSize.height);

     //5.设置配图的frame
     //添加一个变量，来计算行高
     //CGFloat cellHight=0;
     //如果有配图，则行高=配图最大的Y值+padding
     //如果没有配图，则行高=文本最大的Y值+padding
//     if (_shangPu.image) {
//         CGFloat pictureX=iconViewX;
//         CGFloat pictureY=CGRectGetMaxY(self.textF)+padding;
//         CGFloat pictureW=100;
//         CGFloat pictureH=100;
//         self.pictureF=CGRectMake(pictureX, pictureY, pictureW, pictureH);
//         self.cellHight=CGRectGetMaxY(self.pictureF)+padding;
//     }
//     else
//         self.cellHight=CGRectGetMaxY(self.textF)+padding;


    CGFloat padding=10;
    
    //判断是否有图片
    if(_shangPu.headPath)
    {
        CGFloat pictureX=padding;
        CGFloat pictureY=padding;
        CGFloat pictureW=100;
        CGFloat pictureH=100;
        self.pictureF=CGRectMake(pictureX, pictureY, pictureW, pictureH);
        
        CGFloat textLabX= padding + 100 + padding;
        CGFloat textLabY= padding;
        CGSize textSize=[self sizeWithString:_shangPu.groupName font:ShangPuTextFont maxSize:CGSizeMake(self.cellWidth - 3*padding - CGRectGetWidth(self.pictureF),MAXFLOAT)];
        if (textSize.height >= CGRectGetHeight(self.pictureF)) {
            
            pictureY = (textSize.height - pictureH)/2.0 + padding;
            
            self.pictureF = CGRectMake(pictureX, pictureY, pictureW, pictureH);
            self.textF=CGRectMake(textLabX, textLabY, textSize.width, textSize.height);

        }
        else
        {
            
            self.pictureF = CGRectMake(pictureX, pictureY, pictureW, pictureH);
            
            textLabY = (pictureH - textSize.height)/2.0 + padding;
            self.textF=CGRectMake(textLabX, textLabY, textSize.width, textSize.height);
        }
        
        
        self.cellHight = MAX(CGRectGetMaxY(self.pictureF)+padding, textSize.height +padding*2);
        
    }
    else
    {
        
    }
    
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

- (CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize
 {
     NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc]init];
     attrStr = [self getAttributeString:str font:font];
     
     // 如果将来计算的文字的范围超出了指定的范围,返回的就是指定的范围
     // 如果将来计算的文字的范围小于指定的范围, 返回的就是真实的范围
     
     NSStringDrawingOptions options =  NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
     
//     CGSize size =  [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
     
     CGSize size = [attrStr boundingRectWithSize:maxSize options:options context:nil].size;
     
     return size;
 }

@end
