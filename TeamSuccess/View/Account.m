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
    UIView *bgview;
    UILabel *Name, *Role, *Pos;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self navigationItem] setTitle:@"Dashboard"];
    [self UI];
}

-(void)UI {
    bgview = [self UIView:self withFrame:CGRectMake(0, 70, [self view].frame.size.width, [self view].frame.size.height-70)];
    
    [bgview addSubview:[self UILabel:self withFrame:CGRectMake(20, 0, bgview.frame.size.width-40, 50) withText:@"Akun Saya" withTextSize:16 withAlignment:0 withLines:0]];
    UIButton *edit = [self UIButton:self withFrame:CGRectMake(bgview.frame.size.width-90, 10, 80, 30) withTitle:@"Edit Data" withTag:0];
    [edit setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [[edit layer] setBorderWidth:1.0];
    [[edit layer] setBorderColor:[UIColor blueColor].CGColor];
    [bgview addSubview:edit];
    
    UIView *line = [self UIView:self withFrame:CGRectMake(20, 50, bgview.frame.size.width, 1)];
    [line setBackgroundColor:[UIColor grayColor]];
    [bgview addSubview:line];
    
    Name = [self UILabel:self withFrame:CGRectMake(0, 0, 0, 0) withText:@"Nama nih" withTextSize:20 withAlignment:0 withLines:0];
    [bgview addSubview:Name];
    [bgview addSubview:[self UIButton:self withFrame:CGRectMake(0, 0, 0, 0) withTitle:@"relawan" withTag:1]];
    
    
    [[self view] addSubview:bgview];
}
@end
