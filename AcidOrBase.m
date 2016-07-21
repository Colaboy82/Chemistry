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
-(IBAction)AcidFunction:(id)sender{
    if(acidBool == YES){
        ScoreNumber = ScoreNumber + 1;
        ScoreNumberLabel.text = [NSString stringWithFormat:@"%i", ScoreNumber];
        correctSelect = YES;
        
        X.hidden = YES;
        CheckMark.hidden = NO;
        
        Acid.hidden = YES;
        Base.hidden = YES;
        
        FlaskRandomnizer = [NSTimer scheduledTimerWithTimeInterval:0.75 target:self selector:@selector(FlaskChooser) userInfo:nil repeats:NO];
    }
    if(acidBool == NO){
        //[self EndGame];
        correctSelect = NO;
        X.hidden = NO;
        CheckMark.hidden = YES;
    }
}
-(IBAction)BaseFunction:(id)sender{
    if(acidBool == NO){
        ScoreNumber = ScoreNumber + 1;
        ScoreNumberLabel.text = [NSString stringWithFormat:@"%i", ScoreNumber];
        correctSelect = YES;
        
        X.hidden = YES;
        CheckMark.hidden = NO;
        
        Acid.hidden = YES;
        Base.hidden = YES;
        
        FlaskRandomnizer = [NSTimer scheduledTimerWithTimeInterval:0.75 target:self selector:@selector(FlaskChooser) userInfo:nil repeats:NO];
    }
    if(acidBool == YES){
        //[self EndGame];
        correctSelect = NO;
        X.hidden = NO;
        CheckMark.hidden = YES;
    }
}
-(void)EndGameTimer{
    GameTimerInt = GameTimerInt - 1;
    NSString *GameTimerString = [NSString stringWithFormat:@"%i",GameTimerInt];
    Timer.text = GameTimerString;
    if(GameTimerInt == 0){
        [GameTimer invalidate];
        [self EndGame];
    }
}
-(void)EndGame{
    Acid.hidden = YES;
    Base.hidden = YES;
    
    [GameTimer invalidate];

    
    [self updateScore:ScoreNumber forLeaderboardID:@"Indicator_High_Score"];
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
        Acid.hidden = NO;
        Base.hidden = NO;
        
        GameTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(EndGameTimer) userInfo:nil repeats:YES];
    }
}
-(void)FlaskChooser{
    Acid.hidden = NO;
    Base.hidden = NO;
    X.hidden = YES;
    CheckMark.hidden = YES;
    int randomObject = rand() % 12;
    if(correctSelect == YES){
        switch (randomObject) {
            case 0://acid
                Spawn.image = [UIImage imageNamed:@"clear.png"];
                
                acidBool = YES;
                
                Meth.hidden = YES;
                Phen.hidden = NO;
                Litmus.hidden = YES;
                Thymol.hidden = YES;
                BromGreen.hidden = YES;
                BromBlu.hidden = YES;
                break;
            case 1://acid
                Spawn.image = [UIImage imageNamed:@"red.png"];
                
                acidBool = YES;
                
                Meth.hidden = NO;
                Phen.hidden = YES;
                Litmus.hidden = YES;
                Thymol.hidden = YES;
                BromGreen.hidden = YES;
                BromBlu.hidden = YES;
                break;
            case 2://base
                Spawn.image = [UIImage imageNamed:@"yellow.png"];
                
                acidBool = NO;
                
                Meth.hidden = NO;
                Phen.hidden = YES;
                Litmus.hidden = YES;
                Thymol.hidden = YES;
                BromGreen.hidden = YES;
                BromBlu.hidden = YES;
                break;
            case 3://base
                Spawn.image = [UIImage imageNamed:@"blue.png"];
                
                acidBool = NO;

                Meth.hidden = YES;
                Phen.hidden = YES;
                Litmus.hidden = NO;
                Thymol.hidden = YES;
                BromGreen.hidden = YES;
                BromBlu.hidden = YES;
                break;
            case 4://base
                Spawn.image = [UIImage imageNamed:@"pink.png"];
                
                acidBool = NO;

                Meth.hidden = YES;
                Phen.hidden = NO;
                Litmus.hidden = YES;
                Thymol.hidden = YES;
                BromGreen.hidden = YES;
                BromBlu.hidden = YES;
                break;
            case 5://acid
                Spawn.image = [UIImage imageNamed:@"red.png"];
                
                acidBool =  YES;

                Meth.hidden = YES;
                Phen.hidden = YES;
                Litmus.hidden = NO;
                Thymol.hidden = YES;
                BromGreen.hidden = YES;
                BromBlu.hidden = YES;
                break;
            case 6://base
                Spawn.image = [UIImage imageNamed:@"blue.png"];
                
                acidBool = NO;

                Meth.hidden = YES;
                Phen.hidden = YES;
                Litmus.hidden = YES;
                Thymol.hidden = NO;
                BromGreen.hidden = YES;
                BromBlu.hidden = YES;
                break;
            case 7://acid
                Spawn.image = [UIImage imageNamed:@"yellow.png"];
                
                acidBool = YES;

                Meth.hidden = YES;
                Phen.hidden = YES;
                Litmus.hidden = YES;
                Thymol.hidden = NO;
                BromGreen.hidden = YES;
                BromBlu.hidden = YES;
                break;
            case 8://base
                Spawn.image = [UIImage imageNamed:@"blue.png"];
                
                acidBool = NO;

                Meth.hidden = YES;
                Phen.hidden = YES;
                Litmus.hidden = YES;
                Thymol.hidden = YES;
                BromGreen.hidden = NO;
                BromBlu.hidden = YES;
                break;
            case 9://acid
                Spawn.image = [UIImage imageNamed:@"yellow.png"];
                
                acidBool = YES;

                Meth.hidden = YES;
                Phen.hidden = YES;
                Litmus.hidden = YES;
                Thymol.hidden = YES;
                BromGreen.hidden = NO;
                BromBlu.hidden = YES;
                break;
            case 10://base
                Spawn.image = [UIImage imageNamed:@"blue.png"];
                
                acidBool = NO;

                Meth.hidden = YES;
                Phen.hidden = YES;
                Litmus.hidden = YES;
                Thymol.hidden = YES;
                BromGreen.hidden = YES;
                BromBlu.hidden = NO;
                break;
            case 11://acid
                Spawn.image = [UIImage imageNamed:@"yellow.png"];
                
                acidBool = YES;

                Meth.hidden = YES;
                Phen.hidden = YES;
                Litmus.hidden = YES;
                Thymol.hidden = YES;
                BromGreen.hidden = YES;
                BromBlu.hidden = NO;
                break;
        }
    }
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
    
    correctSelect = YES;
    
    CountdownInt = 3;
    GameTimerInt = 30;
    
    CountDownStart = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(Countdown) userInfo:nil repeats:YES];
    FlaskRandomnizer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(FlaskChooser) userInfo:nil repeats:NO];
    
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
