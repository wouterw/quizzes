//
//  MultipleChoiceQuestion.h
//  Quizzes
//
//  Created by Wouter Willaert on 13/10/13.
//  Copyright (c) 2013 Typework. All rights reserved.
//

#import "Question.h"

@interface MultipleChoiceQuestion : Question

@property (nonatomic, strong) NSArray *options;
@property (nonatomic, strong) NSString *answer;

- (void)addOption:(NSString *)option;

- (NSInteger)numberOfOptions;

@end
