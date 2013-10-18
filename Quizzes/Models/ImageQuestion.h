//
//  ImageQuestion.h
//  Quizzes
//
//  Created by Wouter Willaert on 15/10/13.
//  Copyright (c) 2013 Typework. All rights reserved.
//

#import "Question.h"

@interface ImageQuestion : Question

@property (nonatomic, assign) NSInteger answer;

- (void)addOption:(NSString *)option;

- (NSInteger)numberOfOptions;

@end
