//
//  ViewController.m
//  DCAnimationSample
//
//  Created by 廣川政樹 on 2013/05/14.
//  Copyright (c) 2013年 Dolice. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property BOOL isAnimationTargetFadeIn;
@property BOOL isAnimationTargetScaleUp;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //アニメーションフラグを初期化
    _isAnimationTargetFadeIn = NO;
    _isAnimationTargetScaleUp = NO;
}

//フェードアニメーション実行
- (IBAction)startFadeAnimation:(id)sender
{
    DCAnimation *dcAnimation = [[DCAnimation alloc] init];
    dcAnimation.dc_delegate = (id)self;
    //アニメーション秒数とフェードモードを指定
    [dcAnimation fade:self.animationTargetImage
             duration:0.5f
             isFadeIn:_isAnimationTargetFadeIn];
    //フェードインフラグ切り替え
    _isAnimationTargetFadeIn = !_isAnimationTargetFadeIn;
}

//スライドアニメーション実行
- (IBAction)startSlideAnimation:(id)sender
{
    DCAnimation *dcAnimation = [[DCAnimation alloc] init];
    dcAnimation.dc_delegate = (id)self;
    //アニメーション秒数と目標座標・サイズを指定
    [dcAnimation slide:self.animationTargetImage
              duration:0.5f
               aimRect:CGRectMake(64, 64, 57, 57)];
}

//回転アニメーション実行
- (IBAction)startRotateAnimation:(id)sender
{
    DCAnimation *dcAnimation = [[DCAnimation alloc] init];
    dcAnimation.dc_delegate = (id)self;
    //アニメーション秒数と目標回転度数を指定
    [dcAnimation rotate:self.animationTargetImage
               duration:0.5f
               aimAngle:90];
}

- (IBAction)startScaleAnimation:(id)sender
{
    DCAnimation *dcAnimation = [[DCAnimation alloc] init];
    dcAnimation.dc_delegate = (id)self;
    //アニメーション秒数と目標スケール値を指定
    [dcAnimation scale:self.animationTargetImage
              duration:0.5f
              aimScale:2.0f];
}

- (IBAction)startScaleUpDownAnimation:(id)sender
{
    DCAnimation *dcAnimation = [[DCAnimation alloc] init];
    dcAnimation.dc_delegate = (id)self;
    if (_isAnimationTargetScaleUp) {
        //アニメーション秒数を指定
        [dcAnimation scaleDown:self.animationTargetImage
                      duration:0.5f];
    } else {
        //アニメーション秒数とバウンドの有無を指定
        [dcAnimation scaleUp:self.animationTargetImage
                    duration:0.5f
                     isBound:YES];
    }
    //フェードインフラグ切り替え
    _isAnimationTargetScaleUp = !_isAnimationTargetScaleUp;
}

- (IBAction)startTranslateAnimation:(id)sender
{
    DCAnimation *dcAnimation = [[DCAnimation alloc] init];
    dcAnimation.dc_delegate = (id)self;
    //アニメーション秒数とXYの移動量を指定
    [dcAnimation translate:self.animationTargetImage
                  duration:0.5f
              movePosition:100];
}

@end
