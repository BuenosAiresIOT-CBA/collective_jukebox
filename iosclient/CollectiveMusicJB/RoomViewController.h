//
//  RoomViewController.h
//  CollectiveMusicJB
//
//  Created by Marcos Jesús Vivar on 2/15/14.
//  Copyright (c) 2014 Franco Agustín Rabaglia. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SpotifyRoom.h"

@interface RoomViewController : UITableViewController

@property (nonatomic, strong) SpotifyRoom *retrievedRoom;

@end
