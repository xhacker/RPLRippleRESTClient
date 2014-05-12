//
//  main.m
//  RPLRippleRESTClientDemo
//
//  Created by Xhacker Liu on 5/8/14.
//  Copyright (c) 2014 Xhacker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RPLRippleRESTClient.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        RPLRippleRESTClient *client = [RPLRippleRESTClient clientWithURL:[NSURL URLWithString:@"http://localhost:5990"]];
        NSLog(@"Client with URL %@ created.", client.serverURL);

        [client requestBalancesWithAddress:@"rEeDuRzo4wN2mhLHa8sJF7aYqQUxbag6Bx"
                                  currency:@""
                              counterparty:@""
                                   success:^(NSArray *balances) {
            NSLog(@"%@", balances);
        } failure:^(NSError *error) {
            NSLog(@"%@", @"Failed.");
        }];

        [client requestSettingsWithAddress:@"rEeDuRzo4wN2mhLHa8sJF7aYqQUxbag6Bx" success:^(RPLSettings *settings) {
            NSLog(@"%@", settings);
        } failure:^(NSError *error) {
            NSLog(@"%@", @"Failed.");
        }];

        NSDictionary *settings = @{@"require_destination_tag": @YES};
        [client changeSettings:settings withAddress:@"rEeDuRzo4wN2mhLHa8sJF7aYqQUxbag6Bx" secret:@"shzx3CdH7h4DnwQQBvZcwbz8N9pYS" success:^{
            NSLog(@"%@", @"Settings changed.");
        } failure:^(NSString *error) {
            NSLog(@"%@: %@", @"Change settings failed", error);
        }];

        NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
        [runLoop run];
    }
    return 0;
}

