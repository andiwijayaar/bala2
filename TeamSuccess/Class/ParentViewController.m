//
//  ViewController.m
//
//  Created by MC on 6/19/15.
//

#import "ParentViewController.h"
#import "Login.h"


@interface ParentViewController ()

@end

@implementation ParentViewController
{
    UIPickerView *picker;
    UIAlertView *alert;
    UIViewController *viewController;
}
@synthesize window;

- (void)viewDidLoad {
    [super viewDidLoad];
    defaults = [NSUserDefaults standardUserDefaults];
    //background image
    bgimage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [self view].bounds.size.width, [self view].bounds.size.height)];
//    [bgimage setImage:[UIImage imageNamed:@"Background"]];
    [bgimage setBackgroundColor:[self colorFromHexString:@"#E12929" withAlpha:1.0]];
    [[self view] addSubview:bgimage];
    
    //Gradient background
//    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
//    gradientLayer.frame = CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height-20);
//    gradientLayer.colors = [NSArray arrayWithObjects:
//                            (id)[self colorFromHexString:@"#30D2AC" withAlpha:1.0].CGColor,
//                            (id)[self colorFromHexString:@"#3273FA" withAlpha:1.0].CGColor,
//                            nil];
//    gradientLayer.locations = [NSArray arrayWithObjects:
//                               [NSNumber numberWithFloat:0.0f],
//                               [NSNumber numberWithFloat:1.0f],
//                               nil];
//    gradientLayer.cornerRadius = self.view.layer.cornerRadius;
//    [self.view.layer addSublayer:gradientLayer];
    
    //Gesture hide keyboard
    tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(respondToTapGesture)];
//    [self.view addGestureRecognizer:tapRecognizer];
    
    //Navigation Property
//    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    
//    [[[self navigationController] navigationBar] setBarTintColor:[self colorFromHexString:@"#FFFFFF" withAlpha:1.0]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    //Hilangkan Back string
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
//    [[[self navigationItem] backBarButtonItem] setTintColor:[UIColor blackColor]];
    [[[self navigationController] navigationBar] setTintColor:[UIColor whiteColor]];
//    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    //disable back when swipe
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    //dismis alertview when enter background
    [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationWillResignActiveNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification* notification){
        [alert dismissWithClickedButtonIndex:0 animated:NO];
    }];
}

-(void)viewWillAppear:(BOOL)animated {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIView*)UIView:(id)sender withFrame:(CGRect)frame {
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = [self colorFromHexString:@"#FAFAFA" withAlpha:1.0];
    return view;
}

-(UIImageView*)UIImage:(id)sender withFrame:(CGRect)frame withImageName:(NSString *)name  {
    UIImageView *img = [[UIImageView alloc] init];
    img.frame = frame;
    img.image = [UIImage imageNamed:name];
    img.backgroundColor = [UIColor clearColor];
    return img;
}

-(UILabel*)UILabel:(id)sender withFrame:(CGRect)frame withText:(NSString *)text withTextSize:(int)size withAlignment:(int)Align withLines:(int)line {
    UILabel *lbl = [[UILabel alloc] initWithFrame:frame];
    lbl.text = text;
    lbl.textColor = [self colorFromHexString:@"#00A4BB" withAlpha:1.0];
    lbl.font = [UIFont systemFontOfSize:size];
    lbl.textAlignment = Align == 0 ? NSTextAlignmentLeft : Align == 1 ? NSTextAlignmentCenter : NSTextAlignmentRight;
    lbl.lineBreakMode = NSLineBreakByWordWrapping;
    lbl.numberOfLines = line;
    return lbl;
}

-(UILabel*)UILabelwithWhiteText:(id)sender withFrame:(CGRect)frame withText:(NSString *)text withTextSize:(int)size withAlignment:(int)Align withLines:(int)line {
    UILabel *lbl = [[UILabel alloc] initWithFrame:frame];
    lbl.text = text;
    lbl.textColor = [UIColor whiteColor];
    lbl.font = [UIFont boldSystemFontOfSize:size];
    lbl.textAlignment = Align == 0 ? NSTextAlignmentLeft : Align == 1 ? NSTextAlignmentCenter : NSTextAlignmentRight;
    lbl.lineBreakMode = NSLineBreakByWordWrapping;
    lbl.numberOfLines = line;
    return lbl;
}

