//
//  MainViewController.h
//  Quizzes
//
//  Created by Wouter Willaert on 11/10/13.
//  Copyright (c) 2013 Typework. All rights reserved.
//

#import "AnswerViewController.h"

@class Quiz;
@class Question;

@interface QuizViewController : UIViewController <AnswerViewControllerDelegate>

@property (nonatomic, strong) Quiz *quiz;

@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *pointsLabel;
@property (nonatomic, weak) IBOutlet UILabel *progressLabel;
@property (nonatomic, weak) IBOutlet UIView *answerView;
@property (nonatomic, weak) IBOutlet UIButton *nextButton;

- (IBAction)next:(id)sender;

@end
