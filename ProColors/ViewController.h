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

@interface ViewController : UIViewController <GKLeaderboardViewControllerDelegate>
{
    IBOutlet UILabel *HighScoreLabel;
}

@end

