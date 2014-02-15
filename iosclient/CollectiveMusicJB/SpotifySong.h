//
//  SpotifySong.h
//  CollectiveMusicJB
//
//  Created by Franco Agustín Rabaglia on 15/02/14.
//  Copyright (c) 2014 Franco Agustín Rabaglia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpotifySong : NSObject

@property (nonatomic, strong) NSString *songAlbumLink;
@property (nonatomic, strong) NSString *songAlbumName;

@property (nonatomic, strong) NSString *songArtistLink;
@property (nonatomic, strong) NSString *songArtistName;

@property (nonatomic, strong) NSString *songDuration;

@property (nonatomic, strong) NSString *songLink;
@property (nonatomic, strong) NSString *songName;
@property (nonatomic, strong) NSString *songPopularity;
@property (nonatomic, strong) NSString *songStarred;

- (id)initWithDictionary:(NSDictionary *)dictionary;
+ (id)songWithDictionary:(NSDictionary *)dictionary;

@end
