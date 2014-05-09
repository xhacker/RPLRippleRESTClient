//
//  RPLSettings.m
//  RPLRippleRESTClientDemo
//
//  Created by Xhacker Liu on 5/9/14.
//  Copyright (c) 2014 Xhacker. All rights reserved.
//

#import "RPLSettings.h"

@implementation RPLSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"disableMaster":         @"disable_master",
             @"disallowXRP":           @"disallow_xrp",
             @"passwordSpent":         @"password_spent",
             @"requireAuthorization":  @"require_authorization",
             @"requireDestinationTag": @"require_destination_tag",
             @"transactionSequence":   @"transaction_sequence",
             @"emailHash":             @"email_hash",
             @"walletLocator":         @"wallet_locator",
             @"messageKey":            @"message_key",
             @"domain":                @"domain",
             @"transferRate":          @"transfer_rate",
             @"signers":               @"signers",
             };
}

@end
