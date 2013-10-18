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

- (NSInteger)numberOfOptions {
    return self.options.count;
}

- (BOOL)isCorrect:(NSInteger)optionIndex {
    return self.answer == optionIndex;
}

@end
