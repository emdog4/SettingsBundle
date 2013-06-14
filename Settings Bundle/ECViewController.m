//
//  ECViewController.m
//  Settings Bundle
//
//  Created by Emery Clark on 6/12/13.
//  Copyright (c) 2013 Emery Clark. All rights reserved.
//

#import "ECViewController.h"

@interface ECViewController ()

@end

@implementation ECViewController

- (void)viewDidLoad{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateScreen) name:UIApplicationWillEnterForegroundNotification object:nil];
    
    UITapGestureRecognizer *backgroundTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroundTap)];
    
    [self.view addGestureRecognizer:backgroundTap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [self updateScreen];

}

- (void) updateScreen {
    
    // Get user preferences
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults synchronize];

    
    [self.firstSwitch setOn:[defaults boolForKey:@"my_switch"] animated:YES];
    
    [self.firstSlider setValue:[defaults floatForKey:@"my_slider"] animated:YES];
    
    [self.secondSwitch setOn:[defaults boolForKey:@"my_switch_2"] animated:YES];
    
    [self.textField setText:[defaults stringForKey:@"my_textfield"]];

}

- (void)backgroundTap {
    [self.view endEditing:YES];
}

- (void)setPreferences:(id)sender {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    [defaults setBool:[self.firstSwitch isOn] forKey:@"my_switch"];
    
    [defaults setFloat:[self.firstSlider value] forKey:@"my_slider"];
    
    [defaults setBool:[self.secondSwitch isOn] forKey:@"my_switch_2"];
    
    [defaults setObject:[self.textField text] forKey:@"my_textfield"];
    
    // Sync
    [defaults synchronize];
}

@end
