//
//  Game.m
//  ProColors
//
//  Created by Grumpy1211 on 4/17/16.
//  Copyright © 2016 MuSquared. All rights reserved.
//

#import "Game.h"

@interface Game ()

@end

@implementation Game

-(IBAction)Back:(id)sender{
    [Boundaries invalidate];
    [Hide invalidate];
    [SpawnTimer invalidate];
    [ScoreTimer invalidate];
    [CountdownTimer invalidate];
    [StartTimer invalidate];
    [SwitchObjectsTimer invalidate];
    [SwitchColorTimer invalidate];
}

//Pause and Resume Methods

-(void)pauseLayer:(CALayer *)layer{
    Spawn.userInteractionEnabled = NO;
    [CountdownTimer invalidate];
    [Boundaries invalidate];
}

-(void)resumeLayer:(CALayer *)layer{
    CountdownTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(Countdown) userInfo:nil repeats:YES];
    Boundaries = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(BoundariesMethod) userInfo:nil repeats:YES];
    Spawn.userInteractionEnabled = YES;
}
-(IBAction)Pause{
    
    [self pauseLayer:self.view.layer];
    Resume.hidden = NO;
    Back.hidden = NO;
    Pause.hidden = YES;
    PauseTouch = YES;
    Spawn.hidden = YES;
}

-(IBAction)Resume{
    
    [self resumeLayer:self.view.layer];
    Resume.hidden = YES;
    Back.hidden = YES;
    Pause.hidden = NO;
    PauseTouch = NO;
    Spawn.hidden = NO;
}

-(void)SwitchObject{
    int randomObject = rand() % 5;
    if(Spawn.hidden == YES){
        switch (randomObject) {
            case 0:
                Spawn.image=[UIImage imageNamed:@"Cu-ionized.png"];//Green
                GreenBool = YES;
                RedBool = NO;
                YellowBool = NO;
                OrangeBool = NO;
                break;
            case 1:
                Spawn.image=[UIImage imageNamed:@"Ca-ionized.png"];//Orange
                GreenBool = NO;
                RedBool = NO;
                YellowBool = NO;
                OrangeBool = YES;
                break;
            case 2:
                Spawn.image=[UIImage imageNamed:@"Li-ionized.png"];//Red
                GreenBool = NO;
                RedBool = YES;
                YellowBool = NO;
                OrangeBool = NO;
                break;
            case 3:
                Spawn.image=[UIImage imageNamed:@"Na-ionized.png"];//Yellow
                GreenBool = NO;
                RedBool = NO;
                YellowBool = YES;
                OrangeBool = NO;
                break;
            case 4:
                Spawn.image=[UIImage imageNamed:@"St-ionized.png"];//Red
                GreenBool = NO;
                RedBool = YES;
                YellowBool = NO;
                OrangeBool = NO;
                break;
        }
    }
}
-(void)SwitchColors{
   /* int randomObject = rand() % 4;
    if(Spawn.hidden == YES){
        switch (randomObject) {
            case 0://Left,Top,right,bottom G/R/Y/O
                TopBox.image = [UIImage imageNamed:@"Red brick.png"];
                BottomBox.image = [UIImage imageNamed:@"Orange Brick.png"];
                LeftBox.image = [UIImage imageNamed:@"Green Brick.png"];
                RightBox.image = [UIImage imageNamed:@"Yellow Brick.png"];
                
                GreenTop = NO;
                GreenBottom = NO;
                GreenLeft = YES;
                GreenRight = NO;
                
                RedTop = YES;
                RedBottom = NO;
                RedLeft = NO;
                RedRight = NO;
                
                YellowTop = NO;
                YellowBottom = NO;
                YellowLeft = NO;
                YellowRight = YES;
                
                OrangeTop = NO;
                OrangeBottom = YES;
                OrangeLeft = NO;
                OrangeRight = NO;
                break;
            case 1://Left,Top,right,bottom O/G/R/Y
                TopBox.image = [UIImage imageNamed:@"Green Brick.png"];
                BottomBox.image = [UIImage imageNamed:@"Yellow Brick.png"];
                LeftBox.image = [UIImage imageNamed:@"Orange Brick.png"];
                RightBox.image = [UIImage imageNamed:@"Red brick.png"];
                
                GreenTop = YES;
                GreenBottom = NO;
                GreenLeft = NO;
                GreenRight = NO;
                
                RedTop = NO;
                RedBottom = NO;
                RedLeft = NO;
                RedRight = YES;
                
                YellowTop = NO;
                YellowBottom = YES;
                YellowLeft = NO;
                YellowRight = NO;
                
                OrangeTop = NO;
                OrangeBottom = NO;
                OrangeLeft = YES;
                OrangeRight = NO;
                break;
            case 2://Left,Top,right,bottom Y/O/G/R
                TopBox.image = [UIImage imageNamed:@"Orange Brick.png"];
                BottomBox.image = [UIImage imageNamed:@"Red brick.png"];
                LeftBox.image = [UIImage imageNamed:@"Yellow Brick.png"];
                RightBox.image = [UIImage imageNamed:@"Green Brick.png"];
                
                GreenTop = NO;
                GreenBottom = NO;
                GreenLeft = NO;
                GreenRight = YES;
                
                RedTop = NO;
                RedBottom = YES;
                RedLeft = NO;
                RedRight = NO;
                
                YellowTop = NO;
                YellowBottom = NO;
                YellowLeft = YES;
                YellowRight = NO;
                
                OrangeTop = YES;
                OrangeBottom = NO;
                OrangeLeft = NO;
                OrangeRight = NO;
                break;
            case 3://Left,Top,right,bottom R/Y/O/G
                TopBox.image = [UIImage imageNamed:@"Yellow Brick.png"];
                BottomBox.image = [UIImage imageNamed:@"Green Brick.png"];
                LeftBox.image = [UIImage imageNamed:@"Red brick.png"];
                RightBox.image = [UIImage imageNamed:@"Orange Brick.png"];
                
                GreenTop = NO;
                GreenBottom = YES;
                GreenLeft = NO;
                GreenRight = NO;
                
                RedTop = NO;
                RedBottom = NO;
                RedLeft = YES;
                RedRight = NO;
                
                YellowTop = YES;
                YellowBottom = NO;
                YellowLeft = NO;
                YellowRight = NO;
                
                OrangeTop = NO;
                OrangeBottom = NO;
                OrangeLeft = NO;
                OrangeRight = YES;
                break;
        }
    }*/
}

