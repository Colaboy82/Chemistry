//
//  Game.h
//  ProColors
//
//  Created by Grumpy1211 on 4/17/16.
//  Copyright © 2016 MuSquared. All rights reserved.
//

#import <UIKit/UIKit.h>

BOOL Up;
BOOL Down;
BOOL Left;
BOOL Right;

double vertical = 63;
double horizontal = 70;

int start = 3;
int CountdownNumber = 60;

@interface Game : UIViewController
{
    //Backgrounds
    IBOutlet UIImageView *SpawnBox;
    IBOutlet UIImageView *Red;
    IBOutlet UIImageView *Yellow;
    IBOutlet UIImageView *Green;
    IBOutlet UIImageView *Orange;
    IBOutlet UIImageView *Border;
    
    //Labels
    IBOutlet UILabel *Score;
    IBOutlet UILabel *Timer;
    IBOutlet UILabel *CountdownLabel;
    
    //Game Pieces
    IBOutlet UIImageView *Spawn; //Piece to be swiped
    
    IBOutlet UIImageView *Li; //Red
    IBOutlet UIImageView *Ca; //Orange
    IBOutlet UIImageView *Na; //Yellow
    IBOutlet UIImageView *Cu; //Green
    
    //Extras
    IBOutlet UIImageView *Ba; //Green
    IBOutlet UIImageView *St; //Red
    
    //Timers
    NSTimer *Boundaries;//Checks that the spawned object does not leave the screen
    NSTimer *Hide;//Hides the spawned object after it touches a color
    NSTimer *SpawnTimer; //Spawns the object in the box
    NSTimer *ScoreTimer;//Keeps track of the score
    NSTimer *CountdownTimer;//The timer
    NSTimer *StartTimer;//Timer that counts 3, 2, 1
    NSTimer *SwitchObjectsTimer;//switches object that spawns
}


-(void)SwipeRightMethod;
-(void)SwipeLeftMethod;
-(void)SwipeUpMethod;
-(void)SwipeDownMethod;

@end
