//
//  ViewController.m
//  GalleryButtonStyler
//
//  Created by Steve Milano on 3/18/13.
//  Copyright (c) 2013 SEDIFY. All rights reserved.
//

#import "ViewController.h"

#define kDefaultFontColorComponent 0.8f
#define kDefaultFontAlphaComponent 1.0f

#define kDefaultBorderColorComponent 0.8f
#define kDefaultBorderAlphaComponent 0.8f

#define kDefaultBackgroundColorComponent 0.35f
#define kDefaultBackgroundAlphaComponent 0.25f

#define kDefaultShadowColor 0.0f
#define kDefaultShadowOpacity 0.2f

@interface ViewController ()


@property(nonatomic,assign) float fontColorComponent;
@property(nonatomic,assign) float fontAlphaComponent;

@property(nonatomic,assign) float borderColorComponent;
@property(nonatomic,assign) float borderAlphaComponent;

@property(nonatomic,assign) float backgroundColorComponent;
@property(nonatomic,assign) float backgroundAlphaComponent;

@property(nonatomic,assign) float shadowColor;
@property(nonatomic,assign) float shadowOpacity;

@end

@implementation ViewController

@synthesize styledButton;

@synthesize lblFontColor, lblFontOpacity,
            lblBorderColor, lblBorderOpacity,
            lblBackgroundColor, lblBackgroundOpacity,
            lblShadowColor, lblShadowOpacity;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    [self setup];

}
-(void) foo{ NSLog(@"I got the tap");}
- (void) setup
{

    UIImageView * anImageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 90, 320, 240)];
    anImageView.image = [UIImage imageNamed:@"woof.jpg"];
    self.scroller.contentSize = CGSizeMake(50+anImageView.frame.size.width, 90+anImageView.frame.size.height);
    [self.scroller addSubview:anImageView];
    self.scroller.userInteractionEnabled = YES;
    self.scroller.scrollEnabled = YES;

    styledButton = [[CustomButton alloc] initWithFrame:CGRectMake(([[UIScreen mainScreen] bounds].size.width - 50)/2.0 , 50, 50, 34)];
    styledButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTPro-BdCn" size:13.0];
    [styledButton setTitle:@"Close" forState:UIControlStateNormal];
    [self.view addSubview:styledButton];

    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];

    self.fontColorComponent = [defaults floatForKey:@"fontColorComponent"] ? roundf([defaults floatForKey:@"fontColorComponent"]*100)/100 : kDefaultFontColorComponent;
    self.fontAlphaComponent = [defaults floatForKey:@"fontAlphaComponent"] ? roundf([defaults floatForKey:@"fontAlphaComponent"]*100)/100 : kDefaultFontAlphaComponent;

    self.borderColorComponent = [defaults floatForKey:@"borderColorComponent"] ? roundf([defaults floatForKey:@"borderColorComponent"]*100)/100 : kDefaultBorderColorComponent;
    self.borderAlphaComponent = [defaults floatForKey:@"borderAlphaComponent"] ? roundf([defaults floatForKey:@"borderAlphaComponent"]*100)/100 : kDefaultBorderAlphaComponent;

    self.backgroundColorComponent = [defaults floatForKey:@"backgroundColorComponent"] ? roundf([defaults floatForKey:@"backgroundColorComponent"]*100)/100 : kDefaultBackgroundColorComponent;
    self.backgroundAlphaComponent = [defaults floatForKey:@"backgroundAlphaComponent"] ? roundf([defaults floatForKey:@"backgroundAlphaComponent"]*100)/100 : kDefaultBackgroundAlphaComponent;

    self.shadowColor = [defaults floatForKey:@"shadowColor"] ? roundf([defaults floatForKey:@"shadowColor"]*100)/100 : kDefaultShadowColor;
    self.shadowOpacity = [defaults floatForKey:@"shadowOpacity"] ? roundf([defaults floatForKey:@"shadowOpacity"]*100)/100 : kDefaultShadowOpacity;

    [self save];
    [self updateButton];
    [self updateLabels];
    [self updateSteppers];
}

