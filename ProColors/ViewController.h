//
//  ViewController.h
//  ProColors
//
//  Created by Grumpy1211 on 4/17/16.
//  Copyright © 2016 MuSquared. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>

int HighScoreNumber;
int IndicatorHighScoreNumber;

@interface ViewController : UIViewController <GKLeaderboardViewControllerDelegate>
{
    IBOutlet UILabel *HighScoreLabel;
    IBOutlet UILabel *IndicatorHighScoreLabel;
}

@end

