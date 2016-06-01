//
//  ViewController.m
//  AFNetDemo
//
//  Created by happi on 16/6/1.
//  Copyright © 2016年 happi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    WF_UserService *uSer = [[WF_UserService alloc] init];
    /*
    [uSer getMallSuccess:^(NSDictionary *result) {
        NSLog(@"------->成功了");
    } failure:^(NSError *error) {
        
    }];*/
    /*
    [uSer shequCollectAid:@"173" Type:@"add" Success:^(NSDictionary *result) {
        NSLog(@"----》又成功了");
    } failure:^(NSError *error) {
        
    }];*/
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
