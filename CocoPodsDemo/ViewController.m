//
//  ViewController.m
//  CocoPodsDemo
//
//  Created by 殷福帅 on 15/12/29.
//  Copyright © 2015年 chl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self downloadData];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)downloadData
{
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    
//    manager.responseSerializer = [AFJSONResponseSerializer serializer];
//    
//    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    
    // 编码
    //NSString *urlEncode = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    //[NSSet setWithObjects:@"text/plain",@"text/json",@"application/json",@"text/javascript",@"text/html",nil];  代表支持所有的接口类型
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"text/json",@"application/json",@"text/javascript",@"text/html",nil];
    //http://iappfree.candou.com:8080/free/applications/limited?currency=rmb&page=%d&category_id=%@
   [manager GET:@"http://gc.ditu.aliyun.com/regeocoding?l=39.938133,116.395739&type=001" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"成功%@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"失败:%@",error);
    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
