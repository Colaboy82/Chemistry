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
}
-(void)SwipeRightMethod{
        Spawn.center = CGPointMake(Spawn.center.x + horizontal, Spawn.center.y);
        [UIView animateWithDuration:0.5
                         animations:^{
                             Spawn.center = CGPointMake(Spawn.center.x + horizontal, Spawn.center.y);
                         }];
}
-(void)SwipeUpMethod{
        Spawn.center = CGPointMake(Spawn.center.x, Spawn.center.y - vertical);
        [UIView animateWithDuration:0.5
                         animations:^{
                             Spawn.center = CGPointMake(Spawn.center.x, Spawn.center.y - vertical);
                         }];
}
-(void)SwipeDownMethod{
        Spawn.center = CGPointMake(Spawn.center.x, Spawn.center.y + vertical);
        [UIView animateWithDuration:0.5
                         animations:^{
                             Spawn.center = CGPointMake(Spawn.center.x, Spawn.center.y + vertical);
                         }];
}

-(void)BoundariesMethod{
    if(CGRectIntersectsRect(Spawn.frame, SpawnBox.frame)){
        
    }
}

- (void)viewDidLoad {
    
    User = YES;
    
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