-(UILabel*)UILabelwithBlackText:(id)sender withFrame:(CGRect)frame withText:(NSString *)text withTextSize:(int)size withAlignment:(int)Align withLines:(int)line {
    UILabel *lbl = [[UILabel alloc] initWithFrame:frame];
    lbl.text = text;
    lbl.textColor = [UIColor blackColor];
    lbl.font = [UIFont boldSystemFontOfSize:size];
    lbl.textAlignment = Align == 0 ? NSTextAlignmentLeft : Align == 1 ? NSTextAlignmentCenter : NSTextAlignmentRight;
    lbl.lineBreakMode = NSLineBreakByWordWrapping;
    lbl.numberOfLines = line;
    return lbl;
}

-(UITextField*)UITextField:(id)sender withFrame:(CGRect)frame withText:(NSString *)text withSize:(int)size withInputType:(UIKeyboardType)input withSecure:(int)sec {
    UITextField *txt = [[UITextField alloc] initWithFrame:frame];
    txt.borderStyle = UITextBorderStyleRoundedRect;
    txt.attributedPlaceholder = [[NSAttributedString alloc]
                                 initWithString:text
                                 attributes:@{NSForegroundColorAttributeName:[self colorFromHexString:@"#CACACA" withAlpha:1.0]}];
    txt.textColor = [self colorFromHexString:@"#6E6E6E" withAlpha:1.0];
    txt.font = [UIFont systemFontOfSize:size];
    txt.keyboardType = input;
    txt.secureTextEntry = sec == 1 ? YES : NO;
    txt.backgroundColor = [UIColor clearColor];
    txt.delegate = sender;
    return txt;
}

-(UIButton*)UIButton:(id)sender withFrame:(CGRect)frame withTitle:(NSString*)title withTag:(int)tag {
    UIButton *btn = [[UIButton alloc] initWithFrame:frame];
    //    [btn setImage:[UIImage imageNamed:@"Back-Button"] forState:UIControlStateNormal];
    [[btn layer] setBorderWidth:1.0];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(Act:) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundColor:[UIColor whiteColor]];
    [btn setTag:tag];
    return btn;
}

-(UITableView*)UITableView:(id)sender withFrame:(CGRect)frame withStyle:(int)tablestyle {
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:tablestyle == 0 ? UITableViewStylePlain : UITableViewStyleGrouped];
    [tableView setDelegate:sender];
    [tableView setDataSource:sender];
    [tableView setBackgroundColor:[UIColor whiteColor]];
    return tableView;
}

-(UIPickerView *)UIPickerView:(id)sender withFrame:(CGRect)frame withTag:(NSInteger)tag {
    picker = [[UIPickerView alloc] initWithFrame:frame];
    [picker setShowsSelectionIndicator:YES];
    [picker setDataSource:sender];
    [picker setDelegate:sender];
    [picker setTag:tag];
//    [picker setBackgroundColor:[UIColor whiteColor]];
    
    return picker;
}

-(UISwitch *)UISwitch:(id)sender withFrame:(CGRect)frame {
    UISwitch *switcher = [[UISwitch alloc] initWithFrame:frame];
    [switcher setOn:YES];
    [switcher setTag:99];
    [switcher addTarget:self
                      action:@selector(Act:)
            forControlEvents:UIControlEventValueChanged];
    return switcher;
}

