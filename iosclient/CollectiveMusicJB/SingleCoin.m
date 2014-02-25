//
//  SingleCoin.m
//  CollectiveMusicJB
//
//  Created by Franco Agustín Rabaglia on 24/02/14.
//  Copyright (c) 2014 Franco Agustín Rabaglia. All rights reserved.
//

#import "SingleCoin.h"

@implementation SingleCoin
@synthesize coin;

static SingleCoin *sharedCoin;

+ (void)initialize
{
    static BOOL initialized = NO;
    if(!initialized)
    {
        initialized = YES;
        sharedCoin = [[SingleCoin alloc] init];
        [sharedCoin setCoin:YES];
    }
}

+ (SingleCoin*) getCoin {
    
    //@synchronized protects the program from multithreading execution.
    @synchronized(self)
    {
        if (sharedCoin == NULL)
            [SingleCoin initialize];
        
    }
    
    return sharedCoin;
}

- (BOOL) haveCoin{
    return coin;
}

- (void) useCoin{
    [sharedCoin setCoin:NO];
    NSLog(@"Using coin!");
}

@end
