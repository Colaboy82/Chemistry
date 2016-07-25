//
//  ViewController.m
//  ProColors
//
//  Created by Grumpy1211 on 4/17/16.
//  Copyright © 2016 MuSquared. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


-(IBAction)showLeaderBoard:(id)sender{
    GKLeaderboardViewController *leaderboardViewController =
    [[GKLeaderboardViewController alloc] init];
    leaderboardViewController.leaderboardDelegate = self;
    [self presentModalViewController:
     leaderboardViewController animated:YES];
}
#pragma mark - Gamekit delegates
- (void)leaderboardViewControllerDidFinish:
(GKLeaderboardViewController *)viewController{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    
    if([GKLocalPlayer localPlayer].authenticated == NO)
    {
        [[GKLocalPlayer localPlayer]
         authenticateWithCompletionHandler:^(NSError *error)
         {
             NSLog(@"Error%@", error);
         }];
    }
    
    HighScoreNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    HighScoreLabel.text = [NSString stringWithFormat:@"High Score: %i", HighScoreNumber];

    IndicatorHighScoreNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"IndicatorHighScoreSaved"];
    IndicatorHighScoreLabel.text = [NSString stringWithFormat:@"High Score: %i", IndicatorHighScoreNumber];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
