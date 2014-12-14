//
//  ViewController.m
//  AltimetrikTask
//
//  Created by ANKUR on 13/12/14.
//  Copyright (c) 2014 ANKUR SHIVANI. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Validation.h"
#import "DetailListTableViewController.h"


#define TEXTFIELD_LIMIT 6

@interface ViewController () <UITextFieldDelegate> {
    IBOutlet UITextField *txtUsername;
    IBOutlet UITextField *txtPassword;
    IBOutlet UIButton *btnLogin;
}

-(IBAction)LoginPressed:(id)sender;
-(IBAction)CharacterDidChanged:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"Login";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextField delegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if(![string isValid]){
        [self showAlertWithError:@"Invalid Character" body:string];
        return NO;
    }
    NSUInteger currentLength = [textField.text length] + [string length] - range.length;
    return (currentLength > TEXTFIELD_LIMIT) ? NO : YES;
}

#pragma maek - IBActions
-(IBAction)LoginPressed:(id)sender {
    
}
-(IBAction)CharacterDidChanged:(id)sender {
    if(txtUsername.text.length == TEXTFIELD_LIMIT && txtPassword.text.length == TEXTFIELD_LIMIT) {
        btnLogin.enabled = TRUE;
    }
    else {
        btnLogin.enabled = FALSE;
    }
}

#pragma mark - Utitlity
-(void)showAlertWithError:(NSString *)error body:(NSString *)message {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:error message:message delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"detailSegue"]){
        UINavigationController *navController = (UINavigationController *)segue.destinationViewController;
        DetailListTableViewController *controller = (DetailListTableViewController *)navController.topViewController;
        controller.strUsername = txtUsername.text;
    }
}
@end
