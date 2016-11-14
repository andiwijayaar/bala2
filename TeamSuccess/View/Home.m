//
//  Home.m
//  TeamSuccess
//
//  Created by Mario Damianus on 11/11/16.
//  Copyright © 2016 MC. All rights reserved.
//

#import "Home.h"
#import "ImageCell.h"

@implementation Home
{
    UIView *bgview;
}
-(void)viewDidLoad {
    [super viewDidLoad];
    [[self navigationItem] setTitle:@"Dashboard"];
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
    
    bgview = [self UIView:self withFrame:CGRectMake(0, 70, [self view].frame.size.width, [self view].frame.size.height-60)];
    [bgview setBackgroundColor:[UIColor clearColor]];
    
    UILabel *head = [self UILabel:self withFrame:CGRectMake(0, 0, [self view].frame.size.width, 50) withText:@"Berita Utama / Pengumuman" withTextSize:16 withAlignment:0 withLines:0];
    [head setBackgroundColor:[UIColor blueColor]];
    [head setTextColor:[UIColor whiteColor]];
    [bgview addSubview:head];
    
    [bgview addSubview:[self UITableView:self withFrame:CGRectMake(0, 50, bgview.frame.size.width, [self view].frame.size.height-120) withStyle:0]];
    
    [[self view] addSubview:bgview];
}

-(void)BackBtn {
    [self GotoPage:self withIdentifier:@"Forum"];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 16;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    ImageCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[ImageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.img.image = [UIImage imageNamed:@"icon.png"];
    cell.mainLabel.text = @"Tui2Zone";
    cell.descriptionLabel.text = @"Lorem ipsum dolor sit amet, at eos vitae integre necessitatibus. Perpetua definiebas te sea. Te pri eirmod singulis. No est aeque possit utroque. Dicant legimus usu te, ne putent persius postulant sed. Duis autem zril nam in, malis timeam nostrum vel at, inermis facilis vix ea. Id magna deserunt qui, has in partem debitis, eos id quodsi perfecto maluisset. Integre senserit ad est, labores suscipit sapientem est ut, legimus salutandi complectitur mea in. Vix fugit consulatu cu, vix phaedrum tincidunt et, et munere petentium cotidieque quo. Eos dicat invenire id. Ne sit eius recusabo inimicus. Vel an saepe nominati dissentiet, cu iudico oporteat repudiandae pro, his latine detraxit et. Vim eu postea senserit mnesarchum. Vix nisl eloquentiam no, ei mei ferri mediocrem. Per no delenit similique deterruisset. Repudiandae philosophia vel ad. His autem conceptam ad, et his regione nominavi, amet omittam duo no. Autem vulputate est ei, ea legere ocurreret adversarium cum, no sumo forensibus pro. Ex paulo consul habemus per, mea ei justo putent, nec commodo facilisi convenire an. Accusam omittam ne quo. Usu vide mentitum ea, movet nobis moderatius et mea. Sit sale euripidis id. Eu explicari constituto dissentiet his, mei ad quod copiosae phaedrum. Eos at iusto delectus adipiscing, modo dicunt melius vel te. Noluisse scaevola recusabo eu est, summo meliore id cum, detracto senserit an duo. An quas ornatus nusquam per. Pri te apeirian antiopam.";
    
    return cell;
}

#pragma mark - Tableview Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"DetailNews" sender:self];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

@end
