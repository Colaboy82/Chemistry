//
//  WinAcidBaseViewController.m
//  ProColors
//
//  Created by Grumpy1211 on 7/24/16.
//  Copyright © 2016 MuSquared. All rights reserved.
//

#import "WinAcidBaseViewController.h"

@interface WinAcidBaseViewController ()

@end

@implementation WinAcidBaseViewController

- (void)viewDidLoad {
    
    Score = [[NSUserDefaults standardUserDefaults] integerForKey:@"IndicatorScoreSaved"];
    ScoreLabel.text = [NSString stringWithFormat:@"Score: %i", Score];

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
