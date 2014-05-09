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

/**
 *  Get Balances
 *
 *  @param address      Address of account
 *  @param currency     The balance’s currency, empty string to get all
 *  @param counterparty Counterparty (issuer) of balance, empty string to get all
 *  @param success      Success callback
 *  @param failure      Failure callback
 */
- (void)requestBalancesWithAddress:(NSString *)address
                          currency:(NSString *)currency
                      counterparty:(NSString *)counterparty
                           success:(void (^)(NSArray *))success
                           failure:(void (^)(NSError *))failure;

@end
