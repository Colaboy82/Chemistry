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
    Spawn.center = CGPointMake(Spawn.center.x - 125, Spawn.center.y);
    [UIView animateWithDuration:0.5
                     animations:^{
                         Spawn.center = CGPointMake(Spawn.center.x - 125, Spawn.center.y);
                     }];
    Spawn.userInteractionEnabled = NO;
}
-(void)SwipeRightMethod{
    Spawn.center = CGPointMake(Spawn.center.x + 125, Spawn.center.y);
    [UIView animateWithDuration:0.5
                     animations:^{
                         Spawn.center = CGPointMake(Spawn.center.x + 125, Spawn.center.y);
                     }];
    Spawn.userInteractionEnabled = NO;
}
-(void)SwipeUpMethod{
    Spawn.center = CGPointMake(Spawn.center.x, Spawn.center.y - 144);
    [UIView animateWithDuration:0.5
                     animations:^{
                         Spawn.center = CGPointMake(Spawn.center.x, Spawn.center.y - 144);
                     }];
    Spawn.userInteractionEnabled = NO;

}
-(void)SwipeDownMethod{
    Spawn.center = CGPointMake(Spawn.center.x, Spawn.center.y + 143);
    [UIView animateWithDuration:0.5
                     animations:^{
                         Spawn.center = CGPointMake(Spawn.center.x, Spawn.center.y + 143);
                     }];
    Spawn.userInteractionEnabled = NO;
}


- (void)viewDidLoad {
    
    //Spawn.userInteractionEnabled = YES;
    
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
