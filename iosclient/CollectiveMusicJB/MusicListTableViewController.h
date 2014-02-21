//
//  MusicListTableViewController.h
//  CollectiveMusicJB
//
//  Created by Franco Agustín Rabaglia on 15/02/14.
//  Copyright (c) 2014 Franco Agustín Rabaglia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MusicListTableViewController : UITableViewController

@property (strong, nonatomic) NSString *songName;
@property (nonatomic, strong) SpotifySong *selectedSong;

@end
