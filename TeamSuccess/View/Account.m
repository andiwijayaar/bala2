//
//  Account.m
//  TeamSuccess
//
//  Created by Mario Damianus on 11/11/16.
//  Copyright © 2016 MC. All rights reserved.
//

#import "Account.h"

@implementation Account
{
    UIScrollView *bgview;
    UILabel *Name, *Role, *Pos;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self navigationItem] setTitle:@"Account"];
    [self UI];
}

-(void)UI {
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        UIBarButtonItem *newBackButton = [[UIBarButtonItem alloc] initWithTitle:@"ooo" style:UIBarButtonItemStylePlain target:self.revealViewController action:@selector( revealToggle: )];
        [newBackButton setImage:[UIImage imageNamed:@"revealicon.png"]];
        self.navigationItem.leftBarButtonItem=newBackButton;
        
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    bgview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 70, self.view.frame.size.width, self.view.frame.size.height-70)];
    [bgview setBackgroundColor:[UIColor clearColor]];
    bgview.contentSize = CGSizeMake(self.view.frame.size.width, 500);
    
    [bgview addSubview:[self UILabel:self withFrame:CGRectMake(20, 0, bgview.frame.size.width-40, 50) withText:@"Akun Saya" withTextSize:16 withAlignment:0 withLines:0]];
    UIButton *edit = [self UIButton:self withFrame:CGRectMake(bgview.frame.size.width-100, 10, 80, 30) withTitle:@"Edit Data" withTag:0];
    [bgview addSubview:edit];
    
    UIView *line = [self UIView:self withFrame:CGRectMake(20, 50, bgview.frame.size.width-40, 1)];
    [line setBackgroundColor:[UIColor grayColor]];
    [bgview addSubview:line];
    
    Name = [self UILabel:self withFrame:CGRectMake(20, 60, bgview.frame.size.width-40, 50) withText:@"Nama nih" withTextSize:20 withAlignment:0 withLines:0];
    [bgview addSubview:Name];
    [bgview addSubview:[self UIButton:self withFrame:CGRectMake(bgview.frame.size.width-100, 70, 80, 30) withTitle:@"relawan" withTag:1]];
    
    [bgview addSubview:[self UILabel:self withFrame:CGRectMake(20, 100, bgview.frame.size.width-40, 50) withText:[NSString stringWithFormat:@"Tanggal Pembuatan akun : %@", @"28.05.2016"] withTextSize:14 withAlignment:0 withLines:0]];
    
    UILabel *body1 = [self UILabel:self withFrame:CGRectMake(20, 160, bgview.frame.size.width-40, 50) withText:@"DATA DIRI" withTextSize:20 withAlignment:0 withLines:0];
    [body1 setTextColor:[UIColor blueColor]];
    [bgview addSubview:body1];
    
    UIView *line1 = [self UIView:self withFrame:CGRectMake(20, 210, bgview.frame.size.width-40, 1)];
    [line1 setBackgroundColor:[UIColor blueColor]];
    [bgview addSubview:line1];
    
    [bgview addSubview:[self UILabel:self withFrame:CGRectMake(40, 210, bgview.frame.size.width-80, 40) withText:@"Jabatan" withTextSize:16 withAlignment:0 withLines:0]];
    
    [bgview addSubview:[self UILabel:self withFrame:CGRectMake(40, 230, bgview.frame.size.width-80, 40) withText:@"Staff" withTextSize:16 withAlignment:0 withLines:0]];
    
    UILabel *body2 = [self UILabel:self withFrame:CGRectMake(20, 270, bgview.frame.size.width-40, 50) withText:@"KONTAK" withTextSize:20 withAlignment:0 withLines:0];
    [body2 setTextColor:[UIColor blueColor]];
    [bgview addSubview:body2];
    
    UIView *line2 = [self UIView:self withFrame:CGRectMake(20, 320, bgview.frame.size.width-40, 1)];
    [line2 setBackgroundColor:[UIColor blueColor]];
    [bgview addSubview:line2];
    
    [bgview addSubview:[self UILabel:self withFrame:CGRectMake(40, 320, bgview.frame.size.width-80, 40) withText:@"Email" withTextSize:16 withAlignment:0 withLines:0]];
    
    [bgview addSubview:[self UILabel:self withFrame:CGRectMake(40, 340, bgview.frame.size.width-80, 40) withText:@"ferroirawan@rocketmail.com" withTextSize:16 withAlignment:0 withLines:0]];
    
    [bgview addSubview:[self UILabel:self withFrame:CGRectMake(40, 380, bgview.frame.size.width-80, 40) withText:@"No. Handphone" withTextSize:16 withAlignment:0 withLines:0]];
    
    [bgview addSubview:[self UILabel:self withFrame:CGRectMake(40, 400, bgview.frame.size.width-80, 40) withText:@"081295961147" withTextSize:16 withAlignment:0 withLines:0]];
    
    [[self view] addSubview:bgview];
}

-(void)BackBtn {
    [self GotoPage:self withIdentifier:@"Gallery"];
}

-(void)Act:(id)sender {
    if ([sender tag] == 0) {
        [self performSegueWithIdentifier:@"EditAccount" sender:self];
    }
}

@end
