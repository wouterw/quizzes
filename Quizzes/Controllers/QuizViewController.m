//
//  MainViewController.m
//  Quizzes
//
//  Created by Wouter Willaert on 11/10/13.
//  Copyright (c) 2013 Typework. All rights reserved.
//

#import "QuizViewController.h"

#import "QuizFactory.h"
#import "AnswerViewController.h"
#import "AnswerViewControllerFactory.h"

#import "Quiz.h"
#import "Question.h"
#import "AwardManager.h"

static NSInteger PointsToIncrement = 5;

@interface QuizViewController ()

@property (nonatomic, strong) NSEnumerator *questions;
@property (nonatomic, strong) Question *currentQuestion;
@property (nonatomic, strong, readonly) AwardManager *awarder;

@property (nonatomic, strong) AnswerViewController *answerViewController;

- (void)nextQuestion;

@end


@implementation QuizViewController

#pragma mark - Initialization

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.quiz = [QuizFactory create];
        self.title = self.quiz.title;
        self.questions = [self.quiz.questions objectEnumerator];
        _awarder = [AwardManager sharedInstance];
    }
    
    return self;
}

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self nextQuestion];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.view.frame = CGRectMake(
        0,
        self.topLayoutGuide.length,
        CGRectGetWidth(self.view.frame),
        CGRectGetHeight(self.view.frame) - self.topLayoutGuide.length
    );
}

#pragma mark - AnswerViewController Delegate

- (void)answerViewController:(AnswerViewController *)answerViewController
      didSelectAnswerAtIndex:(NSInteger)index {
    
    if ([self.currentQuestion isCorrect:index]) {
        [self.awarder addPoints:PointsToIncrement];
        [self displayPoints];
        
        NSLog(@"Correct Answer!");
    } else {
        NSLog(@"Incorrect Answer!");
    }
    
    self.nextButton.enabled = YES;
    
    NSLog(@"QuizViewController recieved didSelectAnswerAtIndex: %d", index);
}

#pragma mark - View Actions

- (IBAction)next:(id)sender {
    if ([self isLastQuestion]) {
        [self.navigationController popToRootViewControllerAnimated:YES];
        return;
    }
    
    [self nextQuestion];
}

#pragma mark - Helpers

- (BOOL)isLastQuestion {
    return [self.quiz.questions indexOfObject:self.currentQuestion] == self.quiz.numberOfQuestion - 1;
}

- (void)nextQuestion {
    // new question
    self.currentQuestion = self.questions.nextObject;
    
    // display next button
    if ([self isLastQuestion]) [self.nextButton setTitle:@"Finish" forState:UIControlStateNormal];
    self.nextButton.enabled = NO;
    
    // display new question
    if (self.currentQuestion) {
        self.questionLabel.text = self.currentQuestion.text;
        [self displayProgress];
        [self displayPoints];
    }
    
    // destroy answer vc
    [self.answerViewController removeFromParentViewController];
    [self.answerViewController.view removeFromSuperview];
    
    // initialize answer vc
    self.answerViewController = [AnswerViewControllerFactory viewControllerWithQuestion:self.currentQuestion];
    self.answerViewController.delegate = self;
    [self addChildViewController:self.answerViewController];
    [self.answerViewController didMoveToParentViewController:self];
    
    // initialize answer view
    self.answerViewController.view.frame = self.answerView.bounds;
    self.answerViewController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.answerView addSubview:self.answerViewController.view];
}

- (void)displayPoints {
    self.pointsLabel.text = [NSString stringWithFormat:@"%d ", self.awarder.points];
}

- (void)displayProgress {
    self.progressLabel.text = [NSString stringWithFormat:@"%d of %d",
            [self.quiz.questions indexOfObject:self.currentQuestion] + 1,
            self.quiz.numberOfQuestion];
}

@end
