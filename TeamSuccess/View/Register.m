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
    UITextField *Name, *BDay, *Gender, *Address, *RT, *RW, *Kota, *Kec, *Kel, *AddressNow, *KTP, *NoHP, *NoWA, *Email, *FB, *SizeBaju, *pass, *confPass;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [[self navigationItem] setTitle:@"Register"];
    [[self view] addGestureRecognizer:tapRecognizer];
    [self UI];
}

-(void)UI {
    bgview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 70, self.view.frame.size.width, self.view.frame.size.height-70)];
    [bgview setBackgroundColor:[self colorFromHexString:@"#FAFAFA" withAlpha:1.0]];
    
//    [bgview addSubview:[self UILabel:self withFrame:CGRectMake(20, 0, bgview.frame.size.width-40, 40) withText:@"Sosialisasi hanya bisa dilakukan terhadap tuan rumah yang sudah memiliki hak pilih." withTextSize:12 withAlignment:0 withLines:0]];
//    
    [bgview addSubview:[self UIImage:self withFrame:CGRectMake(40, 80, bgview.frame.size.width-80, [self view].frame.size.height/4) withImageName:@"icon.png"]];
//
//    Name = [self UITextField:self withFrame:CGRectMake(20, ([self view].frame.size.height/4)+50, bgview.frame.size.width-40, 40) withText:@"Nama" withSize:16 withInputType:UIKeyboardTypeDefault withSecure:0];
    
    
    Name = [self CustomTextField:CGRectMake(40, 280, self.view.frame.size.width - 80, 40) withStrPlcHolder:@"Nama Lengkap" withAttrColor:nil keyboardType:UIKeyboardTypeDefault withTextColor:nil withFontSize:16 withTag:0 withDelegate:self withLabel:TRUE];
    [bgview addSubview:Name];
    
//    BDay = [self UITextField:self withFrame:CGRectMake(20, Name.frame.origin.y+Name.frame.size.height+10, bgview.frame.size.width-40, 40) withText:@"Tanggal Lahir" withSize:16 withInputType:UIKeyboardTypeDefault withSecure:0];
//    [bgview addSubview:BDay];
//
//    Gender = [self UITextField:self withFrame:CGRectMake(20, BDay.frame.origin.y+BDay.frame.size.height+10, bgview.frame.size.width-40, 40) withText:@"Jenis Kelamin" withSize:16 withInputType:UIKeyboardTypeDefault withSecure:0];
//    [bgview addSubview:Gender];
//    
//    Address = [self UITextField:self withFrame:CGRectMake(20, Gender.frame.origin.y+Gender.frame.size.height+10, bgview.frame.size.width-40, 40) withText:@"Alamat" withSize:16 withInputType:UIKeyboardTypeDefault withSecure:0];
    Address = [self CustomTextField:CGRectMake(40, Name.frame.size.height + Name.frame.origin.y + 20, self.view.frame.size.width - 80, 40) withStrPlcHolder:@"Alamat" withAttrColor:nil keyboardType:UIKeyboardTypeDefault withTextColor:nil withFontSize:16 withTag:1 withDelegate:self withLabel:TRUE];
    [bgview addSubview:Address];
//
//    RT = [self UITextField:self withFrame:CGRectMake(20, Address.frame.origin.y+Address.frame.size.height+10, bgview.frame.size.width-40, 40) withText:@"RT" withSize:16 withInputType:UIKeyboardTypeDefault withSecure:0];
//    [bgview addSubview:RT];
//    
//    RW = [self UITextField:self withFrame:CGRectMake(20, RT.frame.origin.y+RT.frame.size.height+10, bgview.frame.size.width-40, 40) withText:@"RW" withSize:16 withInputType:UIKeyboardTypeDefault withSecure:0];
//    [bgview addSubview:RW];
//    
//    Kota = [self UITextField:self withFrame:CGRectMake(20, RW.frame.origin.y+RW.frame.size.height+10, bgview.frame.size.width-40, 40) withText:@"Kota" withSize:16 withInputType:UIKeyboardTypeDefault withSecure:0];
//    [bgview addSubview:Kota];
//    
//    Kec = [self UITextField:self withFrame:CGRectMake(20, Kota.frame.origin.y+Kota.frame.size.height+10, bgview.frame.size.width-40, 40) withText:@"Kecamatan" withSize:16 withInputType:UIKeyboardTypeDefault withSecure:0];
//    [bgview addSubview:Kec];
//    
//    Kel = [self UITextField:self withFrame:CGRectMake(20, Kec.frame.origin.y+Kec.frame.size.height+10, bgview.frame.size.width-40, 40) withText:@"Kelurahan" withSize:16 withInputType:UIKeyboardTypeDefault withSecure:0];
//    [bgview addSubview:Kel];
//    
//    AddressNow = [self UITextField:self withFrame:CGRectMake(20, Kel.frame.origin.y+Kel.frame.size.height+10, bgview.frame.size.width-40, 40) withText:@"Alamat Sekarang" withSize:16 withInputType:UIKeyboardTypeDefault withSecure:0];
//    [bgview addSubview:AddressNow];
//    
//    KTP = [self UITextField:self withFrame:CGRectMake(20, AddressNow.frame.origin.y+AddressNow.frame.size.height+10, bgview.frame.size.width-40, 40) withText:@"KTP" withSize:16 withInputType:UIKeyboardTypeNumberPad withSecure:0];
//    [bgview addSubview:KTP];
//    
//
//    NoWA = [self UITextField:self withFrame:CGRectMake(20, NoHP.frame.origin.y+NoHP.frame.size.height+10, bgview.frame.size.width-40, 40) withText:@"No Whatsapp" withSize:16 withInputType:UIKeyboardTypeNumberPad withSecure:0];
//    [bgview addSubview:NoWA];
//    
//    Email = [self UITextField:self withFrame:CGRectMake(20, NoWA.frame.origin.y+NoWA.frame.size.height+10, bgview.frame.size.width-40, 40) withText:@"Email" withSize:16 withInputType:UIKeyboardTypeEmailAddress withSecure:0];
    Email = [self CustomTextField:CGRectMake(40, Address.frame.size.height + Address.frame.origin.y + 20, self.view.frame.size.width - 80, 40) withStrPlcHolder:@"Alamat Email" withAttrColor:nil keyboardType:UIKeyboardTypeEmailAddress withTextColor:nil withFontSize:16 withTag:2 withDelegate:self withLabel:TRUE];
    [bgview addSubview:Email];
    
    NoHP = [self CustomTextField:CGRectMake(40, Email.frame.size.height + Email.frame.origin.y + 20, self.view.frame.size.width - 80, 40) withStrPlcHolder:@"Nomor Handphone" withAttrColor:nil keyboardType:UIKeyboardTypeNumberPad withTextColor:nil withFontSize:16 withTag:3 withDelegate:self withLabel:TRUE];
    [bgview addSubview:NoHP];
    
    pass = [self CustomTextField:CGRectMake(40, NoHP.frame.size.height + NoHP.frame.origin.y + 20, self.view.frame.size.width - 80, 40) withStrPlcHolder:@"Kata Sandi" withAttrColor:nil keyboardType:UIKeyboardTypeDefault withTextColor:nil withFontSize:16 withTag:4 withDelegate:self withLabel:TRUE];
    [pass setSecureTextEntry:TRUE];
    [bgview addSubview:pass];
    
    confPass = [self CustomTextField:CGRectMake(40, pass.frame.size.height + pass.frame.origin.y + 20, self.view.frame.size.width - 80, 40) withStrPlcHolder:@"Ulangi Kata Sandi" withAttrColor:nil keyboardType:UIKeyboardTypeDefault withTextColor:nil withFontSize:16 withTag:5 withDelegate:self withLabel:TRUE];
    [confPass setSecureTextEntry:TRUE];
    [bgview addSubview:confPass];