-(UIScrollView *) ScrollViewWithButton:(int)btn kolom:(int)column baris:(int)row buttonsize:(int)size withx:(int)x withy:(int)y withwidth:(int)lebar withheight:(int)tinggi withimg:(NSArray*)img withlabel:(NSArray*)label {
    int page = 0;
    int currpage = 0;
    int currrow = 1;
    int nextpadleft = (lebar-(size*column))/(column+1);
    int nextpadtop = (tinggi-(size*row))/(row+1);
    if (btn % (column * row) == 0) {
        page = btn/(column*row);
    }
    else
    {
        page = (btn/(column*row))+1;
    }
    
    UIScrollView *scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(x, y, lebar, tinggi)];
    scrollview.pagingEnabled = YES;
    scrollview.backgroundColor = [UIColor clearColor];
    scrollview.contentSize = CGSizeMake(lebar*page, tinggi);
    
    for (int i = 1; i <= btn; i++) {
        UIButton *t = [[UIButton alloc] initWithFrame:CGRectMake(nextpadleft, nextpadtop, size, size)];
        [t setBackgroundImage:[UIImage imageNamed:[img objectAtIndex:i-1]] forState:UIControlStateNormal];
        [t addTarget:self action:@selector(Act:) forControlEvents:UIControlEventTouchUpInside];
        [t setBackgroundColor:[UIColor clearColor]];
        [t setTag:i];
        [scrollview addSubview:t];
        
        UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(nextpadleft, nextpadtop+size, size, 30)];
        [label1 setTextColor:[UIColor whiteColor]];
        [label1 setBackgroundColor:[UIColor clearColor]];
        [label1 setTextAlignment:NSTextAlignmentCenter];
        [label1 setText:[label objectAtIndex:i-1]];
        [label1 setFont:[UIFont boldSystemFontOfSize:12]];
        label1.numberOfLines = 0;
        [label1 sizeToFit];
        [scrollview addSubview:label1];
        
        if (i % (column*row) == 0) {
            currpage = currpage + 1;
            nextpadtop = (tinggi-(size*row))/(row+1);
            nextpadleft = (lebar-(size*column))/(column+1)+(lebar*currpage);
            currrow = 1;
        }
        else if(i % column == 0) {
            currrow = currrow + 1;
            nextpadtop = (((tinggi-(size*row))/(row+1))*currrow)+(size*(currrow-1));
            nextpadleft = (lebar-(size*column))/(column+1)+(lebar*currpage);
        }
        else
        {
            nextpadleft = nextpadleft + (lebar-(size*column))/(column+1) + size;
        }
    }
    
    return scrollview;
}

-(UIScrollView *) ScrollViewWithImage:(NSArray*)img withx:(int)x withy:(int)y withwidth:(int)lebar withheight:(int)tinggi {
    if (img == nil) {
        return 0;
    }
    int currpage = 0;
    int nextpadleft = 0;
    
    UIScrollView *scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(x, y, lebar, tinggi)];
    scrollview.pagingEnabled = YES;
    scrollview.backgroundColor = [UIColor clearColor];
    scrollview.contentSize = CGSizeMake(lebar*[img count], tinggi);
    
    for (int i = 0; i < [img count]; i++) {
        UIImageView *promoimage = [[UIImageView alloc] init];
        promoimage.frame = CGRectMake(nextpadleft, 0, lebar, tinggi);
        promoimage.image = [UIImage imageWithData:[[NSData alloc] initWithBase64EncodedString:[[img objectAtIndex:i] objectForKey:@"imageData"] options:0]];
        promoimage.backgroundColor = [UIColor clearColor];
        [scrollview addSubview:promoimage];
        
        currpage = currpage + 1;
        nextpadleft = lebar*currpage;
    }
    
    return scrollview;
}

- (void)Act:(id)sender {
}

-(void)BackBtn {
}

- (UIColor *)transparentBlack {
    return [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5];
}

-(UIColor *)colorFromHexString:(NSString *)hexString withAlpha:(CGFloat)alpha {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:alpha];
}

- (UIView *)showmask {
    maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [self view].bounds.size.width, [self view].bounds.size.height)];
    [maskView setBackgroundColor:[self transparentBlack]];
    
//    UIImageView* animatedImageView = [[UIImageView alloc] initWithFrame:CGRectMake((([self view].bounds.size.width/2)-25), ([self view].bounds.size.height/2)-25, 50, 50)];
//    NSURL *url = [[NSBundle mainBundle] URLForResource:@"test" withExtension:@"gif"];
//    animatedImageView.image = [UIImage animatedImageWithAnimatedGIFURL:url];
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    indicator.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
    indicator.center = maskView.center;
    [indicator startAnimating];
    [maskView addSubview: indicator];
    
    [maskView addSubview:[self UILabelwithWhiteText:self withFrame:CGRectMake(0, (maskView.frame.size.height/2)+20, maskView.frame.size.width, 20) withText:@"Loading" withTextSize:16 withAlignment:1 withLines:0]];
    
    return maskView;
}

