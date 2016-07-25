//
//  RightColorChange.h
//  ProColors
//
//  Created by Grumpy1211 on 6/26/16.
//  Copyright © 2016 MuSquared. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>

int ScoreNumber;
int CountdownInt;
int GameTimerInt;
int HighScore;

BOOL correctSelect;
BOOL acidBool;

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

    //Check and X
    IBOutlet UIImageView *CheckMark;
    IBOutlet UIImageView *X;
    
    //Timers
    NSTimer *CountDownStart;
    NSTimer *GameTimer;
    NSTimer *FlaskRandomnizer;//switches the flask colors
    NSTimer *IndicatorRandomizer;//switches the acid/base indicator
    NSTimer *SwitchToLoseBase;
    NSTimer *SwitchToLoseAcid;
    NSTimer *SwitchToWin;
    
}
@end
