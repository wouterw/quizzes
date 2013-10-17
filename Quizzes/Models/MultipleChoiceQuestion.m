//
//  MultipleChoiceQuestion.m
//  Quizzes
//
//  Created by Wouter Willaert on 13/10/13.
//  Copyright (c) 2013 Typework. All rights reserved.
//

#import "MultipleChoiceQuestion.h"

@implementation MultipleChoiceQuestion

- (void)addOption:(NSString *)option {
    NSMutableArray *options = [NSMutableArray arrayWithArray:self.options];
    [options addObject:option];
    
    self.options = [NSArray arrayWithArray:options];
}

- (NSInteger)numberOfOptions {
    return self.options.count;
}

- (BOOL)correct:(id)answer {
    UIButton *btn = answer;
    NSString *givenAnswer = self.options[btn.tag];
    return givenAnswer == answer;
}

@end
