//
//  AwardManager.m
//  Quizzes
//
//  Created by Wouter Willaert on 16/10/13.
//  Copyright (c) 2013 Typework. All rights reserved.
//

#import "AwardManager.h"

static AwardManager *instance = nil;

@implementation AwardManager

+ (AwardManager *)sharedInstance {
    if (!instance) instance = [[self allocWithZone:NULL] init];
    return instance;
}

@end
