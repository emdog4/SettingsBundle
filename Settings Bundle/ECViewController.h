//
//  ECViewController.h
//  Settings Bundle
//
//  Created by Emery Clark on 6/12/13.
//  Copyright (c) 2013 Emery Clark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ECViewController : UIViewController

// Properties
@property (weak, nonatomic) IBOutlet UISwitch *firstSwitch;
@property (weak, nonatomic) IBOutlet UISlider *firstSlider;
@property (weak, nonatomic) IBOutlet UISwitch *secondSwitch;
@property (weak, nonatomic) IBOutlet UITextField *textField;

// Actions
- (IBAction)setPreferences:(id)sender;

@end
