//
//  RPLBalance.h
//  RPLRippleRESTClientDemo
//
//  Created by Xhacker Liu on 5/8/14.
//  Copyright (c) 2014 Xhacker. All rights reserved.
//

#import <Mantle.h>

@interface RPLBalance : MTLModel <MTLJSONSerializing>

@property (nonatomic, readonly) NSDecimalNumber *value;
@property (nonatomic, readonly) NSString *currency;
@property (nonatomic, readonly) NSString *counterparty;

@end
