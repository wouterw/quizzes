//
//  AppDelegate.m
//  Quizzes
//
//  Created by Wouter Willaert on 11/10/13.
//  Copyright (c) 2013 Typework. All rights reserved.
//

#import "AppDelegate.h"

#import "LanguageViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    // [self applyStyleSheet];
    [self applyDefaults];
    
    LanguageViewController *languageViewController =
        [[LanguageViewController alloc] init];
    
    UINavigationController *navigationViewController =
        [[UINavigationController alloc] initWithRootViewController:languageViewController];
    
    navigationViewController.navigationBarHidden = YES;
    
    self.window.rootViewController = navigationViewController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applyStyleSheet {
    UIColor *tintColor = [UIColor colorWithRed:0.0f green:0.0f blue:1.0f alpha:1.0f];
    [[UINavigationBar appearance] setBarTintColor:tintColor];
    
    UIColor *navigationTextColor = [UIColor whiteColor];
    [[UINavigationBar appearance] setTitleTextAttributes:@{
        NSForegroundColorAttributeName: navigationTextColor
    }];
}

- (void)applyDefaults {
    NSDictionary *defaults = [NSDictionary dictionaryWithObject:@"English"
                                                         forKey:@"Language"];
    
    [[NSUserDefaults standardUserDefaults] registerDefaults:defaults];
}

@end
