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
    UIScrollView *bgview;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    [[self navigationItem] setTitle:@"Forum"];
    [[self view] addGestureRecognizer:tapRecognizer];
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
    
    UILabel *head = [self UILabel:self withFrame:CGRectMake(0, 70, [self view].frame.size.width, 50) withText:@"Forum Relawan Keluran Jati Rawa" withTextSize:16 withAlignment:0 withLines:0];
    [head setBackgroundColor:[UIColor blueColor]];
    [head setTextColor:[UIColor whiteColor]];
    [[self view] addSubview:head];
    
    bgview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 120, self.view.frame.size.width, self.view.frame.size.height-120)];
    [bgview setBackgroundColor:[UIColor clearColor]];
    bgview.contentSize = CGSizeMake(self.view.frame.size.width, 450);
    
    UITextView *input = [[UITextView alloc] initWithFrame:CGRectMake(0, bgview.frame.size.height-80, bgview.frame.size.width-100, 80)];
    [input setDelegate:self];
    [[input layer] setBorderWidth:1.0];
    [[input layer] setBorderColor:[UIColor blueColor].CGColor];
    [bgview addSubview:input];
    
    UIButton *send = [self UIButton:self withFrame:CGRectMake(bgview.frame.size.width-100, bgview.frame.size.height-80, 100, 80) withTitle:@"Send" withTag:0];
    [send setBackgroundColor:[UIColor grayColor]];
    [send setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [bgview addSubview:send];
    
    [[self view] addSubview:bgview];
}

-(void)BackBtn {
    [self GotoPage:self withIdentifier:@"Account"];
}

-(void)textViewDidBeginEditing:(UITextView *)textView {
    [bgview setFrame:CGRectMake(0, 120, self.view.frame.size.width, self.view.frame.size.height-375)];
    [bgview setContentOffset:CGPointMake(0, bgview.frame.size.height+55) animated:NO];
}

-(void)textViewDidEndEditing:(UITextView *)textView {
    [bgview setFrame:CGRectMake(0, 120, self.view.frame.size.width, self.view.frame.size.height-120)];
}

@end
