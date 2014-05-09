//
//  RPLRippleRESTClient.h
//  RPLRippleRESTClientDemo
//
//  Created by Xhacker Liu on 5/8/14.
//  Copyright (c) 2014 Xhacker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RPLBalance.h"

@interface RPLRippleRESTClient : NSObject

@property (nonatomic) NSURL *serverURL;

- (instancetype)init;
- (instancetype)initWithURL:(NSURL *)url;
+ (instancetype)clientWithURL:(NSURL *)url;

- (void)requestBalances:(NSString *)address
                success:(void (^)(NSArray *))success
                failure:(void (^)(NSError *))failure;

@end
