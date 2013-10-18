//
//  TrueFalseAnswerViewController.m
//  Quizzes
//
//  Created by Wouter Willaert on 15/10/13.
//  Copyright (c) 2013 Typework. All rights reserved.
//

#import "AnswerButtonViewController.h"

@implementation AnswerButtonViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIButton *trueButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    trueButton.frame = CGRectMake(0, 0, 100, 44);
    trueButton.tag = 1;
    [trueButton setTitle:@"True" forState:UIControlStateNormal];
    
    [trueButton addTarget:self
                    action:@selector(answer:)
          forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:trueButton];
    
    UIButton *falseButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    falseButton.frame = CGRectMake(120, 0, 100, 44);
    falseButton.tag = 0;
    [falseButton setTitle:@"False" forState:UIControlStateNormal];
    
    [falseButton addTarget:self
                    action:@selector(answer:)
          forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:falseButton];
}

#pragma mark - View Actions

- (void)answer:(UIButton *)sender {
    [self.delegate answerViewController:self
                 didSelectAnswerAtIndex:sender.tag];
}

@end
