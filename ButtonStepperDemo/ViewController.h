//
//  ViewController.h
//  GalleryButtonStyler
//
//  Created by Steve Milano on 3/18/13.
//  Copyright (c) 2013 SEDIFY. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CustomButton.h"

enum StepperID {
    kFontColor = 1,
    kFontOpacity = 2,
    kBorderColor = 3,
    kBorderOpacity = 4,
    kBackgroundColor = 5,
    kBackgroundOpacity = 6,
    kShadowColor = 7,
    kShadowOpacity = 8
    };
@interface ViewController : UIViewController

@property (nonatomic,retain) CustomButton * styledButton;

@property (nonatomic,retain) IBOutlet UIStepper * stpFontColor;
@property (nonatomic,retain) IBOutlet UILabel * lblFontColor;
@property (nonatomic,retain) IBOutlet UIStepper * stpFontOpacity;
@property (nonatomic,retain) IBOutlet UILabel * lblFontOpacity;

@property (nonatomic,retain) IBOutlet UIStepper * stpBorderColor;
@property (nonatomic,retain) IBOutlet UILabel * lblBorderColor;
@property (nonatomic,retain) IBOutlet UIStepper * stpBorderOpacity;
@property (nonatomic,retain) IBOutlet UILabel * lblBorderOpacity;

@property (nonatomic,retain) IBOutlet UIStepper * stpBackgroundColor;
@property (nonatomic,retain) IBOutlet UILabel * lblBackgroundColor;
@property (nonatomic,retain) IBOutlet UIStepper * stpBackgroundOpacity;
@property (nonatomic,retain) IBOutlet UILabel * lblBackgroundOpacity;

@property (nonatomic,retain) IBOutlet UIStepper * stpShadowColor;
@property (nonatomic,retain) IBOutlet UILabel * lblShadowColor;
@property (nonatomic,retain) IBOutlet UIStepper * stpShadowOpacity;
@property (nonatomic,retain) IBOutlet UILabel * lblShadowOpacity;

@property (nonatomic,retain) IBOutlet UIScrollView * scroller;
@property (nonatomic,retain) IBOutlet UIImageView * imageView;
- (IBAction)step:(UIStepper *)sender;

- (void) setup;
- (void) save;
- (IBAction)reset:(UIButton *)sender;

- (void) updateButton;
- (void) updateLabels;
- (void) updateSteppers;
@end
