//
//  AwardManager.m
//  Quizzes
//
//  Created by Wouter Willaert on 16/10/13.
//  Copyright (c) 2013 Typework. All rights reserved.
//

#import "AwardManager.h"

static AwardManager *Instance = nil;

@implementation AwardManager

+ (AwardManager *)sharedInstance {
    if (!Instance) {
        Instance = [[self allocWithZone:NULL] init];
        Instance.points = 0;
    }
    
    return Instance;
}

- (NSInteger)addPoints:(NSInteger)points {
    if (points > 0) {
        self.points += points;
    }
    
    return points;
}

@end