-(NSString*)FormatNumber:(id)sender from:(NSString*)value {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    return [formatter stringFromNumber:@([value intValue])];
}

-(NSString*)FormatDate:(id)sender from:(NSDate*)date withFormat:(NSString*)format {
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = format;
    return [dateFormatter stringFromDate:date];
}

-(void)UILine:(id)sender :(CGRect)frame {
    UIView *line = [[UIView alloc] initWithFrame:frame];
    line.backgroundColor = [self colorFromHexString:@"#6E6E6E" withAlpha:1.0];
    [[self view] addSubview:line];
}

- (UIViewController*)topViewController {
    return [self topViewControllerWithRootViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
}

- (UIViewController*)topViewControllerWithRootViewController:(UIViewController*)rootViewController {
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController* tabBarController = (UITabBarController*)rootViewController;
        return [self topViewControllerWithRootViewController:tabBarController.selectedViewController];
    } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController* navigationController = (UINavigationController*)rootViewController;
        return [self topViewControllerWithRootViewController:navigationController.visibleViewController];
    } else if (rootViewController.presentedViewController) {
        UIViewController* presentedViewController = rootViewController.presentedViewController;
        return [self topViewControllerWithRootViewController:presentedViewController];
    } else {
        return rootViewController;
    }
}

-(void)GotoPage:(id)sender withIdentifier:(NSString*)Identifier {
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    viewController = [storyboard instantiateViewControllerWithIdentifier:Identifier];
    
    self.window.rootViewController = viewController;
    [self.window makeKeyAndVisible];
}

-(BOOL)IsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = YES;
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

#pragma mark - Alert
- (void)showAlert:(NSString*)alertMessage title:(NSString*)title btn:(NSString*)btn tag:(int)tag delegate:(id)delegate {
    dispatch_async(dispatch_get_main_queue(), ^{
        alert = [[UIAlertView alloc]initWithTitle:title
                                                       message:alertMessage
                                                      delegate:delegate
                                             cancelButtonTitle:btn
                                             otherButtonTitles:nil];
        if (tag > 0) [alert setTag:tag];
        [alert show];
    });
}

- (void)showAlert2:(NSString*)alertMessage title:(NSString*)title btn1:(NSString*)btn1 btn2:(NSString*)btn2 tag:(int)tag delegate:(id)delegate {
    alert = [[UIAlertView alloc]initWithTitle:title
                                                   message:alertMessage
                                                  delegate:delegate
                                         cancelButtonTitle:btn1
                                         otherButtonTitles:btn2, nil];
    if (tag > 0) [alert setTag:tag];
    [alert show];
}

