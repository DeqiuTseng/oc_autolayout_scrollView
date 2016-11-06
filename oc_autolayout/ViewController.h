//
//  ViewController.h
//  oc_autolayout
//
//  Created by deqiutseng on 5/11/16.
//  Copyright (c) 2016年 deqiutseng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentViewWidthConstraint;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollPageView;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

