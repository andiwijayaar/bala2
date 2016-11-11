//
//  Forum.m
//  TeamSuccess
//
//  Created by Mario Damianus on 11/11/16.
//  Copyright © 2016 MC. All rights reserved.
//

#import "Forum.h"

@implementation Forum
{
    UIView *bgview;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    [[self navigationItem] setTitle:@"Dashboard"];
    [[self view] addGestureRecognizer:tapRecognizer];
    [self UI];
    UIBarButtonItem *newBackButton = [[UIBarButtonItem alloc] initWithTitle:@"--" style:UIBarButtonItemStylePlain target:self action:@selector(BackBtn)];
    [newBackButton setImage:[UIImage imageNamed:@"Back.png"]];
    self.navigationItem.leftBarButtonItem=newBackButton;
}

-(void)UI {
    bgview = [self UIView:self withFrame:CGRectMake(0, 70, [self view].frame.size.width, [self view].frame.size.height-60)];
    [bgview setBackgroundColor:[UIColor clearColor]];
    [[bgview layer] setCornerRadius:10];
    
    UILabel *head = [self UILabel:self withFrame:CGRectMake(0, 0, [self view].frame.size.width, 50) withText:@"Forum Relawan Keluran Jati Rawa" withTextSize:16 withAlignment:0 withLines:0];
    [head setBackgroundColor:[UIColor blueColor]];
    [head setTextColor:[UIColor whiteColor]];
    [bgview addSubview:head];
    
    UITextView *input = [[UITextView alloc] initWithFrame:CGRectMake(0, bgview.frame.size.height-150, [self view].frame.size.width-100, 150)];
    [bgview addSubview:input];
    
    UIButton *send = [self UIButton:self withFrame:CGRectMake(bgview.frame.size.width-100, bgview.frame.size.height-150, 100, 150) withTitle:@"Send" withTag:0];
    [send setBackgroundColor:[UIColor grayColor]];
    [send setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [bgview addSubview:send];
    
    [[self view] addSubview:bgview];
}

-(void)BackBtn {
    [self GotoPage:self withIdentifier:@"Account"];
}

@end
