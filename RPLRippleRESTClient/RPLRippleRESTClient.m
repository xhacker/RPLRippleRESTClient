//
//  RPLRippleRESTClient.m
//  RPLRippleRESTClientDemo
//
//  Created by Xhacker Liu on 5/8/14.
//  Copyright (c) 2014 Xhacker. All rights reserved.
//

#import "RPLRippleRESTClient.h"
#import <AFNetworking.h>

@interface RPLRippleRESTClient ()

@property (nonatomic) AFHTTPRequestOperationManager *requestManager;

@end

@implementation RPLRippleRESTClient

- (instancetype)init
{
    self = [self initWithURL:[NSURL URLWithString:@"http://localhost:5990"]];
    return self;
}

- (instancetype)initWithURL:(NSURL *)url
{
    self = [super init];
    if (self) {
        self.serverURL = url;
    }
    return self;
}

+ (instancetype)clientWithURL:(NSURL *)url
{
    return [[self alloc] initWithURL:url];
}

- (void)setServerURL:(NSURL *)serverURL
{
    _serverURL = serverURL;
    self.requestManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:serverURL];
    self.requestManager.requestSerializer = [AFJSONRequestSerializer serializer];
    self.requestManager.responseSerializer = [AFJSONResponseSerializer serializer];
}

- (void)requestBalancesWithAddress:(NSString *)address
                          currency:(NSString *)currency
                      counterparty:(NSString *)counterparty
                           success:(void (^)(NSArray *))success
                           failure:(void (^)(NSError *))failure;
{
    NSAssert(currency, @"currency shouldn't be nil");
    NSAssert(counterparty, @"counterparty shouldn't be nil");
    
    [self.requestManager GET:[NSString stringWithFormat:@"/v1/accounts/%@/balances", address]
                  parameters:@{@"currency": currency, @"counterparty": counterparty}
                     success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableArray *balances = [@[] mutableCopy];
        for (NSDictionary *balance in responseObject[@"balances"]) {
            [balances addObject:[MTLJSONAdapter modelOfClass:RPLBalance.class fromJSONDictionary:balance error:nil]];
        }
        success(balances);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

- (void)requestSettingsWithAddress:(NSString *)address
                           success:(void (^)(RPLSettings *))success
                           failure:(void (^)(NSError *))failure
{
    [self.requestManager GET:[NSString stringWithFormat:@"/v1/accounts/%@/settings", address]
                  parameters:nil
                     success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success([MTLJSONAdapter modelOfClass:RPLSettings.class fromJSONDictionary:responseObject[@"settings"] error:nil]);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

@end
