//
//  EditAccount.m
//  TeamSuccess
//
//  Created by Mario Damianus on 11/13/16.
//  Copyright © 2016 MC. All rights reserved.
//

#import "EditAccount.h"

@interface EditAccount ()

@end

@implementation EditAccount
{
    UIScrollView *bgview;
    UITextField *Name, *Jabatan, *Username, *Password, *ConfPassword, *Role, *Email, *NoHP;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [[self navigationItem] setTitle:@"Edit Data"];
    [[self view] addGestureRecognizer:tapRecognizer];
    [self UI];
}

-(void)UI {
    bgview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 70, self.view.frame.size.width, self.view.frame.size.height-70)];
    [bgview setBackgroundColor:[self colorFromHexString:@"#FAFAFA" withAlpha:1.0]];
    
    UILabel *Section1 = [self UILabel:self withFrame:CGRectMake(20, 0, bgview.frame.size.width-40, 40) withText:@"DATA PENGGUNA" withTextSize:18 withAlignment:0 withLines:0];
    [Section1 setTextColor:[UIColor blueColor]];
    [bgview addSubview:Section1];
    
    UIView *line = [self UIView:self withFrame:CGRectMake(20, Section1.frame.origin.y+Section1.frame.size.height+10, bgview.frame.size.width-40, 1)];
    [line setBackgroundColor:[UIColor blueColor]];
    [bgview addSubview:line];
    
    Name = [self UITextField:self withFrame:CGRectMake(20, line.frame.origin.y+10, bgview.frame.size.width-40, 40) withText:@"Nama Lengkap" withSize:16 withInputType:UIKeyboardTypeDefault withSecure:0];
    [bgview addSubview:Name];
    
    Jabatan = [self UITextField:self withFrame:CGRectMake(20, Name.frame.origin.y+Name.frame.size.height+10, bgview.frame.size.width-40, 40) withText:@"Jabatan" withSize:16 withInputType:UIKeyboardTypeDefault withSecure:0];
    [bgview addSubview:Jabatan];
    
    Username = [self UITextField:self withFrame:CGRectMake(20, Jabatan.frame.origin.y+Jabatan.frame.size.height+10, bgview.frame.size.width-40, 40) withText:@"Username" withSize:16 withInputType:UIKeyboardTypeDefault withSecure:0];
    [bgview addSubview:Username];
    
    Password = [self UITextField:self withFrame:CGRectMake(20, Username.frame.origin.y+Username.frame.size.height+10, bgview.frame.size.width-40, 40) withText:@"Password" withSize:16 withInputType:UIKeyboardTypeDefault withSecure:0];
    [bgview addSubview:Password];
    
    ConfPassword = [self UITextField:self withFrame:CGRectMake(20, Password.frame.origin.y+Password.frame.size.height+10, bgview.frame.size.width-40, 40) withText:@"RT" withSize:16 withInputType:UIKeyboardTypeDefault withSecure:0];
    [bgview addSubview:ConfPassword];
    
    Role = [self UITextField:self withFrame:CGRectMake(20, ConfPassword.frame.origin.y+ConfPassword.frame.size.height+10, bgview.frame.size.width-40, 40) withText:@"RW" withSize:16 withInputType:UIKeyboardTypeDefault withSecure:0];
    [bgview addSubview:Role];
    
    UILabel *Section2 = [self UILabel:self withFrame:CGRectMake(20, Role.frame.origin.y+Role.frame.size.height+10, bgview.frame.size.width-40, 40) withText:@"KONTAK PENGGUNA" withTextSize:18 withAlignment:0 withLines:0];
    [Section2 setTextColor:[UIColor blueColor]];
    [bgview addSubview:Section2];
    
    UIView *line1 = [self UIView:self withFrame:CGRectMake(20, Section2.frame.origin.y+Section2.frame.size.height+10, bgview.frame.size.width-40, 1)];
    [line1 setBackgroundColor:[UIColor blueColor]];
    [bgview addSubview:line1];
    
    Email = [self UITextField:self withFrame:CGRectMake(20, line1.frame.origin.y+line1.frame.size.height+10, bgview.frame.size.width-40, 40) withText:@"No HP" withSize:16 withInputType:UIKeyboardTypeEmailAddress withSecure:0];
    [bgview addSubview:Email];
    
    NoHP = [self UITextField:self withFrame:CGRectMake(20, Email.frame.origin.y+Email.frame.size.height+10, bgview.frame.size.width-40, 40) withText:@"Email" withSize:16 withInputType:UIKeyboardTypeNumberPad withSecure:0];
    [bgview addSubview:NoHP];
    
    UIView *line2 = [self UIView:self withFrame:CGRectMake(20, NoHP.frame.origin.y+NoHP.frame.size.height+10, bgview.frame.size.width-40, 1)];
    [line2 setBackgroundColor:[UIColor grayColor]];
    [bgview addSubview:line2];
    
    UIButton *cancel = [self UIButton:self withFrame:CGRectMake(20, line2.frame.origin.y+line2.frame.size.height+10, bgview.frame.size.width-40, 50) withTitle:@"TUTUP" withTag:0];
    [bgview addSubview:cancel];
    
    UIButton *kirim = [self UIButton:self withFrame:CGRectMake(20, cancel.frame.origin.y+cancel.frame.size.height+10, bgview.frame.size.width-40, 50) withTitle:@"SIMPAN" withTag:0];
    [bgview addSubview:kirim];
    
    bgview.contentSize = CGSizeMake(self.view.frame.size.width, kirim.frame.origin.y+kirim.frame.size.height+10);
    
    [[self view] addSubview:bgview];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