-(void)SwipeLeftMethod{
        Spawn.center = CGPointMake(Spawn.center.x - horizontal, Spawn.center.y);
        [UIView animateWithDuration:0.05
                         animations:^{
                             Spawn.center = CGPointMake(Spawn.center.x - horizontal, Spawn.center.y);
                         }];
        Up = NO;
        Down = NO;
        Left = YES;
        Right = NO;
}
-(void)SwipeRightMethod{
        Spawn.center = CGPointMake(Spawn.center.x + horizontal, Spawn.center.y);
        [UIView animateWithDuration:0.05
                         animations:^{
                             Spawn.center = CGPointMake(Spawn.center.x + horizontal, Spawn.center.y);
                         }];
        Up = NO;
        Down = NO;
        Left = NO;
        Right = YES;
}
-(void)SwipeUpMethod{
        Spawn.center = CGPointMake(Spawn.center.x, Spawn.center.y - vertical);
        [UIView animateWithDuration:0.05
                         animations:^{
                             Spawn.center = CGPointMake(Spawn.center.x, Spawn.center.y - vertical);
                         }];
        Up = YES;
        Down = NO;
        Left = NO;
        Right = NO;
}
-(void)SwipeDownMethod{
        Spawn.center = CGPointMake(Spawn.center.x, Spawn.center.y + vertical + 10);
        [UIView animateWithDuration:0.05
                         animations:^{
                             Spawn.center = CGPointMake(Spawn.center.x, Spawn.center.y + vertical + 10);
                         }];
        Up = NO;
        Down = YES;
        Left = NO;
        Right = NO;
}

