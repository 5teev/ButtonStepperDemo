//
//  CustomButton.h
//  PlanetX
//

#import <UIKit/UIKit.h>

@interface CustomButton : UIButton

@property(nonatomic,strong) UIColor * backgroundColor;
@property(nonatomic,strong) UIColor * borderColor;
@property(nonatomic,strong) UIColor * fontColor;
@property(nonatomic,strong) UIColor * shadowColor;
@property(nonatomic,assign) float shadowOpacity;

-(void)drawWhiteRect:(CGRect)rect;

@end
