//
//  RPLSettings.h
//  RPLRippleRESTClientDemo
//
//  Created by Xhacker Liu on 5/9/14.
//  Copyright (c) 2014 Xhacker. All rights reserved.
//

#import <Mantle.h>

@interface RPLSettings : MTLModel <MTLJSONSerializing>

// Settings flags
@property (nonatomic, readonly) BOOL disableMaster;
@property (nonatomic, readonly) BOOL disallowXRP;
@property (nonatomic, readonly) BOOL passwordSpent;
@property (nonatomic, readonly) BOOL requireAuthorization;
@property (nonatomic, readonly) BOOL requireDestinationTag;

// Settings fields
@property (nonatomic, readonly) NSInteger transactionSequence;
@property (nonatomic, readonly) NSString *emailHash;
@property (nonatomic, readonly) NSString *walletLocator;
@property (nonatomic, readonly) NSString *messageKey;
@property (nonatomic, readonly) NSString *domain;
@property (nonatomic, readonly) NSInteger transferRate;
@property (nonatomic, readonly) NSString *signers;

@end
