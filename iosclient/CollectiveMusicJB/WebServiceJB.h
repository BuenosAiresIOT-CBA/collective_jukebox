//
//  WebServiceJB.h
//  CollectiveMusicJB
//
//  Created by Franco Agustín Rabaglia on 15/02/14.
//  Copyright (c) 2014 Franco Agustín Rabaglia. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AFNetworking.h"

#import "SpotifySong.h"

typedef void (^JukeBoxAPIServiceResponseCompletionBlock)(id returnedObject, NSError *error);

@interface WebServiceJB : NSObject

+ (WebServiceJB *)sharedService;

- (void)searchSongsWith:(NSString *)text withBlock:(JukeBoxAPIServiceResponseCompletionBlock)block;

- (void)postSongOnPlaylist:(SpotifySong *)song withBlock:(JukeBoxAPIServiceResponseCompletionBlock)block;

- (void)visitRoomWithBlock:(JukeBoxAPIServiceResponseCompletionBlock)block;

@end
