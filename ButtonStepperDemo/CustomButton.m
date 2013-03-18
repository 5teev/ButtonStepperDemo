//
//  CustomButton.m
//  ButtonStepperDemo
//

#import "CustomButton.h"

#import <QuartzCore/QuartzCore.h>

@implementation CustomButton
@synthesize fontColor, borderColor, backgroundColor;
@synthesize shadowOpacity,shadowColor;

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self addObserver:self forKeyPath:@"highlighted" options:NSKeyValueObservingOptionNew context:NULL];
        self.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTPro-BdCn" size:12.0];
        [self setTitleEdgeInsets:UIEdgeInsetsMake(7.0, 1.5, 0.0, 0.0)];
        shadowOpacity = 0.2;

    }
    
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    
    [self drawWhiteRect:rect];
}

-(void)drawWhiteRect:(CGRect)rect{
    
    // Do custom drawing for normal state
    [self.layer setCornerRadius:3.0];
    [self.layer setMasksToBounds:NO];
    [self.layer setBorderWidth:1.0];
    [self.layer setBorderColor: [self.borderColor CGColor]];
    [self.layer setBackgroundColor:[self.backgroundColor CGColor]];
    
    self.titleLabel.textColor = self.fontColor;
    
    //    ADD BUTTTON SHADOW
    self.layer.shadowColor = [self.shadowColor  CGColor];
    self.layer.shadowOffset = CGSizeMake(0.0, 1.0);
    self.layer.shadowOpacity = self.shadowOpacity;
    self.layer.shadowRadius = 3.0;
    
    
}



@end
