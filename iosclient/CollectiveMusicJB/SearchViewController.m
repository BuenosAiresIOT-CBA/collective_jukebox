//
//  SearchViewController.m
//  CollectiveMusicJB
//
//  Created by Franco Agustín Rabaglia on 15/02/14.
//  Copyright (c) 2014 Franco Agustín Rabaglia. All rights reserved.
//

#import "SearchViewController.h"

#import "MusicListTableViewController.h"
#import "AFNetworking.h"

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


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"showMusicTableViewSegue"])
    {
        MusicListTableViewController *destinationController = (UIViewController *)segue.destinationViewController;
        
        if ([destinationController isKindOfClass:[MusicListTableViewController class]])
        {
            if ([self.textField.text  isEqualToString: @"Muse? Metallica?"]){
                destinationController.songName = @"";
            }
            else{
                destinationController.songName = self.textField.text;
            }
        }
    }
}

//This allows the user to hide keyboard touching anywhere.

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[self view] endEditing:YES];
}

@end
