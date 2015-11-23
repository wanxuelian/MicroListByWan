//
//  CommentHeaderView.m
//  MicroList
//
//  Created by sks on 15/11/5.
//  Copyright (c) 2015年 黄相杰. All rights reserved.
//

#import "CommentHeaderView.h"

#import "NowShowDataModel.h"

#import <HiPhotoFramework/HiPhotoFramework.h>

#import "MJExtension.h"

#import "APImgModel.h"

#import "APTextTagModel.h"

#import "APAudioTagModel.h"

#import "APLocationModel.h"

#import "PrintObject.h"


@interface CommentHeaderView ()<APOpenTagViewDelegate>

@property (weak, nonatomic) APOpenTagView *tagApoenShowView;//图片展示类


@end



@implementation CommentHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self _loadSubView];

    }
    return self;
}


- (void)getData{





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
    
    
    APOpenTagView *imageSceneryView = [[APOpenTagView alloc] initWithFrame:CGRectMake(10, self.photoAvat.frame.size.height + 20, rect.size.width - 20, 400)];
    imageSceneryView.delegate = self;
    //    imageScenery.image =[UIImage imageNamed:@"picture12"];
    [self addSubview:imageSceneryView];
    self.tagApoenShowView = imageSceneryView;
    
    
    int a = 0;
    
    for (int i = 0; i <5; i++) {
        
        self.smallAvatar = [UIButton buttonWithType:UIButtonTypeCustom];
        self.smallAvatar.frame = CGRectMake(10 + a, imageSceneryView.frame.size.height + 40, 20, 20);
        [self.smallAvatar setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", self.avatArray[i]]] forState:UIControlStateNormal];
        self.smallAvatar.backgroundColor = [UIColor blueColor];
        [self addSubview:self.smallAvatar];
        
        
        
        a = a + 30;
    }
    
    
    self.zamB = [UIButton buttonWithType:UIButtonTypeSystem];
    self.zamB.frame = CGRectMake(10, imageSceneryView.frame.size.height + 70 , 40, 28);
    
    [self.zamB setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    self.zamB.backgroundColor = [UIColor redColor];
    [self addSubview:self.zamB];
    
    
    self.badB = [UIButton buttonWithType:UIButtonTypeCustom];
    self.badB.frame = CGRectMake(self.zamB.frame.size.width + 15, imageSceneryView.frame.size.height + 70 , 40, 28);
    self.badB.backgroundColor = [UIColor blackColor];
    [self addSubview:self.badB];
    
    
    self.commentB = [UIButton buttonWithType:UIButtonTypeSystem];
    self.commentB.frame = CGRectMake(rect.size.width - 55, imageSceneryView.frame.size.height + 70, 50, 25);
    [self.commentB setTitle:@"评论" forState:UIControlStateNormal];
    [self addSubview:self.commentB];
    

}


-(void)setModelNowShow:(NowShowDataModel *)modelNowShow {
    if (_modelNowShow != modelNowShow) {
        _modelNowShow = modelNowShow;
        
    }
    
    NSLog(@"添加图片%@",modelNowShow.imgModel);
    
    self.tagApoenShowView.imgModel = modelNowShow.imgModel;//添加图片
    //    1.文本
    NSLog(@"%@",modelNowShow.textNowModelArray);
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    for (NSString *str in modelNowShow.textNowModelArray) {
        NSData *jsonData = [str dataUsingEncoding:NSUTF8StringEncoding];
        NSError *err;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                            options:NSJSONReadingMutableContainers
                                                              error:&err];
        NSLog(@"%@",dic);
        [array addObject:dic];
    }
    NSLog(@"array%@", array);
    NSArray *arrayTextss= [NSArray arrayWithArray:array];
    NSLog(@"arrayTextss%@",arrayTextss[0]);
    NSArray *textModelArray = [APTextTagModel objectArrayWithKeyValuesArray:arrayTextss[0]];//必须是NSArray,这里采用了NSArray里存在NSMutableArray;并且只有一个NSMUtableArray所以直接使用下标0;
    
    
    NSLog(@"textModelArray%@",textModelArray);
    for (APTextTagModel *textModel in textModelArray) {
        NSLog(@"添加文本%@",textModel);
        self.tagApoenShowView.textTagModel = textModel;//添加文本
    }
    //2.语音
    NSArray *audioNowModelArray = [APTextTagModel objectArrayWithKeyValuesArray:modelNowShow.audioNowModelArray];
    for (APAudioTagModel *audioModel in audioNowModelArray) {
        self.tagApoenShowView.audioTagModel = audioModel;//添加音频
    }
    //3.地理
    NSArray *locationModelArray = [APTextTagModel objectArrayWithKeyValuesArray:modelNowShow.locationModelArray];
    for (APLocationModel *locationModel in locationModelArray) {
        self.tagApoenShowView.locationTagModel = locationModel;//添加地理文本
    }
    
    
}
- (void)didTextTagViewClicked:(APTextTagModel *)textTagModel{
    NSLog(@"didTextTagViewClicked");
}

- (void)didAudioTagViewClicked:(APAudioTagModel *)audioTagModel{
    NSLog(@"didAudioTagViewClicked");
}

- (void)didLocationTagViewClicked:(APLocationModel *)locationModel{
    NSLog(@"didLocationTagViewClicked");
}




@end
