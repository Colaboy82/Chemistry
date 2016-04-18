//
//  Game.h
//  ProColors
//
//  Created by Grumpy1211 on 4/17/16.
//  Copyright © 2016 MuSquared. All rights reserved.
//

#import <UIKit/UIKit.h>

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
    IBOutlet UILabel *Lives;
    
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
}


-(void)SwipeRightMethod;
-(void)SwipeLeftMethod;
-(void)SwipeUpMethod;
-(void)SwipeDownMethod;

@end
