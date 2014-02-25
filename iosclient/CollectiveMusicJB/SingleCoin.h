//
//  SingleCoin.h
//  CollectiveMusicJB
//
//  Created by Franco Agustín Rabaglia on 24/02/14.
//  Copyright (c) 2014 Franco Agustín Rabaglia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingleCoin : NSObject
@property (nonatomic,assign) BOOL coin;

+ (SingleCoin*) getCoin;
- (BOOL) haveCoin;
- (void) useCoin;

@end
