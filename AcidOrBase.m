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
/*-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:touch.view];
    Spawn.center = location;
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [self touchesBegan:touches withEvent:event];
}*/
- (void)viewDidLoad {
    //Guess the right color or if its and acid or base
    //either tell if its an acid or base and predict color based on the indicator
    //or tell what color it will turn if its an acid or base
    //different indicators are used
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
