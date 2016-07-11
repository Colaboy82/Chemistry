//
//  RightColorChange.h
//  ProColors
//
//  Created by Grumpy1211 on 6/26/16.
//  Copyright © 2016 MuSquared. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AcidOrBase : UIViewController
{

    
    //GamePiece
    IBOutlet UIImageView *Spawn;
    
    //Labels
    IBOutlet UILabel *ScoreLabel;
    IBOutlet UILabel *ScoreNumberLabel;
    IBOutlet UILabel *Timer;
    
    //Buttons
    IBOutlet UIButton *Pause;
    IBOutlet UIButton *Resume;
    IBOutlet UIButton *Back;
    
    //GameButtons
    IBOutlet UIButton *Acid;
    IBOutlet UIButton *Base;
    IBOutlet UIButton *Blue;
    IBOutlet UIButton *Red;
    

}
@end
