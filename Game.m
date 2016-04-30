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

-(void)SwipeLeftMethod{
        Spawn.center = CGPointMake(Spawn.center.x - horizontal, Spawn.center.y);
        [UIView animateWithDuration:0.5
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
        [UIView animateWithDuration:0.5
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
        [UIView animateWithDuration:0.5
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
        [UIView animateWithDuration:0.5
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
        
        //swipe recognizers
        if(CGRectIntersectsRect(Spawn.frame, SpawnBox.frame)){
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
        
    Up = NO;
    Down = NO;
    Left = NO;
    Right = NO;
    
    Boundaries = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(BoundariesMethod) userInfo:nil repeats:YES];
   
    
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
