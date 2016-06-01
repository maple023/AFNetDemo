//
//  WF_UserService.m
//  AFNetDemo
//
//  Created by happi on 16/6/1.
//  Copyright © 2016年 happi. All rights reserved.
//

#import "WF_UserService.h"

@implementation WF_UserService

- (void)getMallSuccess:(void(^)(NSDictionary *))Success failure:(void(^)(NSError *))failure {
    NSString *methodName = @"index";
    [self GET:methodName Success:^(NSDictionary *result) {
        Success(result);
    } failure:^(NSError *error) {
        failure(error);
    }];
    
}

- (void)shequCollectAid:(NSString *)aid
                   Type:(NSString *)type
                Success:(void(^)(NSDictionary *))Success
                failure:(void(^)(NSError *))failure {
    [self setPostObject:aid andKey:@"aid"];
    [self setPostObject:type andKey:@"type"];
    
    NSString *methodName = @"shequ_collect";
    [self POST:methodName Success:^(NSDictionary *result) {
        Success(result);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

@end