-(void)BoundariesMethod{
    if(CGRectIntersectsRect(Spawn.frame, SpawnBox.frame)){
        horizontal = 80;
        vertical = 130;
    }else{
        horizontal = 0;
        vertical = 0;
        Hide = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(HideObject) userInfo:nil repeats:NO];
    }
}
-(void)HideObject{
    Spawn.hidden = YES;
    Spawn.center = CGPointMake(SpawnBox.center.x ,SpawnBox.center.y);//160,239
    //Spawn Object Timer
    SwitchObjectsTimer = [NSTimer scheduledTimerWithTimeInterval:0.4 target:self selector:@selector(SwitchObject) userInfo:nil repeats:NO];
    //Switch Color Timer
    SwitchColorTimer = [NSTimer scheduledTimerWithTimeInterval:0.4 target:self selector:@selector(SwitchColors) userInfo:nil repeats:NO];
    //Respawns image
    SpawnTimer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(Respawn) userInfo:nil repeats:NO];
}
-(void)Respawn{
    Spawn.hidden = NO;
}
-(void)StartCountdown{
    start = start - 1;
    NSString *CountdownString = [NSString stringWithFormat:@"%i",start];
    CountdownLabel.text = CountdownString;
    if(start == 0){
        [StartTimer invalidate];
        
        CountdownLabel.hidden = YES;
        Pause.hidden = NO;
        
        //swipe recognizers
        if(CGRectIntersectsRect(Spawn.frame, SpawnBox.frame) && PauseTouch == NO){
            UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(SwipeUpMethod)];
            swipeUp.direction = UISwipeGestureRecognizerDirectionUp;
            [self.view addGestureRecognizer:swipeUp];
            
            UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(SwipeDownMethod)];
            swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
            [self.view addGestureRecognizer:swipeDown];
            
            UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(SwipeLeftMethod)];
            swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
            [self.view addGestureRecognizer:swipeLeft];
            
            UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(SwipeRightMethod)];
            swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
            [self.view addGestureRecognizer:swipeRight];
        }
        
        //Timer
        CountdownTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(Countdown) userInfo:nil repeats:YES];
        ScoreTimer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(ScoreTracker) userInfo:nil repeats:YES];
    }
}
-(void)ScoreTracker{
    if(GreenBool == YES && GreenLeft == YES && CGRectIntersectsRect(LeftBox.frame, Spawn.frame) && Spawn.image==[UIImage imageNamed:@"Cu-ionized.png"] && LeftBox.image == [UIImage imageNamed:@"Green Brick.png"]){
        ScoreNumber = ScoreNumber + 1;//300000
        Score.text = [NSString stringWithFormat:@"Score: %i", ScoreNumber];
    }

}
-(void)Countdown{
    CountdownNumber = CountdownNumber - 1;
    NSString *TimeLeft = [NSString stringWithFormat:@"Time Left: %i", CountdownNumber];
    Timer.text = TimeLeft;
    if(CountdownNumber == 0){
        [CountdownTimer invalidate];
        [self EndGame];
        if(ScoreNumber > HighScore){
            HighScore = ScoreNumber;
            [[NSUserDefaults standardUserDefaults] setInteger:ScoreNumber forKey:@"HighScoreSaved"];
            [self updateScore:ScoreNumber forLeaderboardID:@"Pro_Colors_Score"];
        }
    }
}
-(void)EndGame{//ends the game
    Spawn.userInteractionEnabled = NO;
    Spawn.hidden = YES;
    [ScoreTimer invalidate];
    [SwitchColorTimer invalidate];
    [SwitchObjectsTimer invalidate];
    SwitchToMenu = [NSTimer scheduledTimerWithTimeInterval:0.85 target:self selector:@selector(SwitchViewControllers) userInfo:nil repeats:NO];
}
-(void) SwitchViewControllers{
    [self dismissViewControllerAnimated:YES completion:nil];

}
- (void)viewDidLoad {
    
    //NSLog(@"x: %f",  Spawn.center.x);
    //NSLog(@"y: %f",  Spawn.center.y);
    
    StartTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(StartCountdown) userInfo:nil repeats:YES];

    start = 3;
    ScoreNumber = 0;
    CountdownNumber = 60;
    
    Up = NO;
    Down = NO;
    Left = NO;
    Right = NO;
    
    PauseTouch = NO;
    
    Boundaries = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(BoundariesMethod) userInfo:nil repeats:YES];
   
    Pause.hidden = YES;
    Resume.hidden = YES;
    Back.hidden = YES;
    
    
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
- (void) updateScore: (int64_t) score
    forLeaderboardID: (NSString*) category
{
    GKScore *scoreObj = [[GKScore alloc]
                         initWithCategory:category];
    scoreObj.value = score;
    scoreObj.context = 0;
    [scoreObj reportScoreWithCompletionHandler:^(NSError *error) {
        // Completion code can be added here
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:nil message:@"Score Updated Succesfully"
                              delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        //[alert show];
        
    }];
}


@end
