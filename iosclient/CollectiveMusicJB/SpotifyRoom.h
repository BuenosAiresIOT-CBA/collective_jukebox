//
//  SpotifyRoom.h
//  CollectiveMusicJB
//
//  Created by Marcos Jesús Vivar on 2/15/14.
//  Copyright (c) 2014 Franco Agustín Rabaglia. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SpotifySong.h"

@interface SpotifyRoom : NSObject

@property (nonatomic, strong) NSMutableDictionary *jukeBox;
@property (nonatomic, strong) NSMutableArray *spotifySongsArray;

@property (nonatomic, strong) NSNumber *nextFreeSpotMinutes;
@property (nonatomic, strong) NSNumber *connectedUsers;

- (id)initWithDictionary:(NSDictionary *)dictionary;
+ (id)roomWithDictionary:(NSDictionary *)dictionary;

@end
