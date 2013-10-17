//
//  QuizFactory.h
//  Quizzes
//
//  Created by Wouter Willaert on 13/10/13.
//  Copyright (c) 2013 Typework. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Quiz;

@interface QuizFactory : NSObject

+ (Quiz *)create;

@end
