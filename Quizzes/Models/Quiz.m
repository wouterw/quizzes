//
//  Quiz.m
//  Quizzes
//
//  Created by Wouter Willaert on 12/10/13.
//  Copyright (c) 2013 Typework. All rights reserved.
//

#import "Quiz.h"
#import "Question.h"

@interface Quiz ()

- (id)initWithTitle:(NSString *)aTitle
     andDescription:(NSString *)aDescription;

@end

@implementation Quiz

+ (id)quizWithTitle:(NSString *)aTitle
         andDescription:(NSString *)aDescription {
    return [[[self class] alloc] initWithTitle:aTitle
                        andDescription:aDescription];
}

- (id)initWithTitle:(NSString *)aTitle
     andDescription:(NSString *)aDescription {
    self = [super init];
    
    if (self) {
        self.title = aTitle;
        self.description = aDescription;
        self.questions = [[NSArray alloc] init];
    }
    
    return self;
}

- (void)addQuestion:(Question *)aQuestion {
    NSMutableArray *questions = [NSMutableArray arrayWithArray:self.questions];
    [questions addObject:aQuestion];
    
    self.questions = [NSArray arrayWithArray:questions];
}

- (void)removeQuestion:(Question *)aQuestion {
    NSMutableArray *questions = [NSMutableArray arrayWithArray:self.questions];

    Question *found;
    for (Question *q in questions) {
        if ([q isEqual:aQuestion]) {
            found = q;
        }
    }
    
    [questions removeObject:found];

    self.questions = [NSArray arrayWithArray:questions];
}

- (NSInteger)numberOfQuestion {
    return self.questions.count;
}

- (NSString *)description {
    return self.title;
}

@end
