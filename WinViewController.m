//
//  WinViewController.m
//  ProColors
//
//  Created by Grumpy1211 on 6/25/16.
//  Copyright © 2016 MuSquared. All rights reserved.
//

#import "WinViewController.h"

@interface WinViewController ()

@end

@implementation WinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    GameScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"ScoreSaved"];
    ScoreLabel.text = [NSString stringWithFormat:@"Score: %i", GameScore];
    
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
