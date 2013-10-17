//
//  MainViewController.m
//  Quizzes
//
//  Created by Wouter Willaert on 11/10/13.
//  Copyright (c) 2013 Typework. All rights reserved.
//

#import "QuizViewController.h"

#import "QuizFactory.h"
#import "AnswerViewControllerFactory.h"

#import "Quiz.h"
#import "Question.h"


@interface QuizViewController ()

@property (nonatomic, strong) NSEnumerator *questions;
@property (nonatomic, strong) Question *currentQuestion;
@property (nonatomic, strong) NSNumber *points;

@property (nonatomic, strong) UIViewController *answerViewController;

- (NSString *)progress;
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
        self.points = 0;
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

#pragma mark - View Actions

- (IBAction)next:(id)sender {
    [self nextQuestion];
}

#pragma mark - Helpers

- (void)nextQuestion {
    // new question
    self.currentQuestion = self.questions.nextObject;
    
    // display new question
    if (self.currentQuestion) {
        self.questionLabel.text = self.currentQuestion.text;
        self.progressLabel.text = [self progress];
        self.pointsLabel.text = [NSString stringWithFormat:@"%d ", self.points.intValue];
    }
    
    // destroy answer vc
    [self.answerViewController removeFromParentViewController];
    [self.answerViewController.view removeFromSuperview];
    
    // initialize answer vc
    self.answerViewController = [AnswerViewControllerFactory viewControllerWithQuestion:self.currentQuestion];
    [self addChildViewController:self.answerViewController];
    [self.answerViewController didMoveToParentViewController:self];
    
    // initialize answer view
    self.answerViewController.view.frame = self.answerView.bounds;
    self.answerViewController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.answerView addSubview:self.answerViewController.view];
}

- (NSString *)progress {
    return [NSString stringWithFormat:@"%d of %d",
            [self.quiz.questions indexOfObject:self.currentQuestion] + 1,
            self.quiz.numberOfQuestion];
}

@end
