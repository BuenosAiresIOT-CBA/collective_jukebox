//
//  MusicListTableViewController.m
//  CollectiveMusicJB
//
//  Created by Franco Agustín Rabaglia on 15/02/14.
//  Copyright (c) 2014 Franco Agustín Rabaglia. All rights reserved.
//

#import "MusicListTableViewController.h"

#import "SongAdditionViewController.h"

#import "WebServiceJB.h"

#import "SingleCoin.h"


@interface MusicListTableViewController ()
@property (nonatomic, strong) NSMutableArray *itemsList;
@property (nonatomic, strong) NSError *oError;
@property (nonatomic, strong) SingleCoin* coin;
@property (nonatomic, assign) BOOL coinForSong;

@end

@implementation MusicListTableViewController

@synthesize songName;
@synthesize itemsList;
@synthesize oError;
@synthesize coin;
@synthesize coinForSong;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) hideCoin {
    [UIView animateWithDuration:animationCoinTime animations:^{
        self.navigationItem.titleView.alpha = 0;
        
    }];
    
    [UIView animateWithDuration:animationCoinTime animations:^{
        self.useCoinButton.alpha = 0;
        
    }];
}

- (void) putCoinForASong{
    NSLog(@"CLING!");
    self.coinForSong = YES;
    [self.coin useCoin];
    [self hideCoin];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //There is no coins.
    self.coinForSong = NO;
    
    //Loading coin class.
    self.coin = [SingleCoin getCoin];
    
    [self.useCoinButton addTarget:self
                           action:@selector(putCoinForASong)
                 forControlEvents:UIControlEventTouchDown];
    
    
    if ([coin haveCoin]){
        UIImage *image = [UIImage imageNamed: @"coin32.png"];
        UIImageView *imageView = [[UIImageView alloc] initWithImage: image];
        self.navigationItem.titleView = imageView;
    }
    else{
        self.useCoinButton.hidden = YES;
    }

    
    self.title = self.songName;
    
    //Inicializo array vacio. (Podría ser alloc + init, pero esto es lo mismo y más careta)
    self.itemsList = [@[] mutableCopy];
    
    //Inicializo la API del servicio RSS.
    [[WebServiceJB sharedService] searchSongsWith:self.songName withBlock:^(id returnedObject, NSError *error)
    {
        if (!error)
        {
            self.itemsList = [returnedObject mutableCopy];
            self.oError = error;
            
            //Esto es para que vuelva a cargar el view, después de toda esta llamada.
            [self.tableView reloadData];
        }
        else
        {}
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return [self.itemsList count];
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
        cell.textLabel.textColor = aquaColor;
        
        cell.detailTextLabel.textColor = [UIColor colorWithRed:0./255.
                                                   green:0./255.
                                                    blue:0./255.
                                                   alpha:alphaNoFocus];
        cell.detailTextLabel.numberOfLines = 1;
    }
    
    //Acá cargo el titulo y descripción de cada celda.
    
	SpotifySong *song = [self.itemsList objectAtIndex:indexPath.row];
//    TODO: Rellenar la celda con los datos!
    
    cell.textLabel.text = song.songName;
    cell.detailTextLabel.text = song.songAlbumName;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedSong = [self.itemsList objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:@"addSongSegue" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"addSongSegue"])
    {
        SongAdditionViewController *destinationController = (SongAdditionViewController *)segue.destinationViewController;
        
        if ([destinationController isKindOfClass:[SongAdditionViewController class]])
        {
            destinationController.selectedSong = self.selectedSong;
        }
    }
}

@end
