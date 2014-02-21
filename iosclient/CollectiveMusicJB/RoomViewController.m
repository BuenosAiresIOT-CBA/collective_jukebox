//
//  RoomViewController.m
//  CollectiveMusicJB
//
//  Created by Marcos Jesús Vivar on 2/15/14.
//  Copyright (c) 2014 Franco Agustín Rabaglia. All rights reserved.
//

#import "RoomViewController.h"

@interface RoomViewController ()

@end

@implementation RoomViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [[WebServiceJB sharedService] visitRoomWithBlock:^(id returnedObject, NSError *error)
     {
         if (!error)
         {
             self.retrievedRoom = (SpotifyRoom *)returnedObject;
             
             [self.tableView reloadData];
         }
     }];
}

- (void)startOver
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.retrievedRoom.spotifySongsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:CellIdentifier];
        
        // Acá defino el estilo de la celda.
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.textColor = [UIColor colorWithRed:51./255.
                                                   green:153./255.
                                                    blue:204./255.
                                                   alpha:1.0];
        
        cell.detailTextLabel.textColor = [UIColor colorWithRed:0./255.
                                                         green:0./255.
                                                          blue:0./255.
                                                         alpha:.8];
        cell.detailTextLabel.numberOfLines = 1;
    }
    
    //Acá cargo el titulo y descripción de cada celda.
    
	SpotifySong *song = [self.retrievedRoom.spotifySongsArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = song.songName;
    cell.detailTextLabel.text = song.songAlbumName;
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
