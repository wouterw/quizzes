//
//  LanguageViewController.h
//  Quizzes
//
//  Created by Wouter Willaert on 16/10/13.
//  Copyright (c) 2013 Typework. All rights reserved.
//

@interface LanguageViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UIPickerView *languagePickerView;
@property (nonatomic, weak) IBOutlet UIButton *continueButton;

- (NSString *)selectedLanguage;

- (IBAction)continueButtonTouched:(id)sender;

@end
