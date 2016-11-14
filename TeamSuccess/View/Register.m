//
//  Register.m
//  TeamSuccess
//
//  Created by Mario Damianus on 11/11/16.
//  Copyright © 2016 MC. All rights reserved.
//

#import "Register.h"

@implementation Register
{
    UIScrollView *bgview;
    UITextField *Name, *BDay, *Gender, *Address, *RT, *RW, *Kota, *Kec, *Kel, *AddressNow, *KTP, *NoHP, *NoWA, *Email, *FB, *SizeBaju;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [[self navigationItem] setTitle:@"Register"];
    [[self view] addGestureRecognizer:tapRecognizer];
    [self UI];
}

-(void)UI {
    bgview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 70, self.view.frame.size.width, self.view.frame.size.height-70)];
    [bgview setBackgroundColor:[UIColor clearColor]];
    
    [bgview addSubview:[self UILabel:self withFrame:CGRectMake(20, 0, bgview.frame.size.width-40, 40) withText:@"Sosialisasi hanya bisa dilakukan terhadap tuan rumah yang sudah memiliki hak pilih." withTextSize:12 withAlignment:0 withLines:0]];
    
    [bgview addSubview:[self UIImage:self withFrame:CGRectMake(20, 40, bgview.frame.size.width-40, [self view].frame.size.height/4) withImageName:@"passclosed.png"]];
    
    UIView *line = [self UIView:self withFrame:CGRectMake(20, ([self view].frame.size.height/4)+45, bgview.frame.size.width-40, 1)];
    [line setBackgroundColor:[UIColor grayColor]];
    [bgview addSubview:line];
    
    Name = [self UITextField:self withFrame:CGRectMake(20, ([self view].frame.size.height/4)+50, bgview.frame.size.width-40, 40) withText:@"Nama" withSize:16 withInputType:UIKeyboardTypeDefault withSecure:0];
    [bgview addSubview:Name];
    
    BDay = [self UITextField:self withFrame:CGRectMake(20, Name.frame.origin.y+Name.frame.size.height+10, bgview.frame.size.width-40, 40) withText:@"Tanggal Lahir" withSize:16 withInputType:UIKeyboardTypeDefault withSecure:0];
    [bgview addSubview:BDay];
    
    Gender = [self UITextField:self withFrame:CGRectMake(20, BDay.frame.origin.y+BDay.frame.size.height+10, bgview.frame.size.width-40, 40) withText:@"Jenis Kelamin" withSize:16 withInputType:UIKeyboardTypeDefault withSecure:0];
    [bgview addSubview:Gender];
    
    Address = [self UITextField:self withFrame:CGRectMake(20, Gender.frame.origin.y+Gender.frame.size.height+10, bgview.frame.size.width-40, 40) withText:@"Alamat" withSize:16 withInputType:UIKeyboardTypeDefault withSecure:0];
    [bgview addSubview:Address];
    
    RT = [self UITextField:self withFrame:CGRectMake(20, Address.frame.origin.y+Address.frame.size.height+10, bgview.frame.size.width-40, 40) withText:@"RT" withSize:16 withInputType:UIKeyboardTypeDefault withSecure:0];
    [bgview addSubview:RT];
    
    RW = [self UITextField:self withFrame:CGRectMake(20, RT.frame.origin.y+RT.frame.size.height+10, bgview.frame.size.width-40, 40) withText:@"RW" withSize:16 withInputType:UIKeyboardTypeDefault withSecure:0];
    [bgview addSubview:RW];
    
    Kota = [self UITextField:self withFrame:CGRectMake(20, RW.frame.origin.y+RW.frame.size.height+10, bgview.frame.size.width-40, 40) withText:@"Kota" withSize:16 withInputType:UIKeyboardTypeDefault withSecure:0];
    [bgview addSubview:Kota];
    
    Kec = [self UITextField:self withFrame:CGRectMake(20, Kota.frame.origin.y+Kota.frame.size.height+10, bgview.frame.size.width-40, 40) withText:@"Kecamatan" withSize:16 withInputType:UIKeyboardTypeDefault withSecure:0];
    [bgview addSubview:Kec];
    
    Kel = [self UITextField:self withFrame:CGRectMake(20, Kec.frame.origin.y+Kec.frame.size.height+10, bgview.frame.size.width-40, 40) withText:@"Kelurahan" withSize:16 withInputType:UIKeyboardTypeDefault withSecure:0];
    [bgview addSubview:Kel];
    
    AddressNow = [self UITextField:self withFrame:CGRectMake(20, Kel.frame.origin.y+Kel.frame.size.height+10, bgview.frame.size.width-40, 40) withText:@"Alamat Sekarang" withSize:16 withInputType:UIKeyboardTypeDefault withSecure:0];
    [bgview addSubview:AddressNow];
    
    KTP = [self UITextField:self withFrame:CGRectMake(20, AddressNow.frame.origin.y+AddressNow.frame.size.height+10, bgview.frame.size.width-40, 40) withText:@"KTP" withSize:16 withInputType:UIKeyboardTypeNumberPad withSecure:0];
    [bgview addSubview:KTP];
    
    NoHP = [self UITextField:self withFrame:CGRectMake(20, KTP.frame.origin.y+KTP.frame.size.height+10, bgview.frame.size.width-40, 40) withText:@"No HP" withSize:16 withInputType:UIKeyboardTypeNumberPad withSecure:0];
    [bgview addSubview:NoHP];
    
    NoWA = [self UITextField:self withFrame:CGRectMake(20, NoHP.frame.origin.y+NoHP.frame.size.height+10, bgview.frame.size.width-40, 40) withText:@"No Whatsapp" withSize:16 withInputType:UIKeyboardTypeNumberPad withSecure:0];
    [bgview addSubview:NoWA];
    
    Email = [self UITextField:self withFrame:CGRectMake(20, NoWA.frame.origin.y+NoWA.frame.size.height+10, bgview.frame.size.width-40, 40) withText:@"Email" withSize:16 withInputType:UIKeyboardTypeEmailAddress withSecure:0];
    [bgview addSubview:Email];
    
    FB = [self UITextField:self withFrame:CGRectMake(20, Email.frame.origin.y+Email.frame.size.height+10, bgview.frame.size.width-40, 40) withText:@"Facebook" withSize:16 withInputType:UIKeyboardTypeDefault withSecure:0];
    [bgview addSubview:FB];
    
    SizeBaju = [self UITextField:self withFrame:CGRectMake(20, FB.frame.origin.y+FB.frame.size.height+10, bgview.frame.size.width-40, 40) withText:@"Ukuran Baju" withSize:16 withInputType:UIKeyboardTypeNumberPad withSecure:0];
    [bgview addSubview:SizeBaju];
    
    UIView *line2 = [self UIView:self withFrame:CGRectMake(20, SizeBaju.frame.origin.y+SizeBaju.frame.size.height+10, bgview.frame.size.width-40, 1)];
    [line2 setBackgroundColor:[UIColor grayColor]];
    [bgview addSubview:line2];
    
    UIButton *kirim = [self UIButton:self withFrame:CGRectMake(20, line2.frame.origin.y+line2.frame.size.height+10, bgview.frame.size.width-40, 50) withTitle:@"KIRIM" withTag:0];
    [bgview addSubview:kirim];
    
    bgview.contentSize = CGSizeMake(self.view.frame.size.width, kirim.frame.origin.y+kirim.frame.size.height+10);
    
    [[self view] addSubview:bgview];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField {
    [bgview setFrame:CGRectMake(0, 70, self.view.frame.size.width, self.view.frame.size.height-320)];
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    [bgview setFrame:CGRectMake(0, 70, self.view.frame.size.width, self.view.frame.size.height-70)];
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
