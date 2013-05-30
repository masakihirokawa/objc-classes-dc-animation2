//
//  AnimationUtil.m
//  ponta
//
//  Created by 大井裕一 on 13/05/10.
//  Copyright (c) 2013年 dropsystem. All rights reserved.
//

#import "AnimationUtil.h"

@implementation AnimationUtil
@synthesize au_delegate;
@synthesize targetView = _targetView;

#pragma mark initializer
/**
 * 開放
 */
-(void) dealloc {
    self.targetView = nil;
    [super dealloc];
}

#pragma mark Popup anim
/**
 * ポップアップ登場アニメ
 */
-(void) popUpShow:(UIView*)view {
    self.targetView = view;
    self.targetView.transform = CGAffineTransformMakeScale(0.1, 0.1);
    self.targetView.alpha = 0;
    [UIView beginAnimations:ANIM_ID_POP_UP_SHOW context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.25f];
    self.targetView.transform = CGAffineTransformMakeScale(1.05f, 1.05f);
    self.targetView.alpha = 1;
    [UIView commitAnimations];
}

/**
 * ポップアップ消去アニメ
 */
-(void) popUpHide {
    [UIView beginAnimations:ANIM_ID_POP_UP_HIDE context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.25f];
    self.targetView.transform = CGAffineTransformMakeScale(0.1, 0.1);
    self.targetView.alpha = 0;
    [UIView commitAnimations];
}

#pragma mark Animation delegate
-(void) animationDidStop:(NSString*)animationID finished:(NSNumber*)finished context:(void*)context {
    if([animationID isEqualToString:ANIM_ID_POP_UP_SHOW]) {
        if(finished) {
            [UIView beginAnimations:nil context:nil];
            self.targetView.transform = CGAffineTransformMakeScale(1.0, 1.0);
            [UIView commitAnimations];
        }
    }
    else if([animationID isEqualToString:ANIM_ID_POP_UP_HIDE]) {
        if(finished) {
            self.targetView.transform = CGAffineTransformMakeScale(1.0, 1.0);
        }
    }
    
    if(finished) {
        [self.au_delegate animFinish:animationID];
    }
}


@end