//
//    FB = [self UITextField:self withFrame:CGRectMake(20, Email.frame.origin.y+Email.frame.size.height+10, bgview.frame.size.width-40, 40) withText:@"Facebook" withSize:16 withInputType:UIKeyboardTypeDefault withSecure:0];
//    [bgview addSubview:FB];
//    
//    SizeBaju = [self UITextField:self withFrame:CGRectMake(20, FB.frame.origin.y+FB.frame.size.height+10, bgview.frame.size.width-40, 40) withText:@"Ukuran Baju" withSize:16 withInputType:UIKeyboardTypeNumberPad withSecure:0];
//    [bgview addSubview:SizeBaju];
//    
//    UIView *line2 = [self UIView:self withFrame:CGRectMake(20, SizeBaju.frame.origin.y+SizeBaju.frame.size.height+10, bgview.frame.size.width-40, 1)];
//    [line2 setBackgroundColor:[UIColor grayColor]];
//    [bgview addSubview:line2];
//    
    UIButton *kirim = [self UIButton:self withFrame:CGRectMake(20, confPass.frame.origin.y+confPass.frame.size.height+20, bgview.frame.size.width-40, 50) withTitle:@"BUAT AKUN" withTag:0];
    [kirim setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [[kirim layer] setCornerRadius:3];
    [[kirim layer] setBorderColor:[self colorFromHexString:@"#CCCCCC" withAlpha:1.0].CGColor];
    [kirim setBackgroundColor:[self colorFromHexString:@"#CCCCCC" withAlpha:1.0]];
    [bgview addSubview:kirim];
//
    bgview.contentSize = CGSizeMake(self.view.frame.size.width, kirim.frame.origin.y+kirim.frame.size.height+40);
    
    [[self view] addSubview:bgview];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField {
    [bgview setFrame:CGRectMake(0, 70, self.view.frame.size.width, self.view.frame.size.height-320)];
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    [bgview setFrame:CGRectMake(0, 70, self.view.frame.size.width, self.view.frame.size.height-70)];
}

-(void)Act:(id)sender {
    if([[Name text] length] > 0){
        if([[Name text] length] > 2){
            [self removeValidationIcon:Name withColor:nil];
        }else{
            [self required:Name withMsg:@"Nama minimal 3 karakter!"];
        }
    }else{
        [self required:Name withMsg:nil];
    }
    
    if([[Address text] length] > 0){
        [self removeValidationIcon:Address withColor:nil];
    }else{
        [self required:Address withMsg:nil];
    }
    
    if([[Email text] length] > 0){
        if([self IsValidEmail:[Email text]]){
            [self removeValidationIcon:Email withColor:nil];
        }else{
            [self required:Email withMsg:@"Email salah!"];
        }
    }else{
        [self required:Email withMsg:nil];
    }
    
    if([[NoHP text] length] > 0){
        [self removeValidationIcon:NoHP withColor:nil];
    }else{
        [self required:NoHP withMsg:nil];
    }
    
    if([[pass text] length] > 0){
        [self removeValidationIcon:pass withColor:nil];
    }else{
        [self required:pass withMsg:nil];
    }
    
    if([[confPass text] length] > 0){
        [self removeValidationIcon:confPass withColor:nil];
    }else{
        [self required:confPass withMsg:nil];
    }
    
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
