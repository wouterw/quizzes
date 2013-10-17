//
//  ImageQuestion.m
//  Quizzes
//
//  Created by Wouter Willaert on 15/10/13.
//  Copyright (c) 2013 Typework. All rights reserved.
//

#import "ImageQuestion.h"

@implementation ImageQuestion

- (void)addOption:(NSString *)option {
    NSMutableArray *options = [NSMutableArray arrayWithArray:self.options];
    
    UIImage *img = [UIImage imageNamed:option];
    [options addObject:img];
    
    self.options = [NSArray arrayWithArray:options];
}

- (BOOL)isCorrect:(id)answer {
    UIButton *btn = answer;
    NSString *givenAnswer = self.options[btn.tag];
    return givenAnswer == answer;
}

@end
