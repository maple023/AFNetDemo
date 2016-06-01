//
//  WF_TransformService.m
//  AFNetDemo
//
//  Created by happi on 16/6/1.
//  Copyright © 2016年 happi. All rights reserved.
//

#import "WF_TransformService.h"

@implementation WF_TransformService

- (id)init{
    if(self = [super init]){
        postDic=[[NSMutableDictionary alloc] initWithCapacity:3];
        paramStr = [[NSMutableString alloc] initWithCapacity:3];
    }
    return self;
}

/**
 *服务器地址
 */
- (NSString *)getServiceUrl {
    int num = 1;//0：内网测试服务器  1：线上地址
    switch (num) {
        case 0:
            return @"http://demo.legendtao1985.com/esapi_v1";
            break;
        case 1:
            return @"http://www.xxxxxx.com/esapi_v1";
            break;
        default:
            return @"";
            break;
    }
}

/**
 *
 *  此方法用来压栈，该栈为一个键值对应的request body(name=param1,value=param2,value=param3,...)
 *  @param param post body中的param1,param2等字符串
 *  @return 无返回结果
 *
 */
- (void)setPostObject:(id)obj andKey:(NSString *)key {
    if (obj && ![obj isKindOfClass:[NSNull class]] && ![obj isEqualToString:@""]) {
        [postDic setObject:obj forKey:key];
    }
}

- (void)setParamObject:(NSString *)obj {
    if (obj && ![obj isKindOfClass:[NSNull class]] && ![obj isEqualToString:@""]) {
        [paramStr appendFormat:@"/%@",obj];
    }
}

- (void)GET:(NSString *)methodName Success:(void (^)(NSDictionary *))success failure:(void (^)(NSError *))failure {
    NSMutableString *urlStr = [[NSMutableString alloc] init];
    NSString *headUrl  = [self getServiceUrl];
    [urlStr appendFormat:@"%@/%@%@", headUrl, methodName,paramStr];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        //NSLog(@"读取进度--》%@",downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *result = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        NSLog(@"url===>:%@",task.response.URL);
        NSLog(@"返回数据--》%@",[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
        NSLog(@"————————————————————————————————————————————");
        
        success(result);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"url===>:%@",task.response.URL);
        NSLog(@"请求失败--》%@",error.description);
        NSLog(@"===========================");
        failure(error);
    }];
    
}


- (void)POST:(NSString *)methodName Success:(void (^)(NSDictionary *))success failure:(void (^)(NSError *))failure {
    NSMutableString *urlStr = [[NSMutableString alloc] init];
    NSString *headUrl  = [self getServiceUrl];
    [urlStr appendFormat:@"%@/%@%@", headUrl, methodName,paramStr];
    
    NSLog(@"POST===>>%@",postDic);
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];//"text/plain"
    [manager POST:urlStr parameters:postDic progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *result = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        NSLog(@"url===>:%@",task.response.URL);
        NSLog(@"返回数据--》%@",[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
        NSLog(@"————————————————————————————————————————————");
        success(result);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"url===>:%@",task.response.URL);
        NSLog(@"请求失败--》%@",error.description);
        NSLog(@"===========================");
        failure(error);
    }];
}




@end
