//
//  LanguageViewController.m
//  Quizzes
//
//  Created by Wouter Willaert on 16/10/13.
//  Copyright (c) 2013 Typework. All rights reserved.
//

#import "LanguageViewController.h"
#import "QuizViewController.h"


@interface LanguageViewController ()

@property (nonatomic, strong) NSArray *languages;
@property (nonatomic, strong) NSUserDefaults *defaults;

- (NSString *)selectedLanguage;

@end


@implementation LanguageViewController

#pragma mark - Initialization

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    
    if (self) {
        self.title = @"Select your language";
    }
    
    return self;
}

#pragma mark - Properties

- (NSUserDefaults *)defaults {
    if (!_defaults) {
        _defaults = [NSUserDefaults standardUserDefaults];
    }
    
    return _defaults;
}

- (NSArray *)languages {
    if (!_languages) {
        _languages = @[@"Dutch", @"English", @"French"];
    }
    
    return _languages;
}

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleLabel.text = @"I speak";
    self.continueButton.titleLabel.text = @"Continue";
    
    NSString *lng = [self.defaults objectForKey:@"Language"];
    int idx = [self.languages indexOfObject:lng];
    [self.languagePickerView selectRow:idx inComponent:0 animated:YES];
}

#pragma mark - UIPickerView DataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component {
    return self.languages.count;
}

#pragma mark - UIPickerView Delegate

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component {
    return [self.languages objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component {
    NSLog(@"Selected %@ as prefered language", self.selectedLanguage);
}

#pragma mark - View Actions

- (IBAction)continueButtonTouched:(id)sender {
    if (self.selectedLanguage) {
        [self.defaults setObject:self.selectedLanguage forKey:@"Language"];
    }
    
    NSLog(@"Saved %@ as default language",
          [self.defaults objectForKey:@"Language"]);
    
    QuizViewController *quizViewController = [[QuizViewController alloc] init];
    [self.navigationController pushViewController:quizViewController animated:YES];
}

#pragma mark - Helpers

- (NSString *)selectedLanguage {
    int idx = [self.languagePickerView selectedRowInComponent:0];
    return [self.languages objectAtIndex:idx];
}

@end
