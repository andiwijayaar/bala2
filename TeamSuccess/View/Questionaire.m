//
//  Questionaire.m
//  TeamSuccess
//
//  Created by Mario Damianus on 11/11/16.
//  Copyright © 2016 MC. All rights reserved.
//

#import "Questionaire.h"

@implementation Questionaire
{
    UIScrollView *bgview;
    UITextField *Name, *BDay, *Gender, *Address, *RT, *RW, *Kota, *Kec, *Kel, *AddressNow, *KTP, *NoHP, *NoWA, *Email, *FB, *SizeBaju, *telp, *age;
    UILabel *Q1, *Q2;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [[self navigationItem] setTitle:@"Kuisioner"];
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
    
    bgview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 70, self.view.frame.size.width, self.view.frame.size.height-70)];
    [bgview setBackgroundColor:[self colorFromHexString:@"#FAFAFA" withAlpha:1.0]];
    
//    [bgview addSubview:[self UILabel:self withFrame:CGRectMake(20, 0, bgview.frame.size.width-40, 80) withText:@"Untuk memetakan orientrasi pemilih dalam PILKADA DKI 2017 PERHATIAN UNTUK RELAWAN : sosialisasi hanya bisa dilakukan terhadap tuan rumah yang sudah memiliki hak pilih." withTextSize:12 withAlignment:0 withLines:0]];
//    
//    [bgview addSubview:[self UIImage:self withFrame:CGRectMake(20, 80, bgview.frame.size.width-40, [self view].frame.size.height/4) withImageName:@"passclosed.png"]];
//
    UILabel *formLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, bgview.frame.size.width - 40, 40)];
    [formLabel setText:@"Form Relawan"];
    [formLabel setFont:[UIFont boldSystemFontOfSize:18]];
    [formLabel setTextColor:[self colorFromHexString:@"#888888" withAlpha:1.0]];
    [bgview addSubview:formLabel];
    
    UIView *line = [self UIView:self withFrame:CGRectMake(20, formLabel.frame.size.height + formLabel.frame.origin.y - 5, bgview.frame.size.width-40, 2.5)];
    [line setBackgroundColor:[self colorFromHexString:@"#CCCCCC" withAlpha:1.0]];
    [bgview addSubview:line];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, line.frame.origin.y, bgview.frame.size.width - 40, 70)];
    [titleLabel setText:@"Sosialisasi hanya bisa dilakukan terhadap tuan rumah yang sudah memiliki hak pilih."];
    [titleLabel setNumberOfLines:3];
    [titleLabel setTextColor:[self colorFromHexString:@"#888888" withAlpha:1.0]];
    [bgview addSubview:titleLabel];
    
//    Name = [self UITextField:self withFrame:CGRectMake(20, line.frame.origin.y+10, bgview.frame.size.width-40, 40) withText:@"Nama Pemilih" withSize:16 withInputType:UIKeyboardTypeDefault withSecure:0];
    Name = [self CustomTextField:CGRectMake(20, titleLabel.frame.size.height + titleLabel.frame.origin.y + 10, self.view.frame.size.width - 40, 40) withStrPlcHolder:@"Nama Pemilih" withAttrColor:nil keyboardType:UIKeyboardTypeEmailAddress withTextColor:nil withFontSize:16 withTag:0 withDelegate:self withLabel:TRUE];
    [bgview addSubview:Name];
    
    telp = [self CustomTextField:CGRectMake(20, Name.frame.size.height + Name.frame.origin.y + 20, self.view.frame.size.width - 40, 40) withStrPlcHolder:@"Nomor Telp Rumah" withAttrColor:nil keyboardType:UIKeyboardTypeNumberPad withTextColor:nil withFontSize:16 withTag:1 withDelegate:self withLabel:TRUE];
    [bgview addSubview:telp];
    
    NoHP = [self CustomTextField:CGRectMake(20, telp.frame.size.height + telp.frame.origin.y + 20, self.view.frame.size.width - 40, 40) withStrPlcHolder:@"Nomor Handphone" withAttrColor:nil keyboardType:UIKeyboardTypeNumberPad withTextColor:nil withFontSize:16 withTag:2 withDelegate:self withLabel:TRUE];
    [bgview addSubview:NoHP];
//
//    Gender = [self UITextField:self withFrame:CGRectMake(20, Name.frame.origin.y+Name.frame.size.height+10, bgview.frame.size.width-40, 40) withText:@"Jenis Kelamin" withSize:16 withInputType:UIKeyboardTypeDefault withSecure:0];
    Gender = [self CustomTextField:CGRectMake(20, NoHP.frame.size.height + NoHP.frame.origin.y + 20, self.view.frame.size.width - 40, 40) withStrPlcHolder:@"Jenis Kelamin" withAttrColor:nil keyboardType:UIKeyboardTypeDefault withTextColor:nil withFontSize:16 withTag:3 withDelegate:self withLabel:TRUE];
    [bgview addSubview:Gender];
    
    age = [self CustomTextField:CGRectMake(20, Gender.frame.size.height + Gender.frame.origin.y + 20, self.view.frame.size.width - 40, 40) withStrPlcHolder:@"Usia" withAttrColor:nil keyboardType:UIKeyboardTypeNumberPad withTextColor:nil withFontSize:16 withTag:4 withDelegate:self withLabel:TRUE];
    [bgview addSubview:age];
//
//    Address = [self UITextField:self withFrame:CGRectMake(20, Gender.frame.origin.y+Gender.frame.size.height+10, bgview.frame.size.width-40, 40) withText:@"Alamat" withSize:16 withInputType:UIKeyboardTypeDefault withSecure:0];
//    [bgview addSubview:Address];
    
    Address = [self CustomTextField:CGRectMake(20, age.frame.size.height + age.frame.origin.y + 20, self.view.frame.size.width - 40, 40) withStrPlcHolder:@"Alamat" withAttrColor:nil keyboardType:UIKeyboardTypeDefault withTextColor:nil withFontSize:16 withTag:5 withDelegate:self withLabel:TRUE];
    [bgview addSubview:Address];
