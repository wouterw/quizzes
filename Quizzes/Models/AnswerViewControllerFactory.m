//
//  AnswerViewFactory.m
//  Quizzes
//
//  Created by Wouter Willaert on 16/10/13.
//  Copyright (c) 2013 Typework. All rights reserved.
//

#import "AnswerViewControllerFactory.h"

#import "AnswerViewController.h"
#import "AnswerTableViewController.h"
#import "AnswerCollectionViewController.h"
#import "AnswerButtonViewController.h"

#import "ImageQuestion.h"
#import "MultipleChoiceQuestion.h"
#import "TrueFalseQuestion.h"

@implementation AnswerViewControllerFactory

+ (UIViewController *)viewControllerWithQuestion:(Question *)aQuestion {
    AnswerViewController *vc;
    
    if ([aQuestion isMemberOfClass:[MultipleChoiceQuestion class]]) {
        
        AnswerTableViewController *tmp = [[AnswerTableViewController alloc] init];
        tmp.options = aQuestion.options;
        
        vc = tmp;
        
    } else if ([aQuestion isMemberOfClass:[ImageQuestion class]]) {
        
        AnswerCollectionViewController *tmp = [[AnswerCollectionViewController alloc] init];
        tmp.options = aQuestion.options;
        
        vc = tmp;
        
    } else if ([aQuestion isMemberOfClass:[TrueFalseQuestion class]]) {
        
        vc = [[AnswerButtonViewController alloc] init];
    }
    
    return vc;
}

@end
