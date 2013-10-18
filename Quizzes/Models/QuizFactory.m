//
//  QuizFactory.m
//  Quizzes
//
//  Created by Wouter Willaert on 13/10/13.
//  Copyright (c) 2013 Typework. All rights reserved.
//

#import "QuizFactory.h"

#import "Quiz.h"
#import "Question.h"
#import "MultipleChoiceQuestion.h"
#import "TrueFalseQuestion.h"
#import "ImageQuestion.h"

@class Quiz;

@implementation QuizFactory

+ (Quiz *)create {
    MultipleChoiceQuestion *q1 = [MultipleChoiceQuestion questionWithText:@"What is Apple's newest operating system?"];
    [q1 addOption:@"Snow Leopard"];
    [q1 addOption:@"Mountian Lion"];
    [q1 addOption:@"Mavericks"];
    q1.answer = @"Mavericks";
    
    TrueFalseQuestion *q2 = [TrueFalseQuestion questionWithText:@"Typework is awesome"];
    q2.answer = YES;
    
    ImageQuestion *q3 = [ImageQuestion questionWithText:@"What is Ember.js' logo?"];
    [q3 addOption:@"ember"];
    [q3 addOption:@"angular"];
    [q3 addOption:@"backbone"];
    q3.answer = 0;
    
    Quiz *aQuiz = [Quiz quizWithTitle:@"Typework Quiz" andDescription:@"A sample quiz"];
    
    [aQuiz addQuestion:q1];
    [aQuiz addQuestion:q2];
    [aQuiz addQuestion:q3];
    
    return aQuiz;
}

@end
