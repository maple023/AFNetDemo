//
//  WF_TransformService.h
//  AFNetDemo
//
//  Created by happi on 16/6/1.
//  Copyright © 2016年 happi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface WF_TransformService : NSObject {
    NSMutableDictionary *postDic;
    NSMutableString *paramStr;
}

/**
 *
 *  此方法用来压栈，该栈为一个键值对应的request body(name=param1,value=param2,value=param3,...)
 *  @param param post body中的param1,param2等字符串
 *  @return 无返回结果
 *
 */
- (void)setPostObject:(id)obj andKey:(NSString *)key;

- (void)setParamObject:(NSString *)obj;



/**
 *
 *  此方法用来向服务器提交GET请求，获取返回结果
 *  @param methodName 对应的Servlet名称
 */
- (void)GET:(NSString *)methodName Success:(void (^)(NSDictionary *))success failure:(void (^)(NSError *))failure;

/**
 *
 *  此方法用来向服务器提交POST请求，获取返回结果
 *  @param methodName 对应的Servlet名称
 */
- (void)POST:(NSString *)methodName Success:(void (^)(NSDictionary *))success failure:(void (^)(NSError *))failure;

@end
