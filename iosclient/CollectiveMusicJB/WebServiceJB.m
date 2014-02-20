//
//  WebServiceJB.m
//  CollectiveMusicJB
//
//  Created by Franco Agustín Rabaglia on 15/02/14.
//  Copyright (c) 2014 Franco Agustín Rabaglia. All rights reserved.
//

#import "WebServiceJB.h"

#import "SpotifySong.h"
#import "SpotifyRoom.h"

@implementation WebServiceJB

#pragma -
#pragma mark Instantiation Methods

+ (WebServiceJB *)sharedService
{
    static dispatch_once_t pred;
    static WebServiceJB *sharedInstance = nil;
    
    dispatch_once(&pred, ^{
        sharedInstance = [[WebServiceJB alloc] init];
    });
    
    return sharedInstance;
}

- (id)init
{
    self = [super init];
    if (!self)
        return nil;
    
    return self;
}

- (void)searchSongsWith:(NSString *)text withBlock:(JukeBoxAPIServiceResponseCompletionBlock)block
{
    //Instancio el manager de la peticion HTTP.
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.securityPolicy setAllowInvalidCertificates:YES];
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    [manager setRequestSerializer:[AFJSONRequestSerializer serializer]];
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObject:@"application/json"]];
    
    //Genero la URL del Web service.
    NSString *URLString = [NSString stringWithFormat:@"%@%@%@", API_SIGNATURE, API_SEARCH, text];
    
    [manager GET:URLString
      parameters:nil
     //En caso de exito sucede lo siguiente:
         success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
             NSMutableArray *items = [@[] mutableCopy];
             
             for (int i = 0 ; i < [responseObject count]; i++)
             {
                 [items addObject:[SpotifySong songWithDictionary:[responseObject objectAtIndex:i]]];
             }
             
             block(items, nil);
         }
     //En caso de error sucede lo siguiente:
         failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        NSLog(@"Error by: %@", [error localizedDescription]);
        
        block(nil, error);
         }];
}

- (void)postSongOnPlaylist:(SpotifySong *)song withBlock:(JukeBoxAPIServiceResponseCompletionBlock)block
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.securityPolicy setAllowInvalidCertificates:YES];
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    [manager setRequestSerializer:[AFJSONRequestSerializer serializer]];
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObject:@"application/json"]];
    
    //Genero la URL del Web service.
    NSString *URLString = [NSString stringWithFormat:@"%@%@", API_SIGNATURE, API_PLAYLIST_ADD];
    
    NSMutableDictionary *parametersDictionary = [[NSMutableDictionary alloc] init];
    
    NSMutableDictionary *albumDictionary = [[NSMutableDictionary alloc] init];
    [albumDictionary setObject:song.songAlbumLink forKey:@"link"];
    [albumDictionary setObject:song.songAlbumName forKey:@"name"];
    
    NSMutableArray *artistsArray = [[NSMutableArray alloc] init];
    NSMutableDictionary *artistDictionary = [[NSMutableDictionary alloc] init];
    
    [artistDictionary setObject:song.songArtistLink forKey:@"link"];
    [artistDictionary setObject:song.songArtistName forKey:@"name"];
    [artistsArray addObject:artistDictionary];
    
    [parametersDictionary setObject:albumDictionary forKey:@"album"];
    [parametersDictionary setObject:artistsArray forKey:@"artists"];
    [parametersDictionary setObject:song.songDuration forKey:@"duration"];
    [parametersDictionary setObject:song.songLink forKey:@"link"];
    [parametersDictionary setObject:song.songName forKey:@"name"];
    [parametersDictionary setObject:song.songPopularity forKey:@"popularity"];
    [parametersDictionary setObject:song.songStarred forKey:@"starred"];
    
    [manager POST:URLString
       parameters:parametersDictionary
     //En caso de exito sucede lo siguiente:
          success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        NSLog(@"Response room: %@", responseObject);
        
        SpotifyRoom *room = [SpotifyRoom roomWithDictionary:responseObject];
        
        block(room, nil);
    }
     //En caso de error sucede lo siguiente:
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        NSLog(@"Error by: %@", [error localizedDescription]);
        
        block(nil, error);
    }];
}

- (void)visitRoomWithBlock:(JukeBoxAPIServiceResponseCompletionBlock)block
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.securityPolicy setAllowInvalidCertificates:YES];
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    [manager setRequestSerializer:[AFJSONRequestSerializer serializer]];
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObject:@"application/json"]];
    
    //Genero la URL del Web service.
    NSString *URLString = [NSString stringWithFormat:@"%@%@", API_SIGNATURE, API_ROOM];
    
    [manager GET:URLString
      parameters:nil
     //En caso de exito sucede lo siguiente:
         success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         SpotifyRoom *room = [SpotifyRoom roomWithDictionary:responseObject];
         
         block(room, nil);
     }
     //En caso de error sucede lo siguiente:
         failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"Error by: %@", [error localizedDescription]);
         
         block(nil, error);
     }];
}

@end
