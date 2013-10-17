//
//  Question.m
//  Quizzes
//
//  Created by Wouter Willaert on 12/10/13.
//  Copyright (c) 2013 Typework. All rights reserved.
//

#import "Question.h"

@implementation Question

+ (id)questionWithText:(NSString *)aText {
    return [[[self class] alloc] initWithText:aText];
}

- (id)initWithText:(NSString *)aText {
    self = [super init];
    
    if (self) {
        self.text = aText;
    }
    
    return self;
}

- (BOOL)correct:(id)answer {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}

- (BOOL)isEqual:(id)object {
    Question *other = object;
    return [self.text isEqualToString:other.text];
}

- (NSString *)description {
    return self.text;
}

@end
