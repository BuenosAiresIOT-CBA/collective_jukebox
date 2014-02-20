//
//  SpotifyRoom.m
//  CollectiveMusicJB
//
//  Created by Marcos Jesús Vivar on 2/15/14.
//  Copyright (c) 2014 Franco Agustín Rabaglia. All rights reserved.
//

#import "SpotifyRoom.h"

@implementation SpotifyRoom

@synthesize jukeBox;
@synthesize spotifySongsArray;

@synthesize nextFreeSpotMinutes;
@synthesize connectedUsers;

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (!self)
        return nil;
    
    BOOL didPopulateSuccessfully = [self setAttributesFromDictionary:dictionary];
    if (!didPopulateSuccessfully)
        return nil;
    
    return self;
}

+ (id)roomWithDictionary:(NSDictionary *)dictionary
{
    return [[self alloc] initWithDictionary:dictionary];
}

- (BOOL)isRoomEmpty
{
    BOOL IsEmpty = ((self.spotifySongsArray != nil) && (self.jukeBox != nil));
    
    return IsEmpty;
}

- (BOOL)setAttributesFromDictionary:(NSDictionary *)dictionary
{
    if( dictionary != nil )
    {
        self.connectedUsers = ([dictionary objectForKey:@"connectedUsers"] != nil) ? [NSNumber numberWithInteger:(NSInteger)[dictionary objectForKey:@"connectedUsers"]] : nil;
        self.nextFreeSpotMinutes = ([dictionary objectForKey:@"nextFreeSpot"] != nil) ? [NSNumber numberWithInteger:(NSInteger)[[dictionary objectForKey:@"nextFreeSpot"] objectForKey:@"number"]] : nil;
        self.jukeBox = ([dictionary objectForKey:@"junkebox"] != nil) ? [[dictionary objectForKey:@"junkebox"] objectForKey:@"name"] : nil;
        
        NSMutableArray *songsArray = [[NSMutableArray alloc] init];
        
        if ([dictionary objectForKey:@"playlist"] != nil)
        {
            for (int i = 0; i < [[dictionary objectForKey:@"playlist"] count]; i++)
            {
                [songsArray addObject:[SpotifySong songWithDictionary:[[dictionary objectForKey:@"playlist"] objectAtIndex:i]]];
            }
        }
        
        self.spotifySongsArray = songsArray;
    }
    
    return [self isRoomEmpty];
}

@end
