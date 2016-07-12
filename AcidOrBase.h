//
//  RightColorChange.h
//  ProColors
//
//  Created by Grumpy1211 on 6/26/16.
//  Copyright © 2016 MuSquared. All rights reserved.
//

#import <UIKit/UIKit.h>

int Score;
int CountdownInt;
int GameTimerInt;

@interface AcidOrBase : UIViewController
{
    
    //GamePiece
    IBOutlet UIImageView *Spawn;
    
    //Labels
    IBOutlet UILabel *ScoreLabel;
    IBOutlet UILabel *ScoreNumberLabel;
    IBOutlet UILabel *Timer;
    IBOutlet UILabel *CountdownLabel;
    
    //Buttons
    IBOutlet UIButton *Pause;
    IBOutlet UIButton *Resume;
    IBOutlet UIButton *Back;
    
    //GameButtons
    IBOutlet UIButton *Acid;
    IBOutlet UIButton *Base;
    
    //Acid Base Indicators
    IBOutlet UILabel *Meth;//Methyl Orange
    IBOutlet UILabel *Phen;//Phenolphtalein
    IBOutlet UILabel *Litmus;//Litmus
    IBOutlet UILabel *Thymol;//Thymol Blue
    IBOutlet UILabel *BromGreen;//Bromcresol Green
    IBOutlet UILabel *BromBlu;//Bromothymol Blue

    //Timers
    NSTimer *CountDownStart;
    NSTimer *GameTimer;
    NSTimer *FlaskRandomnizer;//switches the flask colors
    
}
@end
