//
//  MusicListTableViewController.m
//  CollectiveMusicJB
//
//  Created by Franco Agustín Rabaglia on 15/02/14.
//  Copyright (c) 2014 Franco Agustín Rabaglia. All rights reserved.
//

#import "MusicListTableViewController.h"
#import "AFNetworking.h"
#import "WebServiceJB.h"

#import "SpotifySong.h"

@interface MusicListTableViewController ()
@property (nonatomic, strong) NSMutableArray *itemsList;
@property (nonatomic, strong) NSError *oError;

@end

@implementation MusicListTableViewController

@synthesize songName;
@synthesize itemsList;
@synthesize oError;

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
    
    self.title = songName;
    
    //Inicializo array vacio. (Podría ser alloc + init, pero esto es lo mismo y más careta)
    self.itemsList = [@[] mutableCopy];
    
    //Inicializo la API del servicio RSS.
    WebServiceJB* oWS = [[WebServiceJB alloc] init];
    
    //Genero la URL del Web service.
    NSString *URLStringNoSong = @"http://collectivemock.herokuapp.com/api/v1/search/";
    NSString *URLString = [URLStringNoSong stringByAppendingFormat:@"%@", self.songName];
    
    NSLog(@"URLString (GET) : %@",URLString);
    
    [oWS getRssMainItemsFromURL: URLString WithBlock:^(id returnedObject, NSError *error) {
        self.itemsList = [returnedObject mutableCopy];
        self.oError = error;
        
        NSLog(@"ITEMS AFUERA DE BLOQUE: %@",returnedObject);
        
        //Esto es para que vuelva a cargar el view, después de toda esta llamada.
        [self.tableView reloadData];
        
    }];
    
    //NSLog(@"ITEMS AFUERA DE BLOQUE: %d",[self.itemsList count]);
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

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
