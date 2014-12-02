//
//  StartViewController.m
//  StartScrollViewDemo
//
//  Created by Liming Tian on 12/1/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import "StartViewController.h"
#import "MainViewController.h"

@interface StartViewController ()
{
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;
    UIButton *_startButton;
}
@end

@implementation StartViewController

#pragma mark - UIViewController Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    if (![@"YES" isEqualToString:[userDefaults objectForKey:@"isScrollViewAppear"]]) {
        [self showScrollView];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if ([@"YES" isEqualToString:[userDefaults objectForKey:@"isScrollViewAppear"]]) {
        MainViewController *mainVC = [[MainViewController alloc] init];
        [self presentViewController:mainVC animated:NO completion:nil];
    }
    
}
- (void)showScrollView
{
    
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    _scrollView.delegate = self;
    _scrollView.backgroundColor = [UIColor redColor];
    _scrollView.contentSize = CGSizeMake(kDeviceWidth*3, kDeviceHeight);
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.bounces = NO;
    //_scrollView.tag = 101;
    
    _startButton = [[UIButton alloc] initWithFrame:CGRectMake(60, kDeviceHeight-80, 200, 20)];
    [_startButton setTitle:@"开始体验" forState:UIControlStateNormal];
    [_startButton setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0.8 alpha:0.2]];
    [_startButton addTarget:self action:@selector(entryMainScreen) forControlEvents:UIControlEventTouchUpInside];
    
    for (int i = 0 ; i < 3; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(kDeviceWidth*i, 0, kDeviceWidth, kDeviceHeight)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",i+1]];
        if (i == 2) {
            imageView.userInteractionEnabled = YES;
            [imageView addSubview:_startButton];
        }
        [_scrollView addSubview:imageView];
    }
    
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(140, kDeviceHeight-40, 40, 20)];
    _pageControl.numberOfPages = 3;
    //_pageControl.tag = 201;
    
    [self.view addSubview:_scrollView];
    [self.view addSubview:_pageControl];
}

- (void)entryMainScreen
{
    [_scrollView removeFromSuperview];
    [_pageControl removeFromSuperview];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:@"YES" forKey:@"isScrollViewAppear"];
    
    MainViewController *mainVC = [[MainViewController alloc] init];
    [self presentViewController:mainVC animated:NO completion:nil];
    
}


-(void)scrollViewDisappear{
//    
//    //拿到 view 中的 UIScrollView 和 UIPageControl
//    UIScrollView *scrollView = (UIScrollView *)[self.view viewWithTag:101];
//    UIPageControl *page = (UIPageControl *)[self.view viewWithTag:201];
//    
//    //设置滑动图消失的动画效果图
//    [UIView animateWithDuration:3.0f animations:^{
//        
//        scrollView.center = CGPointMake(self.view.frame.size.width/2, 1.5 * self.view.frame.size.height);
//        
//    } completion:^(BOOL finished) {
//        
//        [scrollView removeFromSuperview];
//        [page removeFromSuperview];
//    }];
//    
//    //将滑动图启动过的信息保存到 NSUserDefaults 中，使得第二次不运行滑动图
//    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//    [userDefaults setObject:@"YES" forKey:@"isScrollViewAppear"];
}

#pragma mark - UIScrollView Delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int current = scrollView.contentOffset.x/kDeviceWidth;
    
    //UIPageControl *pageControl = (UIPageControl *)[self.view viewWithTag:201];
    _pageControl.currentPage = current;
    
}

#pragma mark - Memory
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
