//
//  WF_UserService.h
//  AFNetDemo
//
//  Created by happi on 16/6/1.
//  Copyright © 2016年 happi. All rights reserved.
//  此类用于编写 接口

#import <Foundation/Foundation.h>
#import "WF_TransformService.h"

@interface WF_UserService : WF_TransformService

//GET请求...商城首页.../index
/*! infoDic 参数
 
 */
- (void)getMallSuccess:(void(^)(NSDictionary *))Success failure:(void(^)(NSError *))failure;

//A03-星设区
//星设区  喜欢 或 取消喜欢  的接口
/**
 *   POST请求 http://demo.legendtao1985.com/esapi_v1/shequ_collect
 *   收藏商品,参数全必填
 *	@param aid  社区id
 *	@param type  add增，del减
 */
- (void)shequCollectAid:(NSString *)aid
                   Type:(NSString *)type
                Success:(void(^)(NSDictionary *))Success
                failure:(void(^)(NSError *))failure;

@end
