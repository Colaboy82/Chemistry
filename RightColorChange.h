//
//  RightColorChange.h
//  ProColors
//
//  Created by Grumpy1211 on 6/26/16.
//  Copyright © 2016 MuSquared. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RightColorChange : UIViewController
{
    //Options
    IBOutlet UIImageView *Option1;
    IBOutlet UIImageView *Option2;
    IBOutlet UIImageView *Option3;
    
    //Color
    IBOutlet UIImageView *Color1;
    IBOutlet UIImageView *Color2;
    IBOutlet UIImageView *Color3;
    
    //GamePiece
    IBOutlet UIImageView *Spawn;
    
    //Labels
    IBOutlet UILabel *ScoreLabel;
    IBOutlet UILabel *ScoreNumberLabel;
    
    //Buttons
    IBOutlet UIButton *Pause;
    IBOutlet UIButton *Resume;
    IBOutlet UIButton *Back;

}
@end
