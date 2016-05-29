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

//Pause and Resume Methods

-(void)pauseLayer:(CALayer *)layer{
    
    CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    layer.speed=0.0;
    layer.timeOffset=pausedTime;
   
    Spawn.userInteractionEnabled = NO;
    [CountdownTimer invalidate];
    [Boundaries invalidate];
}

-(void)resumeLayer:(CALayer *)layer{
    
    CFTimeInterval pausedTime =[layer timeOffset];
    layer.speed=1.0;
    layer.timeOffset=0.0;
    layer.beginTime=0.0;
    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil]-pausedTime;
    layer.beginTime = timeSincePause;

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
    int randomObject = rand() % 3;
    if(Spawn.hidden == YES){
        switch (randomObject) {
            case 0:
                Spawn.image=[UIImage imageNamed:@"Boy.png"];
                break;
            case 1:
                Spawn.image=[UIImage imageNamed:@"arrow.png"];
                break;
            case 2:
                Spawn.image=[UIImage imageNamed:@"Boy.png"];
                break;
        }
    }
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
        Spawn.center = CGPointMake(Spawn.center.x, Spawn.center.y + vertical);
        [UIView animateWithDuration:0.05
                         animations:^{
                             Spawn.center = CGPointMake(Spawn.center.x, Spawn.center.y + vertical);
                         }];
        Up = NO;
        Down = YES;
        Left = NO;
        Right = NO;
}

-(void)BoundariesMethod{
    if(CGRectIntersectsRect(Spawn.frame, SpawnBox.frame)){
        horizontal = 63;
        vertical = 70;
    }else{
        horizontal = 0;
        vertical = 0;
        Hide = [NSTimer scheduledTimerWithTimeInterval:0.6 target:self selector:@selector(HideObject) userInfo:nil repeats:NO];
    }
}
-(void)HideObject{
    Spawn.hidden = YES;
    Spawn.center = CGPointMake(160 ,239);
    //Spawn Object Timer
    SwitchObjectsTimer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(SwitchObject) userInfo:nil repeats:NO];
    //Respawns image
    SpawnTimer = [NSTimer scheduledTimerWithTimeInterval:0.6 target:self selector:@selector(Respawn) userInfo:nil repeats:NO];
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
    }
}
-(void)Countdown{
    CountdownNumber = CountdownNumber - 1;
    NSString *TimeLeft = [NSString stringWithFormat:@"Time Left: %i", CountdownNumber];
    Timer.text = TimeLeft;
    if(CountdownNumber == 0){
        [CountdownTimer invalidate];
        [self EndGame];
    }
}
-(void)EndGame{//ends the game
    Spawn.userInteractionEnabled = NO;
    Spawn.hidden = YES;
}
- (void)viewDidLoad {
    
    //NSLog(@"x: %f",  Spawn.center.x);
    //NSLog(@"y: %f",  Spawn.center.y);
    
    StartTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(StartCountdown) userInfo:nil repeats:YES];
    
    start = 3;
    
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

@end