-(void)respondToTapGesture {
    [[self view] endEditing:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - Segue Delegate
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [self respondToTapGesture];
}

#pragma mark - Networking
-(NSDictionary*)HttpRequest:(id)sender withAction:(NSString*)action withParams:(NSDictionary*)params {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://rootapa.com/rjuang/%@.php", @"api_test"]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLResponse *response;
    NSError *error;
    //send it synchronous
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSData *data = [responseString dataUsingEncoding:NSUTF8StringEncoding];
    id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    // check for an error. If there is a network error, you should handle it here.
    if(!error)
    {
        //log response
        NSLog(@"Response from server = %@", responseString);
    }
    NSLog(@"%@", json);

    
    return json;
}

-(void)RequestData:(id)sender withAction:(NSString*)action withParams:(NSDictionary*)params {
    @try {
        if(params == nil) {
            params = [NSDictionary dictionary];
        }
        if ([[defaults objectForKey:@"StatusLogin"] isEqualToString:@"Y"]) {
//            response = (NSDictionary*) [PMNetworking synchronousSendToServerWithAction:@"ValidateMobile" andData:[NSDictionary dictionaryWithObjectsAndKeys:DEVICETOKEN, @"deviceToken", nil]];
            NSLog(@"Validate Mobile = %@", response);
            if (response == nil) {
                [maskView removeFromSuperview];
                [self showAlert:MSGResponseNil title:@"warning" btn:@"ok" tag:0 delegate:self];
            }
            else if([[response objectForKey:@"ok"] intValue] == 1)
            {
                if ([[[response objectForKey:@"params"] objectForKey:@"status"] isEqualToString:@"false"]) {
                    [defaults setObject:@"N" forKey:@"StatusLogin"];
                    [defaults setObject:@"TimeOut" forKey:@"SessionTimeOut"];
                    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                    Login *myVC = (Login *)[storyboard instantiateViewControllerWithIdentifier:@"RootLogin"];
                    [[self navigationController] presentViewController:myVC animated:NO completion:nil];
                } else if([[[response objectForKey:@"params"] objectForKey:@"status"] isEqualToString:@"true"]) {
                    NSLog(@"%@", params);
//                    response = (NSDictionary*) [PMNetworking synchronousSendToServerWithAction:action andData:params];
                }
            }
            else if([[response objectForKey:@"logout"] intValue] == 1)
            {
                [defaults setObject:@"N" forKey:@"StatusLogin"];
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                Login *myVC = (Login *)[storyboard instantiateViewControllerWithIdentifier:@"RootLogin"];
                [[self navigationController] presentViewController:myVC animated:NO completion:nil];
            }
            else
            {
                [maskView removeFromSuperview];
                [self showAlert:[response objectForKey:@"message"] title:@"message" btn:@"ok" tag:0 delegate:self];
            }
        }
        else {
//            response = (NSDictionary*) [PMNetworking synchronousSendToServerWithAction:action andData:params];
        }
        
    } @catch (NSException *exception) {
        NSLog(@"exception %@", exception);
//        [self showAlert:[NSString stringWithFormat:@"%@", exception] title:@"Warning!" tag:0 delegate:self];
    }
}

/*========================================================EDITING=====================================================*/

- (UITextField *)CustomTextField:(CGRect)frame withStrPlcHolder:(NSString *)strPlcHolder withAttrColor:(NSString *)attrColor keyboardType:(UIKeyboardType)type withTextColor:(NSString *)textColor withFontSize:(CGFloat)fontSize withTag:(int)tag withDelegate:(id)sender withLabel:(BOOL)label{
    UIColor *color = [self colorFromHexString:@"#CACACA" withAlpha:1.0];
    UIColor *txtColor = [self colorFromHexString:@"#6E6E6E" withAlpha:1.0];
    if(attrColor != nil){
        color = [self colorFromHexString:attrColor withAlpha:1.0];
    }
    
    if(textColor != nil){
        txtColor = [self colorFromHexString:textColor withAlpha:1.0];
    }
    
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:strPlcHolder attributes:@{NSForegroundColorAttributeName: color}];
    [textField setTextColor:txtColor];
    [textField setKeyboardType:type];
    
    [textField setFont:[UIFont systemFontOfSize:fontSize]];
    [textField setSpellCheckingType:UITextSpellCheckingTypeNo];
    [textField setAutocorrectionType:UITextAutocorrectionTypeNo];
    [textField setTag:tag];
    [textField setDelegate:sender];
    
    CALayer *newLayer = [CALayer layer];
    
    CGFloat flHeight = textField.frame.size.height;
    CGFloat flWidth = textField.frame.size.width;
    newLayer.frame = CGRectMake(0, flHeight-5, flWidth, 1);
    newLayer.backgroundColor = [txtColor CGColor];
    newLayer.name = @"bottomLayer";
    
    [[textField layer] addSublayer:newLayer];
    
    if(label){
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, -20, frame.size.width, 40)];
        [lbl setText:strPlcHolder];
        [lbl setTextColor:[self colorFromHexString:@"#999999" withAlpha:1.0]];
        [lbl setFont:[UIFont systemFontOfSize:12]];
        
        [textField addSubview:lbl];
    }
    return textField;
}

