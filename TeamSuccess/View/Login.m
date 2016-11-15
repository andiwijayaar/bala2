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
    NSMutableDictionary *res;
}
-(void)viewDidLoad {
    [super viewDidLoad];
//    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"foo",@"title", @"bar",@"body", @"1",@"userId", nil];
//    
//    NSDictionary *res = [self PostJson:dict withURL:@"http://jsonplaceholder.typicode.com/posts"];
//    NSLog(@"result %@", res);
    
//    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"1",@"postId", nil];
//    
//    NSDictionary *res = [self GetJson:dict withURL:@"https://jsonplaceholder.typicode.com/comments"];
//    NSLog(@"result %@", res);
    
    [[[self navigationController] navigationBar] setTintColor:[self colorFromHexString:@"#E43F3F" withAlpha:1.0]];
    UILabel* lbNavTitle = [[UILabel alloc] initWithFrame:CGRectMake(0,40,320,80)];
    lbNavTitle.textAlignment = UITextAlignmentLeft;
    lbNavTitle.text = NSLocalizedString(@"Roemah Djoeang",@"");
    [lbNavTitle setTextColor:[UIColor whiteColor]];
    [[self navigationItem] setTitleView:lbNavTitle];
    [self UI];
}

-(void)viewWillAppear:(BOOL)animated {
    [[self view] addGestureRecognizer:tapRecognizer];
    [defaults setObject:@"N" forKey:@"StatusLogin"];
}

-(void)UI {
    bgview = [self UIView:self withFrame:CGRectMake(0, 70, [self view].frame.size.width, [self view].frame.size.height-60)];
    [bgview setBackgroundColor:[self colorFromHexString:@"#FAFAFA" withAlpha:1.0]];
    
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(40, 60, bgview.frame.size.width - 80, 150)];
    [img setImage:[UIImage imageNamed:@"icon.png"]];
    [bgview addSubview:img];
    
    UserID = [self CustomTextField:CGRectMake(40, img.frame.size.height + img.frame.origin.y + 60, self.view.frame.size.width - 80, 40) withStrPlcHolder:@"Email" withAttrColor:nil keyboardType:UIKeyboardTypeEmailAddress withTextColor:nil withFontSize:16 withTag:0 withDelegate:self withLabel:TRUE];
    [bgview addSubview:UserID];
    
    Password = [self CustomTextField:CGRectMake(40, UserID.frame.size.height + UserID.frame.origin.y + 30, self.view.frame.size.width - 80, 40) withStrPlcHolder:@"Password" withAttrColor:nil keyboardType:UIKeyboardTypeDefault withTextColor:nil withFontSize:16 withTag:1 withDelegate:self withLabel:TRUE];
    [Password setSecureTextEntry:TRUE];
    [bgview addSubview:Password];
    
    UIButton *login = [self UIButton:self withFrame:CGRectMake(40, Password.frame.size.height + Password.frame.origin.y + 20, self.view.frame.size.width-80, 50) withTitle:@"MASUK" withTag:1];
    [login setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [[login layer] setCornerRadius:3];
    [[login layer] setBorderColor:[self colorFromHexString:@"#CCCCCC" withAlpha:1.0].CGColor];
    [login setBackgroundColor:[self colorFromHexString:@"#CCCCCC" withAlpha:1.0]];
    [bgview addSubview:login];
    
    regis = [self UIButton:self withFrame:CGRectMake(40, login.frame.size.height + login.frame.origin.y + 20, [self view].frame.size.width-80, 50) withTitle:@"Belum punya akun ? Silahkan buat" withTag:2];
    [regis setTitleColor:[self colorFromHexString:@"#777777" withAlpha:1.0] forState:UIControlStateNormal];
    [regis setBackgroundColor:[UIColor clearColor]];
    [[regis layer] setBorderWidth:0];
    [bgview addSubview:regis];
    
    [[self view] addSubview:bgview];
}

-(void)Act:(id)sender {
    if ([sender tag] == 0) {
        
    } else if ([sender tag] == 1) {
        if([[UserID text] length] == 0){
            [self required:UserID withMsg:nil];
        }else{
            if(!([self IsValidEmail:[UserID text]])){
                [self required:UserID withMsg:@"Email salah"];
            }else{
                [self removeValidationIcon:UserID withColor:nil];
            }
            
        }
        
        if([[Password text] length] == 0){
            [self required:Password withMsg:nil];
        }else{
            [self removeValidationIcon:Password withColor:nil];
        }
        
        if([[UserID text] length] > 0 && [[Password text] length] > 0 && ([self IsValidEmail:[UserID text]])){
            [defaults setObject:@"Y" forKey:@"StatusLogin"];
            [self GotoPage:self withIdentifier:@"Root"];
        }
    } else if ([sender tag] == 2) {
        [self performSegueWithIdentifier:@"Register" sender:self];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    
    
    return true;
}

@end

