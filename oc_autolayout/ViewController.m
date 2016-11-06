//
//  ViewController.m
//  oc_autolayout
//
//  Created by deqiutseng on 5/11/16.
//  Copyright (c) 2016年 deqiutseng. All rights reserved.
//

#import "ViewController.h"
#import "PageOneViewController.h"
#import "PageTwoViewController.h"
#import "PageThirdViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollPageView.pagingEnabled=YES;
    self.scrollPageView.delegate=self;
    
    self.automaticallyAdjustsScrollViewInsets=NO;//一定要加上,否则对AutoLayout-scrollView会有影响
    
//    self.scrollPageView.contentSize=CGSizeMake(<#CGFloat width#>, <#CGFloat height#>)
    
    //frist page
    PageOneViewController* pageOneCtl=[[PageOneViewController alloc] init];
    [self.scrollPageView addSubview:pageOneCtl];
    pageOneCtl.translatesAutoresizingMaskIntoConstraints=NO;//必须加上否则会报错,除非设置xib不启用Autoresizing
    
    NSLayoutConstraint* pageOneCtlTop=[NSLayoutConstraint constraintWithItem:pageOneCtl attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.scrollPageView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    
    [pageOneCtl.superview addConstraint:pageOneCtlTop];
    
    NSLayoutConstraint* pageOneCtlLeft=[NSLayoutConstraint constraintWithItem:pageOneCtl attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.scrollPageView  attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    [pageOneCtl.superview addConstraint:pageOneCtlLeft];
    
    NSLayoutConstraint* pageOneCtlBottom=[NSLayoutConstraint constraintWithItem:pageOneCtl attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.scrollPageView  attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    [pageOneCtl.superview addConstraint:pageOneCtlBottom];
    
    float oneViewController=CGRectGetWidth([UIScreen mainScreen].bounds);
    
    NSLayoutConstraint* pageOneCtlWidth=[NSLayoutConstraint constraintWithItem:pageOneCtl attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1.0 constant:oneViewController];
    [pageOneCtl addConstraint:pageOneCtlWidth];
    
    //想通过约束来实现scrollView内部宽度
    
    /*
    float  scrollPageHeight=self.scrollPageView.frame.size.height;
    NSLayoutConstraint* pageOneCtlHeight=[NSLayoutConstraint constraintWithItem:pageOneCtl attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:0.0 constant:scrollPageHeight];
    [pageOneCtl addConstraint:pageOneCtlHeight];
    */
    
    //second page
    PageTwoViewController* pageTwoCtl=[[PageTwoViewController alloc] init];
    [self.scrollPageView addSubview:pageTwoCtl];
    pageTwoCtl.translatesAutoresizingMaskIntoConstraints=NO;
    
    NSLayoutConstraint* pageTwoCtlTop=[NSLayoutConstraint constraintWithItem:pageTwoCtl attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.scrollPageView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    
    [pageTwoCtl.superview addConstraint:pageTwoCtlTop];
    
    NSLayoutConstraint* pageTwoCtlLeft=[NSLayoutConstraint constraintWithItem:pageTwoCtl attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:pageOneCtl  attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
    [pageTwoCtl.superview addConstraint:pageTwoCtlLeft];
    
    NSLayoutConstraint* pageTwoCtlBottom=[NSLayoutConstraint constraintWithItem:pageTwoCtl attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.scrollPageView  attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    [pageTwoCtl.superview addConstraint:pageTwoCtlBottom];
    
    
    NSLayoutConstraint* pageTwoCtlWidth=[NSLayoutConstraint constraintWithItem:pageTwoCtl attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1.0 constant:oneViewController];
    [pageTwoCtl addConstraint:pageTwoCtlWidth];
    
    //third page
    PageThirdViewController* pageThirdCtl=[[PageThirdViewController alloc] init];
    [self.scrollPageView addSubview:pageThirdCtl];
    pageThirdCtl.translatesAutoresizingMaskIntoConstraints=NO;
    
    NSLayoutConstraint* pageThirdCtlTop=[NSLayoutConstraint constraintWithItem:pageThirdCtl attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.scrollPageView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    [pageThirdCtl.superview addConstraint:pageThirdCtlTop];
    
    NSLayoutConstraint* pageThirdCtlLeft=[NSLayoutConstraint constraintWithItem:pageThirdCtl attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:pageTwoCtl  attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
    [pageThirdCtl.superview addConstraint:pageThirdCtlLeft];
    
    NSLayoutConstraint* pageThirdCtlBottom=[NSLayoutConstraint constraintWithItem:pageThirdCtl attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.scrollPageView  attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    [pageThirdCtl.superview addConstraint:pageThirdCtlBottom];
    
    
    NSLayoutConstraint* pageThirdCtlWidth=[NSLayoutConstraint constraintWithItem:pageThirdCtl attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1.0 constant:oneViewController];
    [pageThirdCtl addConstraint:pageThirdCtlWidth];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)updateViewConstraints{
    [super updateViewConstraints];
    self.contentViewWidthConstraint.constant=CGRectGetWidth([UIScreen mainScreen].bounds)*2;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    int page=scrollView.contentOffset.x / CGRectGetWidth([UIScreen mainScreen].bounds);
    NSLog(@"%d",page);
}
- (IBAction)nextControllerBtnAction:(UIButton *)sender {
    
    SecondViewController* second=[[SecondViewController alloc] init];
    
    [self.navigationController pushViewController:second animated:YES];
}



@end
