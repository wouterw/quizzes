//
//  Quiz.h
//  Quizzes
//
//  Created by Wouter Willaert on 12/10/13.
//  Copyright (c) 2013 Typework. All rights reserved.
//

@class Question;

@interface Quiz : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSArray *questions;

+ (id)quizWithTitle:(NSString *)aTitle
     andDescription:(NSString *)aDescription;

- (void)addQuestion:(Question *)aQuestion;
- (void)removeQuestion:(Question *)aQuestion;

- (NSInteger)numberOfQuestion;

@end
