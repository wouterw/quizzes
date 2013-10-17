//
//  AnswerViewFactory.h
//  Quizzes
//
//  Created by Wouter Willaert on 16/10/13.
//  Copyright (c) 2013 Typework. All rights reserved.
//

@class Question;

@interface AnswerViewControllerFactory : NSObject

+ (UIViewController *)viewControllerWithQuestion:(Question *)aQuestion;

@end