- (void) save
{
//    NSLog(@"files for %@ at: %@",NSUserName(),NSHomeDirectory());
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];

    [defaults setFloat:roundf(self.fontColorComponent*100)/100 forKey:@"fontColorComponent"];
    [defaults setFloat:roundf(self.fontAlphaComponent*100)/100 forKey:@"fontAlphaComponent"];

    [defaults setFloat:roundf(self.borderColorComponent*100)/100 forKey:@"borderColorComponent"];
    [defaults setFloat:roundf(self.borderAlphaComponent*100)/100 forKey:@"borderAlphaComponent"];

    [defaults setFloat:roundf(self.backgroundColorComponent*100)/100 forKey:@"backgroundColorComponent"];
    [defaults setFloat:roundf(self.backgroundAlphaComponent*100)/100 forKey:@"backgroundAlphaComponent"];

    [defaults setFloat:roundf(self.shadowColor*100)/100 forKey:@"shadowColor"];
    [defaults setFloat:roundf(self.shadowOpacity*100)/100 forKey:@"shadowOpacity"];

}
- (IBAction)reset:(UIButton *)sender
{
    self.fontColorComponent = kDefaultFontColorComponent;
    self.fontAlphaComponent = kDefaultFontAlphaComponent;

    self.borderColorComponent = kDefaultBorderColorComponent;
    self.borderAlphaComponent = kDefaultBorderAlphaComponent;

    self.backgroundColorComponent = kDefaultBackgroundColorComponent;
    self.backgroundAlphaComponent = kDefaultBackgroundAlphaComponent;

    self.shadowColor = kDefaultShadowColor;
    self.shadowOpacity = kDefaultShadowOpacity;

    self.scroller.contentOffset = CGPointMake(0, 0);

    [self updateLabels];
    [self updateButton];
    [self updateSteppers];
    [self save];
}
- (void) updateLabels
{
    self.lblFontColor.text = [NSString stringWithFormat:@"%0.2f",self.fontColorComponent];
    self.lblFontOpacity.text = [NSString stringWithFormat:@"%0.2f",self.fontAlphaComponent];
    self.lblBorderColor.text = [NSString stringWithFormat:@"%0.2f",self.borderColorComponent];
    self.lblBorderOpacity.text = [NSString stringWithFormat:@"%0.2f",self.borderAlphaComponent];
    self.lblBackgroundColor.text = [NSString stringWithFormat:@"%0.2f",self.backgroundColorComponent];
    self.lblBackgroundOpacity.text = [NSString stringWithFormat:@"%0.2f",self.backgroundAlphaComponent];
    self.lblShadowColor.text = [NSString stringWithFormat:@"%0.2f",self.shadowColor];
    self.lblShadowOpacity.text = [NSString stringWithFormat:@"%0.2f",self.shadowOpacity];
}
- (void) updateSteppers
{
    self.stpFontColor.value = self.fontColorComponent;
    self.stpFontOpacity.value = self.fontAlphaComponent;

    self.stpBorderColor.value = self.borderColorComponent;
    self.stpBorderOpacity.value = self.borderAlphaComponent;

    self.stpBackgroundColor.value = self.backgroundColorComponent;
    self.stpBackgroundOpacity.value = self.backgroundAlphaComponent;

    self.stpShadowColor.value = self.shadowColor;
    self.stpShadowOpacity.value = self.shadowOpacity;
}
- (void) updateButton
{
    styledButton.fontColor = [UIColor colorWithWhite:self.fontColorComponent alpha:self.fontAlphaComponent];
    styledButton.backgroundColor = [UIColor colorWithWhite:self.backgroundColorComponent alpha:self.backgroundAlphaComponent];
    styledButton.borderColor = [UIColor colorWithWhite:self.borderColorComponent alpha:self.borderAlphaComponent];
    styledButton.shadowColor = [UIColor colorWithWhite:self.shadowColor alpha:1.0];
    styledButton.shadowOpacity = self.shadowOpacity;

    [styledButton setNeedsDisplay];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)step:(UIStepper *)sender
{
    switch (sender.tag) {
        case kFontColor:
            self.fontColorComponent = sender.value;
            break;

        case kFontOpacity:
            self.fontAlphaComponent = sender.value;
            break;


        case kBorderColor:
            self.borderColorComponent = sender.value;
            break;


        case kBorderOpacity:
            self.borderAlphaComponent = sender.value;
            break;


        case kBackgroundColor:
            self.backgroundColorComponent = sender.value;
            break;


        case kBackgroundOpacity:
            self.backgroundAlphaComponent = sender.value;
            break;


        case kShadowColor:
            self.shadowColor = sender.value;
            break;

            
        case kShadowOpacity:
            self.shadowOpacity = sender.value;
            break;

        default:
            break;
    }
    [self save];
    [self updateLabels];
    [self updateButton];
}
@end
