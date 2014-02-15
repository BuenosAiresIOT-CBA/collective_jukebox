//
//  WebServiceJB.h
//  CollectiveMusicJB
//
//  Created by Franco Agustín Rabaglia on 15/02/14.
//  Copyright (c) 2014 Franco Agustín Rabaglia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef void (^RssServiceAPIServiceResponseCompletitionBlock)(id returnedObject, NSError *error);

@interface WebServiceJB : NSObject

- (void)getRssMainItemsFromURL:(NSString*) URLString WithBlock:(RssServiceAPIServiceResponseCompletitionBlock) block;

@end
