//
//  InstructionsViewController.m
//  CollectiveMusicJB
//
//  Created by Franco Agustín Rabaglia on 15/02/14.
//  Copyright (c) 2014 Franco Agustín Rabaglia. All rights reserved.
//

#import "InstructionsViewController.h"

@interface InstructionsViewController ()

@end

@implementation InstructionsViewController
@synthesize firstInstruction;
@synthesize secondInstruction;
@synthesize thirdInstruction;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) showFirstInstruction {
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(showSecondInstruction) userInfo:nil repeats:NO];
    [UIView animateWithDuration:animationTime animations:^{
        self.firstInstruction.alpha = 1;

    }];


}
- (void) showSecondInstruction {
    
    [UIView animateWithDuration:animationTime animations:^{
        self.firstInstruction.alpha = alphaNoFocus;
    }];

    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(showThirdInstruction) userInfo:nil repeats:NO];
    
    [UIView animateWithDuration:animationTime animations:^{
        self.secondInstruction.alpha = 1;
    }];
}

- (void) showThirdInstruction {
    [UIView animateWithDuration:animationTime animations:^{
        self.secondInstruction.alpha = alphaNoFocus;
    }];
    
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(turnOffInstructions) userInfo:nil repeats:NO];
    
    [UIView animateWithDuration:animationTime animations:^{
        self.thirdInstruction.alpha = 1;
    }];
}

- (void) turnOffInstructions {
    [UIView animateWithDuration:animationTime animations:^{
        self.thirdInstruction.alpha = alphaNoFocus;
    }];
    
}

- (void) startAnimation{
    [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(showFirstInstruction) userInfo:nil repeats:NO];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //Setting colors and alpha
    self.firstInstruction.textColor = blackColor;
    self.secondInstruction.textColor = blackColor;
    self.thirdInstruction.textColor = blackColor;
    
    self.firstInstruction.alpha = alphaNoFocus;
    self.secondInstruction.alpha = alphaNoFocus;
    self.thirdInstruction.alpha = alphaNoFocus;
    
    //Setting

    
    //Animating instructions!
    [self startAnimation];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
