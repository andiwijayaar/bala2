//
//  Login.m
//  TeamSuccess
//
//  Created by Mario Damianus on 11/11/16.
//  Copyright © 2016 MC. All rights reserved.
//

#import "Login.h"

@implementation Login
{
    UIView *bgview;
    UILabel *UserIdLabel, *PasswordLabel, *versi, /* *UserIDwarning, */*Passwordwarning, *Or;
    UITextField *UserID,*Password, *CEmail, *ip;
    UIButton *toggle, *regis, *Lang;
}
-(void)viewDidLoad {
    [super viewDidLoad];
    [[self navigationItem] setTitle:@"Login"];
    [self UI];
}

-(void)UI {
    bgview = [self UIView:self withFrame:CGRectMake(0, 70, [self view].frame.size.width, [self view].frame.size.height-60)];
    [bgview setBackgroundColor:[UIColor clearColor]];
    [[bgview layer] setCornerRadius:10];
    
    UserIdLabel = [self UILabel:self withFrame:CGRectMake(20, 150, self.view.frame.size.width-40, 10) withText:@"User ID" withTextSize:12 withAlignment:0 withLines:0];
    [UserIdLabel setHidden:YES];
    [bgview addSubview:UserIdLabel];
    UserID = [self CustomTextField:CGRectMake(20, UserIdLabel.frame.origin.y + 5, self.view.frame.size.width - 40, 40) withStrPlcHolder:@"User ID" withAttrColor:nil keyboardType:UIKeyboardTypeEmailAddress withTextColor:nil withFontSize:16 withTag:0 withDelegate:self];
    [bgview addSubview:UserID];
    
    PasswordLabel = [self UILabel:self withFrame:CGRectMake(20, 200, self.view.frame.size.width-40, 10) withText:@"Password" withTextSize:12 withAlignment:0 withLines:0];
    [PasswordLabel setHidden:YES];
    [bgview addSubview:PasswordLabel];
    Password = [self PasswordTextField:CGRectMake(20, PasswordLabel.frame.origin.y + 5, self.view.frame.size.width-70, 40) withStrPlcHolder:@"Password" withAttrColor:nil keyboardType:UIKeyboardTypeDefault withTextColor:nil withFontSize:16 withTag:1 withDelegate:self];
//    [Password addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [bgview addSubview:Password];
    toggle = [self btnPasswordImage:CGRectMake(Password.frame.origin.x + Password.frame.size.width, PasswordLabel.frame.origin.y + 5, 30, 30) withTag:0];
    [bgview addSubview:toggle];
    UIView *garis = [self UIView:self withFrame:CGRectMake(toggle.frame.origin.x, toggle.frame.origin.y+30, toggle.frame.size.width, 1)];
    [garis setBackgroundColor:[self colorFromHexString:@"#6E6E6E" withAlpha:1.0]];
    [bgview addSubview:garis];
    
    UIButton *login = [self UIButton:self withFrame:CGRectMake(20, 315, self.view.frame.size.width-40, 50) withTitle:@"Login" withTag:0];
    [login setBackgroundColor:[self colorFromHexString:@"#00A4BB" withAlpha:1.0]];
    [[login layer] setCornerRadius:3];
    [bgview addSubview:login];
    
    [[self view] addSubview:bgview];
}

-(void)Act:(id)sender {
    if ([sender tag] == 0) {
//        [self performSegueWithIdentifier:@"Home" sender:self];
        [self GotoPage:self withIdentifier:@"Home"];
    }
}
@end

