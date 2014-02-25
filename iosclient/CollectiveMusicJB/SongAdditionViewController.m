//
//  SongAdditionViewController.m
//  CollectiveMusicJB
//
//  Created by Marcos Jesús Vivar on 2/15/14.
//  Copyright (c) 2014 Franco Agustín Rabaglia. All rights reserved.
//

#import "SongAdditionViewController.h"

#import "RoomViewController.h"

#import "WebServiceJB.h"
#import "SpotifyRoom.h"

@interface SongAdditionViewController ()

@property (nonatomic, strong) SpotifyRoom *retrievedRoom;

@end

@implementation SongAdditionViewController

@synthesize selectedSong;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.title = selectedSong.songName;
    self.songNameLabel.textColor = aquaColor;
    self.songNameLabel.text = selectedSong.songName;
    
    [self addSongToPlaylist];
}

- (void)addSongToPlaylist
{
    [[WebServiceJB sharedService] postSongOnPlaylist:self.selectedSong withBlock:^(id returnedObject, NSError *error)
     {
         if (!error)
         {
             self.retrievedRoom = (SpotifyRoom *)returnedObject;
         }
         else
         {
             UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"JukeBox" message:@"There was a problem trying to add your song to the playlist!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Retry",nil];
             [alert show];
         }
     }];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex > alertView.cancelButtonIndex)
    {
        [self addSongToPlaylist];
    }
    else
    {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"visitRoomSegue"])
    {
        RoomViewController *destinationController = (RoomViewController *)segue.destinationViewController;
        
        if ([destinationController isKindOfClass:[RoomViewController class]])
        {
            destinationController.retrievedRoom = self.retrievedRoom;
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
