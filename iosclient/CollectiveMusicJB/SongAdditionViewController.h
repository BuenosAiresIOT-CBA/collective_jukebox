//
//  SongAdditionViewController.h
//  CollectiveMusicJB
//
//  Created by Marcos Jesús Vivar on 2/15/14.
//  Copyright (c) 2014 Franco Agustín Rabaglia. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SpotifySong.h"

@interface SongAdditionViewController : UIViewController <UIAlertViewDelegate>

@property (nonatomic, strong) SpotifySong *selectedSong;
@property (weak, nonatomic) IBOutlet UILabel *songNameLabel;

@end
