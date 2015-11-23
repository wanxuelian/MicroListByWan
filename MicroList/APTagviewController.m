//
//  APTagviewController.m
//  HiPhotoSample
//
//  Created by JerryChui on 4/27/15. Email:strawcrop@qq.com
//  Copyright (c) 2015 Appsoon. All rights reserved.
//

#import "APTagviewController.h"

#import "APTextTagModel.h"

#import "APAudioTagModel.h"

#import "APLocationModel.h"

#import "MJExtension.h"

#import "PrintObject.h"

#import "AFNetworking.h"
#import "TopGTypeModel.h"
#import "MainsViewController.h"


@interface APTagviewController ()

@end

@implementation APTagviewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //提交上传按钮
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"提交" style:UIBarButtonItemStylePlain target:self action:@selector(postBtnClicked)];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
}

//上传按钮点击方法
- (void)postBtnClicked{

 
    
    if (self.textTagModelArray.count > 0 || self.audioTagModelArray.count > 0 || self.locationTagModelArray.count ) {
        //获得key
        NSString *showStr = [self creatModelLabel];
        NSString *key = @"LkLA4m9NH0ukVOErmVWOeswv05V9bevfgpDIyWnJPB0=";
        NSLog(@"XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX%@",showStr);

        NSString *urlText = [NSString stringWithFormat:@"http://%@/friendShow/ShowAdd?key=%@&showNote=%@", kLoginServer, key, showStr];
        NSLog(@"%@",key);
        NSLog(@"%@", urlText);
        [self sendPhoto:urlText prams:nil];

    }else{
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"请至少添加一种标签";
        hud.margin = 10.f;
        hud.yOffset = 150.f;
        hud.removeFromSuperViewOnHide = NO;
        [hud hide:YES afterDelay:1];
//        [MBProgressHUD showText:@"xx"];
//        [MBProgressHUD showText:@"请至少添加一种标签"];
    }
    
    
}
/*
*上传方法
*/
- (void)sendPhoto:(NSString *)url prams:(NSMutableDictionary *) param{
    //loading
//    [MBProgressHUD loading];
    
    
    
    
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];//这个有时必须设置
    
    AFHTTPRequestOperation *operation = [manager POST:url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        APFormData *formDataImage = [[APFormData alloc] init];
        UIImage *image = self.hiPhotoImage;
        //1.随即图片参数名
        int NUMBER_OF_CHARS = 26;
        char data[NUMBER_OF_CHARS];
        for (int x=0;x<NUMBER_OF_CHARS;data[x++] = (char)('A' + (arc4random_uniform(26))));
        NSString *randomStr = [[NSString alloc] initWithBytes:data length:NUMBER_OF_CHARS encoding:NSUTF8StringEncoding];
        //2.日期
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *dataStr = [formatter stringFromDate:[NSDate date]];
        formDataImage.data = UIImageJPEGRepresentation(image, 0.5);
        NSString *imgId = [NSString stringWithFormat:@"%@%@", dataStr,randomStr];
        NSString *fileName = [NSString stringWithFormat:@"%@.jpg", imgId];
        [formData appendPartWithFileData:formDataImage.data name:@"file" fileName:fileName mimeType:@"image/jpeg"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"成功发布" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
        
        NSLog(@"成功");
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"失败");
    }];
    
    
    
    
//    [APHttpTool postWithURL:url params:params formDataArray:formDataArray success:^(id json) {
//        
//        
//        [MBProgressHUD hideHUD];
//        if ([self.delegate respondsToSelector:@selector(didPostSuceed:)]) {
//            [self.delegate didPostSuceed:self];
//            NSLog(@"发布成功");
//        }
//        
//    } failure:^(NSError *error) {
//        [MBProgressHUD hideHUD];
//        if ([self.delegate respondsToSelector:@selector(didPostFaild:)]) {
//            [self.delegate didPostFaild:self];
//        }
//        
//        NSLog(@"error:%@",error);
//    }];
    
    
        
//        NSMutableArray *array = dict[@"data"];
//        
//        NowShowModel *model = [[NowShowModel alloc]init];
//        
//        arr = [NSMutableArray array];
//        
//        for (NSDictionary *dict in array) {
//            
//            model.likeNumber = dict[@"lickNumber"];
//            model.dislickNumber = dict[@"dislikeNumber"];
//            model.ImgPath = dict[@"ImgPath"];
//            model.sid = dict[@"sid"];
//            [arr addObject:model];
//            
//        }
        
//    }];
    
    
    
    
    
    
    
    
    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
//    
////    manager.responseSerializer = [AFJSONResponseSerializer serializer];//这个有时必须设置
//    NSLog(@"%@",url);
//    [manager POST:url parameters:paramsDic success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSLog(@"请求成功 数据位:%@",responseObject);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"----------------------%@",operation.responseString);
//        NSLog(@"%@",error);
//        NSLog(@"请求失败");
//    }];
//    
//    
   
    
}

