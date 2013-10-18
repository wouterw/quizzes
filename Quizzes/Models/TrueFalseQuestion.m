//
//  TrueFalseQuestion.m
//  Quizzes
//
//  Created by Wouter Willaert on 13/10/13.
//  Copyright (c) 2013 Typework. All rights reserved.
//

#import "TrueFalseQuestion.h"

@implementation TrueFalseQuestion

- (BOOL)isCorrect:(NSInteger)optionIndex {
    BOOL givenAnswer = (BOOL)optionIndex;
    return self.answer == givenAnswer;
}

@end
