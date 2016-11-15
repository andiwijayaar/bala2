//
//  ViewController.h
//
//  Created by MC on 6/19/15.
//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"
#import "AFNetworking.h"
#import "AFHTTPRequestOperationManager+Synchronous.h"

#define DEVICEID [PCUtils getDeviceID]
#define DEVICETOKEN [defaults objectForKey:@"ApnsDeviceToken"]
#define TOUCHIDPIN @"hmnj8hukhjj823"

//Static Message
#define MSGResponseNil @"System unable to process your transaction. Please check your network."


@interface ParentViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>
{
    NSUserDefaults *defaults;
    UITapGestureRecognizer *tapRecognizer;
    NSDictionary *response;
    UIView *maskView;
    UIImageView *bgimage;
    int secondsLeft;
    NSTimer *timer;
}

@property (strong, nonatomic) UIWindow *window;
//UI
-(UIView*)UIView:(id)sender withFrame:(CGRect)frame;
-(UIImageView*)UIImage:(id)sender withFrame:(CGRect)frame withImageName:(NSString *)name;
-(UILabel*)UILabel:(id)sender withFrame:(CGRect)frame withText:(NSString *)text withTextSize:(int)size withAlignment:(int)Align withLines:(int)line;
-(UILabel*)UILabelwithWhiteText:(id)sender withFrame:(CGRect)frame withText:(NSString *)text withTextSize:(int)size withAlignment:(int)Align withLines:(int)line;
-(UILabel*)UILabelwithBlackText:(id)sender withFrame:(CGRect)frame withText:(NSString *)text withTextSize:(int)size withAlignment:(int)Align withLines:(int)line;
-(UITextField*)UITextField:(id)sender withFrame:(CGRect)frame withText:(NSString *)text withSize:(int)size withInputType:(UIKeyboardType)input withSecure:(int)sec;
-(UIButton*)UIButton:(id)sender withFrame:(CGRect)frame withTitle:(NSString*)title withTag:(int)tag;
-(UITableView*)UITableView:(id)sender withFrame:(CGRect)frame withStyle:(int)tablestyle;
-(UIPickerView *)UIPickerView:(id)sender withFrame:(CGRect)frame withTag:(NSInteger)tag;
-(UISwitch *)UISwitch:(id)sender withFrame:(CGRect)frame;
-(void)UILine:(id)sender :(CGRect)frame;

//Customize
- (UIScrollView *) ScrollViewWithButton:(int)btn kolom:(int)column baris:(int)row buttonsize:(int)size withx:(int)x withy:(int)y withwidth:(int)lebar withheight:(int)tinggi withimg:(NSArray*)img withlabel:(NSArray*)label;
- (UIScrollView *) ScrollViewWithImage:(NSArray*)img withx:(int)x withy:(int)y withwidth:(int)lebar withheight:(int)tinggi;

- (UIColor *)transparentBlack;
-(UIColor *)colorFromHexString:(NSString *)hexString withAlpha:(CGFloat)alpha;
- (UIView *)showmask;
- (UIViewController*)topViewController;
-(void)GotoPage:(id)sender withIdentifier:(NSString*)Identifier;
-(BOOL)IsValidEmail:(NSString *)checkString;

//Formatter
-(NSString*)FormatNumber:(id)sender from:(NSString*)value;
-(NSString*)FormatDate:(id)sender from:(NSDate*)date withFormat:(NSString*)format;

//Alert
- (void)showAlert:(NSString*)alertMessage title:(NSString*)title btn:(NSString*)btn tag:(int)tag delegate:(id)delegate;
- (void)showAlert2:(NSString*)alertMessage title:(NSString*)title btn1:(NSString*)btn1 btn2:(NSString*)btn2 tag:(int)tag delegate:(id)delegate;

//Networking
-(NSDictionary*)HttpRequest:(id)sender withAction:(NSString*)action withParams:(NSDictionary*)params;
-(void)RequestData:(id)sender withAction:(NSString*)action withParams:(NSDictionary*)params;


//EDITING
- (UITextField *)CustomTextField:(CGRect)frame withStrPlcHolder:(NSString *)strPlcHolder withAttrColor:(NSString *)attrColor keyboardType:(UIKeyboardType)type withTextColor:(NSString *)textColor withFontSize:(CGFloat)fontSize withTag:(int)tag withDelegate:(id)sender withLabel:(BOOL)label;
- (UITextField *)PasswordTextField:(CGRect)frame withStrPlcHolder:(NSString *)strPlcHolder withAttrColor:(NSString *)attrColor keyboardType:(UIKeyboardType)type withTextColor:(NSString *)textColor withFontSize:(CGFloat)fontSize withTag:(int)tag withDelegate:(id)sender;
- (void)required:(id)sender withMsg:(NSString *)msg;
- (void)removeValidationIcon:(id)sender withColor:(NSString *)color;
- (UIButton *)btnPasswordImage:(CGRect)frame withTag:(int)tag;
- (void)requiredPassword:(id)sender withMsg:(NSString *)msg;
- (void)removeValidationIconPassword:(id)sender withColor:(NSString *)color;
- (UIButton *)btnText:(CGRect)frame withTag:(int)tag withTitle:(NSString *)title withFontSize:(int)fontSize withColor:(NSString *)color;
- (UITextField *)TextFieldWithButton:(CGRect)frame withPaddingWidth:(CGFloat)flWidth withStrPlcHolder:(NSString *)strPlcHolder withAttrColor:(NSString *)attrColor keyboardType:(UIKeyboardType)type withTextColor:(NSString *)textColor withFontSize:(CGFloat)fontSize withTag:(int)tag withDelegate:(id)sender;
- (void)requiredTextFieldWithButton:(id)sender withMsg:(NSString *)msg withPaddingWidth:(int)flWidth;
- (void)removeValidationTextFieldWithButton:(id)sender withColor:(NSString *)color withPaddingWidth:(int)flWidth;
-(NSDictionary*)PostJson:(NSDictionary *)dataDictionary withURL:(NSString *)url;
-(NSDictionary*)GetJson:(NSDictionary *)dataDictionary withURL:(NSString *)url;
@end

