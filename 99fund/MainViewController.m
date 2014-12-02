//
//  MainViewController.m
//  99fund
//
//  Created by Liming Tian on 12/2/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import "MainViewController.h"
#import "CashTreasureViewController.h"
#import "HighFinanceViewController.h"
#import "FundViewController.h"
#import "QueryViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initSubviews];
}

- (void)initSubviews
{
    CashTreasureViewController *cashTreasureVC = [[CashTreasureViewController alloc] init];
    UINavigationController *cashTreasureNavC = [[UINavigationController alloc] initWithRootViewController:cashTreasureVC];
    
    HighFinanceViewController *highFinanceVC = [[HighFinanceViewController alloc] init];
    UINavigationController *highFinanceNavC = [[UINavigationController alloc] initWithRootViewController:highFinanceVC];
    
    FundViewController *fundVC = [[FundViewController alloc] init];
    UINavigationController *fundNavC = [[UINavigationController alloc] initWithRootViewController:fundVC];
    
    QueryViewController *queryVC = [[QueryViewController alloc] init];
    UINavigationController *queryNavC = [[UINavigationController alloc] initWithRootViewController:queryVC];
    
    NSArray *viewControllers = @[cashTreasureNavC,highFinanceNavC,fundNavC,queryNavC];
    
    [self setViewControllers:viewControllers animated:YES];
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
