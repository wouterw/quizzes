//
//  Question.h
//  Quizzes
//
//  Created by Wouter Willaert on 12/10/13.
//  Copyright (c) 2013 Typework. All rights reserved.
//

@interface Question : NSObject

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *explanation;
@property (nonatomic, strong) NSArray *options;

+ (id)questionWithText:(NSString *)aText;

- (id)initWithText:(NSString *)aText;

- (BOOL)isCorrect:(id)answer;

@end
