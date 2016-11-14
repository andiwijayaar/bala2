//
//  Galery.m
//  TeamSuccess
//
//  Created by Mario Damianus on 11/11/16.
//  Copyright © 2016 MC. All rights reserved.
//

#import "Gallery.h"

@implementation Gallery
{
    UIScrollView *bgview;
    int x, y;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [[self navigationItem] setTitle:@"Gallery"];
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
    [bgview setBackgroundColor:[self colorFromHexString:@"#FAFAFA" withAlpha:1.0]];
    
    x = 20;
    y = 0;
    for (int i=0; i < 5; i++) {
        [bgview addSubview:[self UIImage:self withFrame:CGRectMake(x, y, bgview.frame.size.width-40, [self view].frame.size.height/4) withImageName:@"passopen.png"]];
        y = y + ([self view].frame.size.height/4) +10;
        
    }
    
    bgview.contentSize = CGSizeMake(self.view.frame.size.width, y);
    
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