- (UITextField *)PasswordTextField:(CGRect)frame withStrPlcHolder:(NSString *)strPlcHolder withAttrColor:(NSString *)attrColor keyboardType:(UIKeyboardType)type withTextColor:(NSString *)textColor withFontSize:(CGFloat)fontSize withTag:(int)tag withDelegate:(id)sender{
    UIColor *color = [self colorFromHexString:@"#CACACA" withAlpha:1.0];
    UIColor *txtColor = [self colorFromHexString:@"#6E6E6E" withAlpha:1.0];
    if(attrColor != nil){
        color = [self colorFromHexString:attrColor withAlpha:1.0];
    }
    
    if(textColor != nil){
        txtColor = [self colorFromHexString:textColor withAlpha:1.0];
    }
    
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:strPlcHolder attributes:@{NSForegroundColorAttributeName: color}];
    [textField setTextColor:txtColor];
    [textField setKeyboardType:type];
    
    [textField setFont:[UIFont systemFontOfSize:fontSize]];
    [textField setSpellCheckingType:UITextSpellCheckingTypeNo];
    [textField setAutocorrectionType:UITextAutocorrectionTypeNo];
    [textField setTag:tag];
    [textField setDelegate:sender];
    
    [textField setSecureTextEntry:true];
    
    
    CALayer *newLayer = [CALayer layer];
    
    CGFloat flHeight = textField.frame.size.height;
    CGFloat flWidth = textField.frame.size.width;
    newLayer.frame = CGRectMake(0, flHeight - 5, flWidth, 1.5);
    newLayer.backgroundColor = [txtColor CGColor];
    newLayer.name = @"bottomLayer";
    
    [[textField layer] addSublayer:newLayer];
    return textField;
}

- (void)required:(id)sender withMsg:(NSString *)msg{
    if([[[[[sender layer] sublayers] objectAtIndex:0] name] isEqualToString:@"bottomLayer"]){
        [self removeValidationIcon:sender withColor:nil];
        CALayer *newLayer = [CALayer layer];
        
        CGFloat flHeight = [sender frame].size.height;
        CGFloat flWidth = [sender frame].size.width;
        newLayer.frame = CGRectMake(0, flHeight - 10, flWidth, 1);
        newLayer.backgroundColor = [UIColor redColor].CGColor;
        newLayer.name = @"bottomLayer";
        
        [[sender layer] replaceSublayer:[[[sender layer] sublayers] objectAtIndex:0] with:newLayer];
        if(msg != nil){
            [self advValidation:sender withText:[NSString stringWithFormat:msg, [sender placeholder]]];
        }else{
            [self advValidation:sender withText:[NSString stringWithFormat:@"%@ %@", [sender placeholder], @"wajib diisi!"]];
        }
    }
}

- (void)requiredPassword:(id)sender withMsg:(NSString *)msg{
    if([[[[[sender layer] sublayers] objectAtIndex:0] name] isEqualToString:@"bottomLayer"]){
        [self removeValidationIconPassword:sender withColor:nil];
        CALayer *newLayer = [CALayer layer];
        
        CGFloat flHeight = [sender frame].size.height;
        CGFloat flWidth = [sender frame].size.width + 30;
        newLayer.frame = CGRectMake(0, flHeight - 10, flWidth, 1);
        newLayer.backgroundColor = [UIColor redColor].CGColor;
        newLayer.name = @"bottomLayer";
        
        [[sender layer] replaceSublayer:[[[sender layer] sublayers] objectAtIndex:0] with:newLayer];
        
        [[sender layer] replaceSublayer:[[[sender layer] sublayers] objectAtIndex:0] with:newLayer];
        if(msg != nil){
            [self advValidation:sender withText:[NSString stringWithFormat:msg, [sender placeholder]]];
        }else{
            [self advValidation:sender withText:[NSString stringWithFormat:@"%@ %@", [sender placeholder], @"isRequired"]];
        }
    }
}

