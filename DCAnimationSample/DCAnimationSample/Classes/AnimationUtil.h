//
//  AnimationUtil.h
//  ponta
//
//  Created by 大井裕一 on 13/05/10.
//  Copyright (c) 2013年 dropsystem. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ANIM_ID_POP_UP_SHOW @"popup_show"
#define ANIM_ID_POP_UP_HIDE @"popup_hide"

@protocol AnimationUtilDelegate;

@interface AnimationUtil : NSObject {
    id<AnimationUtilDelegate>   au_delegate;
    UIView                      *_targetView;
}

#pragma mark property prottype
@property (nonatomic, assign) id<AnimationUtilDelegate> au_delegate;
@property (nonatomic, retain) UIView *targetView;

#pragma mark method prottype
-(void) popUpShow:(UIView*)view;
-(void) popUpHide;

@end

@protocol AnimationUtilDelegate <NSObject>
@optional
-(void) animFinish:(NSString*)anim_id;
@end