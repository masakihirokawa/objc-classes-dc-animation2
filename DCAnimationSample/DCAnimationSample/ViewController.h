//
//  ViewController.h
//  DCAnimationSample
//
//  Created by 廣川政樹 on 2013/05/14.
//  Copyright (c) 2013年 Dolice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DCAnimation.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *animationTargetImage;
                                
- (IBAction)startFadeAnimation:(id)sender;
- (IBAction)startSlideAnimation:(id)sender;
- (IBAction)startRotateAnimation:(id)sender;
- (IBAction)startScaleAnimation:(id)sender;
- (IBAction)startScaleUpDownAnimation:(id)sender;
- (IBAction)startTranslateAnimation:(id)sender;

@end
