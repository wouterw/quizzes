//
//  AnswerViewController.h
//  Quizzes
//
//  Created by Wouter Willaert on 16/10/13.
//  Copyright (c) 2013 Typework. All rights reserved.
//

@class AnswerViewController;

@protocol AnswerViewControllerDelegate <NSObject>

- (void)answerViewController:(AnswerViewController *)answerViewController
      didSelectAnswerAtIndex:(NSInteger)index;

@end

@interface AnswerViewController : UIViewController

@property (nonatomic, strong) id <AnswerViewControllerDelegate> delegate;
@property (nonatomic, strong) NSArray *options;

@end
