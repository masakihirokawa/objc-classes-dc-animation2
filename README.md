DCAnimation
==========================

7種類のアニメーションをシンプルな記述で実行する「DCAnimation」クラスです。

このクラスの主な機能は以下の通りです。

##主な機能

1. フェードイン・フェードアウトアニメーション
2. スライドインアニメーション
3. 回転アニメーション
4. 拡大縮小アニメーション
5. 拡大アニメーション (バウンド機能付き)
6. 縮小アニメーション
7. 平行移動アニメーション

##使用方法

###フェードインアニメーションの場合

```objective-c
    //初期化
    DCAnimation *dcAnimation = [[DCAnimation alloc] init];
    //アニメーション秒数とフェードモードを指定
    [dcAnimation fade:self.animationTargetImage
             duration:0.5f
             isFadeIn:YES];
```

###スライドアニメーションの場合

```objective-c
    //初期化
    DCAnimation *dcAnimation = [[DCAnimation alloc] init];
    //アニメーション秒数と目標座標・サイズを指定
    [dcAnimation slide:self.animationTargetImage
              duration:0.5f
               aimRect:CGRectMake(64, 64, 57, 57)];
```

##サンプルソースコード

```objective-c
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
```
