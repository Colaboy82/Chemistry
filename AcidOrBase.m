//
//  RightColorChange.m
//  ProColors
//
//  Created by Grumpy1211 on 6/26/16.
//  Copyright © 2016 MuSquared. All rights reserved.
//

#import "AcidOrBase.h"

@interface AcidOrBase ()

@end

@implementation AcidOrBase

-(IBAction)Back:(id)sender{
    
}

-(void)pauseLayer:(CALayer *)layer{
    Spawn.userInteractionEnabled = NO;

}

-(void)resumeLayer:(CALayer *)layer{
    Spawn.userInteractionEnabled = YES;
}
-(IBAction)Pause{
    [self pauseLayer:self.view.layer];
    Resume.hidden = NO;
    Back.hidden = NO;
    Pause.hidden = YES;
    Spawn.hidden = YES;
}

-(IBAction)Resume{
    [self resumeLayer:self.view.layer];
    Resume.hidden = YES;
    Back.hidden = YES;
    Pause.hidden = NO;
    Spawn.hidden = NO;
}
-(void)EndGameTimer{
    GameTimerInt = GameTimerInt - 1;
    NSString *GameTimerString = [NSString stringWithFormat:@"%i",GameTimerInt];
    Timer.text = GameTimerString;
    if(GameTimerInt == 0){
        [GameTimer invalidate];
    }
}

-(void)Countdown{
    CountdownInt = CountdownInt - 1;
    NSString *CountdownString = [NSString stringWithFormat:@"%i",CountdownInt];
    CountdownLabel.text = CountdownString;
    if(CountdownInt == 0){
        [CountDownStart invalidate];
        Spawn.hidden = NO;
        CountdownLabel.hidden = YES;
        Pause.hidden = NO;
    }
    GameTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(EndGameTimer) userInfo:nil repeats:YES];
}

- (void)viewDidLoad {
    //Guess the right color or if its and acid or base
    //either tell if its an acid or base and predict color based on the indicator
    //or tell what color it will turn if its an acid or base
    //different indicators are used
    Resume.hidden = YES;
    Back.hidden = YES;
    
    Acid.hidden = YES;
    Base.hidden = YES;
    
    Meth.hidden = YES;
    Phen.hidden = YES;
    Litmus.hidden = YES;
    Thymol.hidden = YES;
    BromGreen.hidden = YES;
    BromBlu.hidden = YES;
    
    CountdownInt = 3;
    GameTimerInt = 30;
    
    CountDownStart = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(Countdown) userInfo:nil repeats:YES];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