- (void)removeValidationIcon:(id)sender withColor:(NSString *)color{
    if([[[[[sender layer] sublayers] objectAtIndex:0] name] isEqualToString:@"bottomLayer"]){
        for (UITextView *v in [sender subviews]) {
            if(v.tag == 202020){
                [v removeFromSuperview];
            }
        }
        
        UIColor *attrColor = [self colorFromHexString:@"#6E6E6E" withAlpha:1.0];
        
        if(color != nil){
            attrColor = [self colorFromHexString:color withAlpha:1.0];
        }
        
        CALayer *newLayer = [CALayer layer];
        
        CGFloat flHeight = [sender frame].size.height;
        CGFloat flWidth = [sender frame].size.width;
        newLayer.frame = CGRectMake(0, flHeight - 10, flWidth, 1);
        newLayer.backgroundColor = [attrColor CGColor];
        newLayer.name = @"bottomLayer";
        
        [[sender layer] replaceSublayer:[[[sender layer] sublayers] objectAtIndex:0] with:newLayer];
    }
}
- (void)removeValidationIconPassword:(id)sender withColor:(NSString *)color{
    if([[[[[sender layer] sublayers] objectAtIndex:0] name] isEqualToString:@"bottomLayer"]){
        for (UITextView *v in [sender subviews]) {
            if(v.tag == 202020){
                [v removeFromSuperview];
            }
        }
        UIColor *attrColor = [self colorFromHexString:@"#6E6E6E" withAlpha:1.0];
        
        if(color != nil){
            attrColor = [self colorFromHexString:color withAlpha:1.0];
        }
        
        CALayer *newLayer = [CALayer layer];
        
        CGFloat flHeight = [sender frame].size.height;
        CGFloat flWidth = [sender frame].size.width + 30;
        newLayer.frame = CGRectMake(0, flHeight - 10, flWidth, 1);
        newLayer.backgroundColor = [attrColor CGColor];
        newLayer.name = @"bottomLayer";
        
        [[sender layer] replaceSublayer:[[[sender layer] sublayers] objectAtIndex:0] with:newLayer];
    }
}

- (void)advValidation:(UITextField*)sender withText:(NSString*)text{
    if([[[[[sender layer] sublayers] objectAtIndex:0] name] isEqualToString:@"bottomLayer"]){
        UILabel *adv = [[UILabel alloc] initWithFrame:CGRectMake(0, sender.frame.size.height - 5, sender.frame.size.width, 10)];
        [adv setText:text];
        [adv setTextColor:[UIColor redColor]];
        [adv setFont:[UIFont systemFontOfSize:9]];
        [adv setBackgroundColor:[UIColor clearColor]];
        [adv setTag:202020];
        [sender addSubview:adv];
    }
}

- (UIButton *)btnPasswordImage:(CGRect)frame withTag:(int)tag{
    UIButton *btn = [[UIButton alloc] initWithFrame:frame];
    [btn addTarget:self action:@selector(Act:) forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:@"passopen.png"] forState:UIControlStateNormal];
    [btn setTag:tag];
    
    return btn;
}

- (UITextField *)TextFieldWithButton:(CGRect)frame withPaddingWidth:(CGFloat)flWidth withStrPlcHolder:(NSString *)strPlcHolder withAttrColor:(NSString *)attrColor keyboardType:(UIKeyboardType)type withTextColor:(NSString *)textColor withFontSize:(CGFloat)fontSize withTag:(int)tag withDelegate:(id)sender{
    UIColor *color = [self colorFromHexString:@"#CACACA" withAlpha:1.0];
    UIColor *txtColor = [self colorFromHexString:@"#6E6E6E" withAlpha:1.0];
    if(attrColor != nil){
        color = [self colorFromHexString:attrColor withAlpha:1.0];
    }
    
    if(textColor != nil){
        txtColor = [self colorFromHexString:textColor withAlpha:1.0];
    }
    
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:strPlcHolder attributes:@{NSForegroundColorAttributeName: color}];
    [textField setTextColor:txtColor];
    [textField setKeyboardType:type];
    
    [textField setFont:[UIFont systemFontOfSize:fontSize]];
    [textField setSpellCheckingType:UITextSpellCheckingTypeNo];
    [textField setAutocorrectionType:UITextAutocorrectionTypeNo];
    [textField setTag:tag];
    [textField setDelegate:sender];
    
    CALayer *newLayer = [CALayer layer];
    
    CGFloat flHeight = textField.frame.size.height;
    newLayer.frame = CGRectMake(0, flHeight - 10, flWidth, 1);
    newLayer.backgroundColor = [txtColor CGColor];
    newLayer.name = @"bottomLayer";
    
    [[textField layer] addSublayer:newLayer];
    return textField;
}

