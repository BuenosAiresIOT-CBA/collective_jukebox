//
//  WebServiceJB.m
//  CollectiveMusicJB
//
//  Created by Franco Agustín Rabaglia on 15/02/14.
//  Copyright (c) 2014 Franco Agustín Rabaglia. All rights reserved.
//

#import "WebServiceJB.h"

#import "SpotifySong.h"

@implementation WebServiceJB

- (void)getRssMainItemsFromURL:(NSString*) URLString WithBlock:(RssServiceAPIServiceResponseCompletitionBlock) block{
    
    //Instancio el manager de la peticion HTTP.
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.securityPolicy setAllowInvalidCertificates:YES];
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    [manager setRequestSerializer:[AFJSONRequestSerializer serializer]];
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObject:@"application/json"]];
    
    [manager GET:URLString parameters:nil
     
     //En caso de exito sucede lo siguiente:
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
             NSMutableArray *items = [@[] mutableCopy];
             
             for (int i = 0 ; i < [responseObject count]; i++)
             {
                 [items addObject:[SpotifySong songWithDictionary:[responseObject objectAtIndex:i]]];
             }
            
             
             //NSLog(@"%@",items);
             
             block(items, nil);

         }
     
     //En caso de error sucede lo siguiente:
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             
             block(nil, error);
             
         }];
    
}
@end