//    
//    RT = [self UITextField:self withFrame:CGRectMake(20, Address.frame.origin.y+Address.frame.size.height+10, bgview.frame.size.width-40, 40) withText:@"RT" withSize:16 withInputType:UIKeyboardTypeDefault withSecure:0];
//    [bgview addSubview:RT];
    RT = [self CustomTextField:CGRectMake(20, Address.frame.size.height + Address.frame.origin.y + 20, self.view.frame.size.width - 40, 40) withStrPlcHolder:@"RT" withAttrColor:nil keyboardType:UIKeyboardTypeEmailAddress withTextColor:nil withFontSize:16 withTag:6 withDelegate:self withLabel:TRUE];
    [bgview addSubview:RT];
//    
//    RW = [self UITextField:self withFrame:CGRectMake(20, RT.frame.origin.y+RT.frame.size.height+10, bgview.frame.size.width-40, 40) withText:@"RW" withSize:16 withInputType:UIKeyboardTypeDefault withSecure:0];
//    [bgview addSubview:RW];
    
    RW = [self CustomTextField:CGRectMake(20, RT.frame.size.height + RT.frame.origin.y + 20, self.view.frame.size.width - 40, 40) withStrPlcHolder:@"RW" withAttrColor:nil keyboardType:UIKeyboardTypeEmailAddress withTextColor:nil withFontSize:16 withTag:7 withDelegate:self withLabel:TRUE];
    [bgview addSubview:RW];
//    
//    Kota = [self UITextField:self withFrame:CGRectMake(20, RW.frame.origin.y+RW.frame.size.height+10, bgview.frame.size.width-40, 40) withText:@"Kota" withSize:16 withInputType:UIKeyboardTypeDefault withSecure:0];
//    [bgview addSubview:Kota];
    Kota = [self CustomTextField:CGRectMake(20, RW.frame.size.height + RW.frame.origin.y + 20, self.view.frame.size.width - 40, 40) withStrPlcHolder:@"Kota / Kabupaten" withAttrColor:nil keyboardType:UIKeyboardTypeEmailAddress withTextColor:nil withFontSize:16 withTag:8 withDelegate:self withLabel:TRUE];
    [bgview addSubview:Kota];
//    
//    Kec = [self UITextField:self withFrame:CGRectMake(20, Kota.frame.origin.y+Kota.frame.size.height+10, bgview.frame.size.width-40, 40) withText:@"Kecamatan" withSize:16 withInputType:UIKeyboardTypeDefault withSecure:0];
//    [bgview addSubview:Kec];
    Kec = [self CustomTextField:CGRectMake(20, Kota.frame.size.height + Kota.frame.origin.y + 20, self.view.frame.size.width - 40, 40) withStrPlcHolder:@"Kecamatan" withAttrColor:nil keyboardType:UIKeyboardTypeEmailAddress withTextColor:nil withFontSize:16 withTag:9 withDelegate:self withLabel:TRUE];
    [bgview addSubview:Kec];
//    
//    Kel = [self UITextField:self withFrame:CGRectMake(20, Kec.frame.origin.y+Kec.frame.size.height+10, bgview.frame.size.width-40, 40) withText:@"Kelurahan" withSize:16 withInputType:UIKeyboardTypeDefault withSecure:0];
//    [bgview addSubview:Kel];
    Kel = [self CustomTextField:CGRectMake(20, Kec.frame.size.height + Kec.frame.origin.y + 20, self.view.frame.size.width - 40, 40) withStrPlcHolder:@"Kelurahan" withAttrColor:nil keyboardType:UIKeyboardTypeEmailAddress withTextColor:nil withFontSize:16 withTag:10 withDelegate:self withLabel:TRUE];
    [bgview addSubview:Kel];
//    
//    Q1 = [self UILabel:self withFrame:CGRectMake(20, Kel.frame.origin.y+Kel.frame.size.height+10, bgview.frame.size.width-40, 100) withText:@"Selain sebagai warga negara Indonesia, Bapak/Ibu/Sdr termasuk kedalam suku bangsa apa? Misalnya, Melayu, Tionghoa, Jawa Batak,dll" withTextSize:16 withAlignment:0 withLines:0];
//    [bgview addSubview:Q1];
//    
//    Q2 = [self UILabel:self withFrame:CGRectMake(20, Q1.frame.origin.y+Q1.frame.size.height+10, bgview.frame.size.width-40, 100) withText:@"Ada berapa pemilih di rumah B/I/S yang akan menggunakan hak pilihnya pada Pilkada Prov. DKI Jakarta pada Februari 2017 mendatang?" withTextSize:16 withAlignment:0 withLines:0];
//    [bgview addSubview:Q2];
//    
//    UIView *line2 = [self UIView:self withFrame:CGRectMake(20, Q2.frame.origin.y+Q2.frame.size.height+10, bgview.frame.size.width-40, 1)];
//    [line2 setBackgroundColor:[UIColor grayColor]];
//    [bgview addSubview:line2];
//    
//    UIButton *kirim = [self UIButton:self withFrame:CGRectMake(20, line2.frame.origin.y+line2.frame.size.height+10, bgview.frame.size.width-40, 50) withTitle:@"KIRIM" withTag:0];
//    [bgview addSubview:kirim];
//    
//    bgview.contentSize = CGSizeMake(self.view.frame.size.width, kirim.frame.origin.y+kirim.frame.size.height+10);
    
    [[self view] addSubview:bgview];
}

@end
