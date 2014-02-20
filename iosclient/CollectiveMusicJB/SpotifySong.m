//
//  SpotifySong.m
//  CollectiveMusicJB
//
//  Created by Franco Agustín Rabaglia on 15/02/14.
//  Copyright (c) 2014 Franco Agustín Rabaglia. All rights reserved.
//

#import "SpotifySong.h"

@implementation SpotifySong

@synthesize songAlbumLink;
@synthesize songAlbumName;

@synthesize songArtistLink;
@synthesize songArtistName;

@synthesize songDuration;

@synthesize songLink;
@synthesize songName;
@synthesize songPopularity;
@synthesize songStarred;

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

+ (id)songWithDictionary:(NSDictionary *)dictionary
{
    return [[self alloc] initWithDictionary:dictionary];
}

- (BOOL)isSongEmpty
{
    BOOL IsEmpty = ((self.songLink != nil) && (self.songName != nil));
    
    return IsEmpty;
}

- (BOOL)setAttributesFromDictionary:(NSDictionary *)dictionary
{
    if( dictionary != nil )
    {
        self.songAlbumLink = ([dictionary objectForKey:@"album"] != nil) ? [[dictionary objectForKey:@"album"] objectForKey:@"link"] : nil;
        self.songAlbumName = ([dictionary objectForKey:@"album"] != nil) ? [[dictionary objectForKey:@"album"] objectForKey:@"name"] : nil;
        self.songArtistLink = ([dictionary objectForKey:@"artists"] != nil) ? [[[dictionary objectForKey:@"artists"] objectAtIndex:0] objectForKey:@"link"] : nil;
        self.songArtistName = ([dictionary objectForKey:@"artists"] != nil) ? [[[dictionary objectForKey:@"artists"] objectAtIndex:0] objectForKey:@"name"] : nil;
        self.songDuration = ([dictionary objectForKey:@"duration"] != nil) ? [NSString stringWithFormat:@"%d",(int)[dictionary objectForKey:@"duration"]] : nil;
        self.songLink = ([dictionary objectForKey:@"link"] != nil) ? [dictionary objectForKey:@"link"] : nil;
        self.songName = ([dictionary objectForKey:@"name"] != nil) ? [dictionary objectForKey:@"name"] : nil;
        self.songPopularity = ([dictionary objectForKey:@"popularity"] != nil) ? [dictionary objectForKey:@"popularity"] : nil;
        self.songStarred = ([dictionary objectForKey:@"starred"] != nil) ? [NSString stringWithFormat:@"%d",(int)[dictionary objectForKey:@"starred"]] : nil;
    }
    
    return [self isSongEmpty];
}

@end