- (UIButton *)btnText:(CGRect)frame withTag:(int)tag withTitle:(NSString *)title withFontSize:(int)fontSize withColor:(NSString *)color{
    UIButton *btn = [[UIButton alloc] initWithFrame:frame];
    [btn addTarget:self action:@selector(Act:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTag:tag];
    [btn setTitle:title forState:UIControlStateNormal];
    
    UIColor *clr = [self colorFromHexString:@"#14CD9A" withAlpha:1.0];
    if(color != nil){
        clr = [self colorFromHexString:color withAlpha:1.0];
    }
    
    [btn setTitleColor:clr forState:UIControlStateNormal];
    [[btn titleLabel] setFont:[UIFont systemFontOfSize:fontSize]];
    
    return btn;
}

- (void)requiredTextFieldWithButton:(id)sender withMsg:(NSString *)msg withPaddingWidth:(int)flWidth{
    if([[[[[sender layer] sublayers] objectAtIndex:0] name] isEqualToString:@"bottomLayer"]){
        [self removeValidationTextFieldWithButton:sender withColor:nil withPaddingWidth:flWidth];
        CALayer *newLayer = [CALayer layer];
        
        CGFloat flHeight = [sender frame].size.height;
        newLayer.frame = CGRectMake(0, flHeight -10, flWidth, 1);
        newLayer.backgroundColor = [UIColor redColor].CGColor;
        newLayer.name = @"bottomLayer";
        
        [[sender layer] replaceSublayer:[[[sender layer] sublayers] objectAtIndex:0] with:newLayer];
        
        [[sender layer] replaceSublayer:[[[sender layer] sublayers] objectAtIndex:0] with:newLayer];
        if(msg != nil){
            [self advValidation:sender withText:[NSString stringWithFormat:msg, [sender placeholder]]];
        }else{
            [self advValidation:sender withText:[NSString stringWithFormat:@"%@ %@", [sender placeholder], @"isRequired"]];
        }
    }
}

- (void)removeValidationTextFieldWithButton:(id)sender withColor:(NSString *)color withPaddingWidth:(int)flWidth{
    if([[[[[sender layer] sublayers] objectAtIndex:0] name] isEqualToString:@"bottomLayer"]){
        for (UITextView *v in [sender subviews]) {
            if(v.tag == 202020){
                [v removeFromSuperview];
            }
        }
        UIColor *attrColor = [self colorFromHexString:@"#6E6E6E" withAlpha:1.0];
        
        if(color != nil){
            attrColor = [self colorFromHexString:color withAlpha:1.0];
        }
        
        CALayer *newLayer = [CALayer layer];
        
        CGFloat flHeight = [sender frame].size.height;
        newLayer.frame = CGRectMake(0, flHeight -10, flWidth, 1);
        newLayer.backgroundColor = [attrColor CGColor];
        newLayer.name = @"bottomLayer";
        
        [[sender layer] replaceSublayer:[[[sender layer] sublayers] objectAtIndex:0] with:newLayer];
    }
}

-(NSDictionary*)PostJson:(NSDictionary *)dataDictionary withURL:(NSString *)url {
//    NSDictionary *userDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:@"first title", @"title",@"1",@"blog_id", nil];//if your json structure is something like {"title":"first title","blog_id":"1"}
//
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSError *error = nil;
    NSDictionary *result = [manager syncPOST:url
                           parameters:dataDictionary != nil ? dataDictionary : nil
                            operation:NULL
                                error:&error];
    return result;
}

-(NSDictionary*)GetJson:(NSDictionary *)dataDictionary withURL:(NSString *)url {
    //    NSDictionary *userDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:@"first title", @"title",@"1",@"blog_id", nil];//if your json structure is something like {"title":"first title","blog_id":"1"}
    //
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSError *error = nil;
    NSDictionary *result = [manager syncGET:url
                                  parameters:dataDictionary != nil ? dataDictionary : nil
                                   operation:NULL
                                       error:&error];
    return result;
}

@end
