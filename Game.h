//
//  Game.h
//  ProColors
//
//  Created by Grumpy1211 on 4/17/16.
//  Copyright © 2016 MuSquared. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>

BOOL Up;
BOOL Down;
BOOL Left;
BOOL Right;

BOOL ScoreBool;

BOOL PauseTouch;//checks to see if paused; if it is the gestures will not be recognized

double vertical = 130;//63
double horizontal = 80;//70

int start;
int CountdownNumber;
int ScoreNumber;
int HighScore;

//Booleans for SpawnImage
BOOL GreenBool;
BOOL RedBool;
BOOL YellowBool;
BOOL OrangeBool;
BOOL BadBool;

//Top Booleans
BOOL GreenTop;
BOOL RedTop;
BOOL YellowTop;
BOOL OrangeTop;
//Bottom Booleans
BOOL GreenBottom;
BOOL RedBottom;
BOOL YellowBottom;
BOOL OrangeBottom;
//Left Booleans
BOOL GreenLeft;
BOOL RedLeft;
BOOL YellowLeft;
BOOL OrangeLeft;
//Right Booleans
BOOL GreenRight;
BOOL RedRight;
BOOL YellowRight;
BOOL OrangeRight;

@interface Game : UIViewController <GKLeaderboardViewControllerDelegate>
{
    IBOutlet UIImageView *ColorGuide;
    
    //Arrows
    IBOutlet UIImageView *LeftArrow;
    IBOutlet UIImageView *RightArrow;
    IBOutlet UIImageView *UpArrow;
    IBOutlet UIImageView *DownArrow;
    
    //Buttons
    IBOutlet UIButton *Pause;
    IBOutlet UIButton *Resume;
    IBOutlet UIButton *Back;
    
    //Backgrounds
    IBOutlet UIImageView *SpawnBox;
    IBOutlet UIImageView *TopBox;
    IBOutlet UIImageView *BottomBox;
    IBOutlet UIImageView *LeftBox;
    IBOutlet UIImageView *RightBox;
    
    //Labels
    IBOutlet UILabel *Score;
    IBOutlet UILabel *Timer;
    IBOutlet UILabel *CountdownLabel;
    
    //Game Pieces
    IBOutlet UIImageView *Spawn; //Piece to be swiped
    
    //Timers
    NSTimer *Boundaries;//Checks that the spawned object does not leave the screen
    NSTimer *Hide;//Hides the spawned object after it touches a color
    NSTimer *SpawnTimer; //Spawns the object in the box
    NSTimer *ScoreTimer;//Keeps track of the score
    NSTimer *CountdownTimer;//The timer
    NSTimer *StartTimer;//Timer that counts 3, 2, 1
    NSTimer *SwitchObjectsTimer;//switches object that spawns
    NSTimer *SwitchColorTimer;//switches the colors
    NSTimer *SwitchToMenu;
    NSTimer *SwitchToLose;
    NSTimer *LifeTimer; //timer that keeps track if the player has one life or not
    NSTimer *SpawnInBox;
    NSTimer *BadBoolTimer;
    NSTimer *ArrowHelper;
    NSTimer *ColorGuideTimer;
}


-(void)SwipeRightMethod;
-(void)SwipeLeftMethod;
-(void)SwipeUpMethod;
-(void)SwipeDownMethod;

-(IBAction)Back:(id)sender;

@end
