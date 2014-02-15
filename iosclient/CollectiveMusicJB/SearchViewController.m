//
//  SearchViewController.m
//  CollectiveMusicJB
//
//  Created by Franco Agustín Rabaglia on 15/02/14.
//  Copyright (c) 2014 Franco Agustín Rabaglia. All rights reserved.
//

#import "SearchViewController.h"
#import "MusicListTableViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*- (IBAction)handleSearchOnClickButton:(id)sender {

    
    MusicListTableViewController *oMusicController = [[MusicListTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
    oMusicController.songName = self.textField.text;
    
    [self.navigationController pushViewController:oMusicController animated:NO];
    
}*/

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"showDetailSegue"]){
        
        UINavigationController *navController = (UINavigationController *)segue.destinationViewController;
        
        MusicListTableViewController *oMusicController = (MusicListTableViewController*)navController.topViewController;
        
        oMusicController.songName = self.textField;
    }
}

@end
