//
//  HttpRequest.m
//  InvestmentNews
//
//  Created by 项正强 on 2020/12/1.
//

#import "HttpRequest.h"
@interface HttpRequest()

@end

@implementation HttpRequest

+ (instancetype) instance {
    static HttpRequest *until = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        /// 因为已经重写了allocWithZone方法，所以这里要调用父类的分配空间的方法,不能再使用alloc方法
        until = [[super allocWithZone:NULL] init];
    });
    return until;
}

/// 防止外部调用alloc 或者 new
+ (instancetype) allocWithZone:(struct _NSZone *) zone {
    return [HttpRequest instance];
}

/// 防止外部调用copy
- (id) copyWithZone:(nullable NSZone *) zone {
    return [HttpRequest instance];
}

@end