- (NSString *)creatModelLabel {
    //1.文本标签
    NSDictionary *textDic = [NSDictionary dictionaryWithObjectsAndKeys:0, nil];
    //文本dic
    NSMutableArray *dicArray = [NSMutableArray arrayWithObjects:0, nil];
    //存储文本dic的array
    NSString *textTagJson = @"";
    if (self.textTagModelArray.count > 0) {
        for (APTextTagModel *apte in self.textTagModelArray) {
            NSLog(@"%ld,%lf,%lf, %ld, %ld, %@",apte.imgKey,apte.posX, apte.posY, apte.direction, apte.ID, apte.text);
            textDic = [PrintObject getObjectData:apte];
            [dicArray addObject:textDic];
        }
        NSLog(@"%@",dicArray);
        
        NSError *err;
        NSData *jsonDataText = [NSJSONSerialization dataWithJSONObject:dicArray options:NSJSONWritingPrettyPrinted error:&err];
        NSLog(@"%@",jsonDataText);
        
        textTagJson = [[NSString alloc] initWithData:jsonDataText encoding:NSUTF8StringEncoding];
        NSLog(@"jsonStr%@", textTagJson);
        
        
    }
    //2.语音标签
    NSDictionary *audioDic = [NSDictionary dictionaryWithObjectsAndKeys:0, nil];//语音dic
    NSMutableArray *audioArray = [NSMutableArray arrayWithObjects:0, nil];
    //存储语音dic的array
    NSString *audioTagJson = @"";
    if (self.audioTagModelArray.count > 0) {
        for (APAudioTagModel *apAudio in self.audioTagModelArray) {
            NSLog(@"%ld,%lf,%lf, %ld, %ld, %@",apAudio.imgKey,apAudio.posX, apAudio.posY, apAudio.direction, apAudio.ID, apAudio.audioPath);
            audioDic = [PrintObject getObjectData:apAudio];
            [audioArray addObject:audioDic];
        }
        NSLog(@"audioArray%@", audioArray);
        
        NSError *errAudio;
        NSData *jsonDataAudio = [NSJSONSerialization dataWithJSONObject:audioDic options:NSJSONWritingPrettyPrinted error:&errAudio];
        audioTagJson = [[NSString alloc] initWithData:jsonDataAudio encoding:NSUTF8StringEncoding];
        NSLog(@"audioTagJson%@", audioTagJson);
        
    }
    //3.地理标签
    NSDictionary *locationDic = [NSDictionary dictionaryWithObjectsAndKeys:0, nil];//地理dic
    NSMutableArray *locationArray = [NSMutableArray arrayWithObjects:0, nil];
    //存储地理dic的array
    NSString *locationTagJson = @"";
    if (self.locationTagModelArray.count > 0) {
        for (APLocationModel *location in self.locationTagModelArray) {
            
            NSLog(@"%ld,%f,%f, %f, %f, %ld, %ld, %@",location.imgKey,location.posX, location.posY, location.locationX, location.locationY, location.direction, location.ID, location.text);
            
            locationDic = [PrintObject getObjectData:location];
            [locationArray addObject:locationDic];
        }
        NSLog(@"%@",locationArray);
        NSError *errLocation;
        NSData *locationData = [NSJSONSerialization dataWithJSONObject:locationArray options:NSJSONWritingPrettyPrinted error:&errLocation];
        locationTagJson = [[NSString alloc] initWithData:locationData encoding:NSUTF8StringEncoding];
        NSLog(@"locationTagJson%@",locationTagJson);
        
    }
    
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    /*=======================图片====================*/
    //1.随机图片名参数
    int NUMBER_OF_CHARS = 26;
    char data[NUMBER_OF_CHARS];
    for (int x=0;x<NUMBER_OF_CHARS;data[x++] = (char)('A' + (arc4random_uniform(26))));
    NSString *randomStr = [[NSString alloc] initWithBytes:data length:NUMBER_OF_CHARS encoding:NSUTF8StringEncoding];
    //2.日期
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyyMMddHHmmss";
    NSString *dataStr = [formatter stringFromDate:[NSDate date]];
    //3.imgid
    NSString *imgId = [NSString stringWithFormat:@"%@%@", dataStr,randomStr];
    NSString *fileName = [NSString stringWithFormat:@"%@.jpg", imgId];
    // 4.封装文件参数
    NSMutableArray *formDataArray = [NSMutableArray array];
    
    // 5.封装图片文件参数
    APFormData *formData = [[APFormData alloc] init];
    UIImage *image = self.hiPhotoImage;
    formData.data = UIImageJPEGRepresentation(image, 0.5);
    formData.name = @"image";
    formData.mimeType = @"image/jpeg";
    formData.filename = fileName;
    NSLog(@" 参数名%@, 文件类型%@, 文件名%@", formData.name, formData.mimeType, formData.filename);
    [formDataArray addObject:formData];
    /*=====================音频======================*/
    //封装Audio
    for (NSString *voicePath in self.fileArray) {
        NSString *audioDateStr = [formatter stringFromDate:[NSDate date]];
        NSString *audioFilename = [NSString stringWithFormat:@"%@.amr", audioDateStr];
        NSData *audata = [NSData dataWithContentsOfFile:voicePath];
        if (audata != nil) {
            APFormData *audioData = [[APFormData alloc] init];
            audioData.data = audata;
            audioData.name = @"audio";
            audioData.mimeType = @"audio/amr";
            audioData.filename = audioFilename;
            //            [formDataArray addObject:audioData];
        }
        
    }
    
    TopGTypeModel *topModelTag = [TopGTypeModel sharedTopGTypeModel];
    //参数
    params[@"gType"] = [NSString stringWithFormat:@"%ld",topModelTag.buttonTag - 100];
    params[@"textTag"] = textTagJson;
    params[@"audioTag"] = audioTagJson;
    params[@"locationTag"] = locationTagJson;
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    [array addObject:params];
    
    NSData *dataParms = [NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:nil];
    NSString *dataLabelText = [dataParms base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    NSString *datasss = [[NSString alloc] initWithData:dataParms encoding:NSUTF8StringEncoding];
    NSLog(@"%@",datasss);
    NSLog(@"%@",dataLabelText);
    
    
    
    return dataLabelText;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
