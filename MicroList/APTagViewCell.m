//
//  APTagViewCell.m
//  HiPhotoSample
//
//  Created by JerryChui on 5/30/15.
//  Copyright (c) 2015 Appsoon. All rights reserved.
//

#import "APTagViewCell.h"

#import <HiPhotoFramework/HiPhotoFramework.h>

#import "MJExtension.h"

#import "APImgModel.h"

#import "APTextTagModel.h"

#import "APAudioTagModel.h"

#import "APLocationModel.h"



@interface APTagViewCell ()<APOpenTagViewDelegate>

@property (weak, nonatomic) APOpenTagView *tagViewCell;


@end

@implementation APTagViewCell


+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"photocells";
    APTagViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[APTagViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
    
}



- (void)layoutSubviews{
    [super layoutSubviews];
    APOpenTagView *tagViewCell = [[APOpenTagView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.width)];
    
    tagViewCell.delegate = self;
    
    [self.contentView addSubview:tagViewCell];
    
    self.tagViewCell = tagViewCell;
    
    
}

- (void)setImgID:(NSString *)imgID{
    //1.请求
    [self getImgeDetailByImgID:imgID];
}


- (void)getImgeDetailByImgID:(NSString *) imgID{
    
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"imgID"] = imgID;
    [APHttpTool postWithURL:@"http://182.92.104.143:8080/HiPhotoServer/mobile/getPhotoTagByImgID.htm" params:params success:^(id json) {
        NSLog(@"%@",json);
        id data = json[@"data"];
        //1.图片
        APImgModel *imgModel = [APImgModel objectWithKeyValues:data[@"img"]];
        self.tagViewCell.imgModel = imgModel;
        //2.文本标签
        NSArray *textModelArray = [APTextTagModel objectArrayWithKeyValuesArray:data[@"textTag"]];
        for (APTextTagModel *textModel in textModelArray) {
            self.tagViewCell.textTagModel = textModel;
        }
        //3.语音标签
        NSArray *audioModelArray = [APAudioTagModel objectArrayWithKeyValuesArray:data[@"audioTag"]];
        for (APAudioTagModel *audioModel in audioModelArray) {
            self.tagViewCell.audioTagModel = audioModel;
        }
        //4.地理标签
        NSArray *locationModelArray = [APLocationModel objectArrayWithKeyValuesArray:data[@"locationTag"]];
        for (APLocationModel *locationModel in locationModelArray) {
            self.tagViewCell.locationTagModel = locationModel;
        }
        
        
    } failure:^(NSError *error) {
        
        NSLog(@"error:%@",error);
        
    }];
}



- (void)awakeFromNib {
    // Initialization code
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
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















