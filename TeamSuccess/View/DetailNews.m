//
//  DetailNews.m
//  TeamSuccess
//
//  Created by Mario Damianus on 11/13/16.
//  Copyright © 2016 MC. All rights reserved.
//

#import "DetailNews.h"

@interface DetailNews ()

@end

@implementation DetailNews
{
    UIView *bgview;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [[self navigationItem] setTitle:@"News"];
    [self UI];
}

-(void)UI {
    bgview = [self UIView:self withFrame:CGRectMake(0, 70, [self view].frame.size.width, [self view].frame.size.height-60)];
    [bgview setBackgroundColor:[UIColor clearColor]];
    
    UILabel *head = [self UILabel:self withFrame:CGRectMake(0, 0, [self view].frame.size.width, 50) withText:@"Berita Utama / Pengumuman" withTextSize:16 withAlignment:0 withLines:0];
    [head setBackgroundColor:[UIColor blueColor]];
    [head setTextColor:[UIColor whiteColor]];
    [bgview addSubview:head];
    
    UIImageView *pic = [self UIImage:self withFrame:CGRectMake(20, head.frame.origin.y+head.frame.size.height+10, bgview.frame.size.width-40, [self view].frame.size.height/4) withImageName:@"icon.png"];
    [bgview addSubview:pic];
    
    UITextView *berita = [[UITextView alloc] initWithFrame:CGRectMake(20, pic.frame.origin.y+pic.frame.size.height+10, bgview.frame.size.width-40, bgview.frame.size.height-(([self view].frame.size.height/4)+100))];
    [berita setDelegate:self];
    [berita setTextAlignment:NSTextAlignmentJustified];
    [berita setEditable:NO];
    [berita setText:@"Lorem ipsum dolor sit amet, at eos vitae integre necessitatibus. Perpetua definiebas te sea. Te pri eirmod singulis. No est aeque possit utroque. Dicant legimus usu te, ne putent persius postulant sed. Duis autem zril nam in, malis timeam nostrum vel at, inermis facilis vix ea. Id magna deserunt qui, has in partem debitis, eos id quodsi perfecto maluisset. Integre senserit ad est, labores suscipit sapientem est ut, legimus salutandi complectitur mea in. Vix fugit consulatu cu, vix phaedrum tincidunt et, et munere petentium cotidieque quo. Eos dicat invenire id. Ne sit eius recusabo inimicus. Vel an saepe nominati dissentiet, cu iudico oporteat repudiandae pro, his latine detraxit et. Vim eu postea senserit mnesarchum. Vix nisl eloquentiam no, ei mei ferri mediocrem. Per no delenit similique deterruisset. Repudiandae philosophia vel ad. His autem conceptam ad, et his regione nominavi, amet omittam duo no. Autem vulputate est ei, ea legere ocurreret adversarium cum, no sumo forensibus pro. Ex paulo consul habemus per, mea ei justo putent, nec commodo facilisi convenire an. Accusam omittam ne quo. Usu vide mentitum ea, movet nobis moderatius et mea. Sit sale euripidis id. Eu explicari constituto dissentiet his, mei ad quod copiosae phaedrum. Eos at iusto delectus adipiscing, modo dicunt melius vel te. Noluisse scaevola recusabo eu est, summo meliore id cum, detracto senserit an duo. An quas ornatus nusquam per. Pri te apeirian antiopam."];
    [bgview addSubview:berita];
    
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
