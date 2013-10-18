//
//  AwardManager.h
//  Quizzes
//
//  Created by Wouter Willaert on 16/10/13.
//  Copyright (c) 2013 Typework. All rights reserved.
//

@interface AwardManager : NSObject

@property (nonatomic, assign) NSInteger points;

+ (AwardManager *)sharedInstance;

- (NSInteger)addPoints:(NSInteger)points;

@end
