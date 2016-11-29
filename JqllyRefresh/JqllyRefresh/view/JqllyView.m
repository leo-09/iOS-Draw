//
//  JqllyView.m
//  JqllyRefresh
//
//  Created by liyy on 16/11/29.
//  Copyright © 2016年 liyy. All rights reserved.
//

#import "JqllyView.h"

#define DEVICE_WIDTH    ([[UIScreen mainScreen] bounds].size.width)                  // 屏幕宽度
#define DEVICE_HEIGHT   ([[UIScreen mainScreen] bounds].size.height)                 // 屏幕长度
#define MIN_HEIGHT          100                                                          // 图形最小高度

@interface JqllyView()

@property (nonatomic, assign) CGFloat mHeight;

// r5点坐标
@property (nonatomic, assign) CGFloat curveX;
@property (nonatomic, assign) CGFloat curveY;

// r5红点
@property (nonatomic, strong) UIView *curveView;

@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, assign) BOOL isAnimating;

@end

@implementation JqllyView

static NSString *kX = @"curveX";
static NSString *kY = @"curveY";

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame: frame]) {
        [self addObserver:self forKeyPath:kX options:NSKeyValueObservingOptionNew context:nil];
        [self addObserver:self forKeyPath:kY options:NSKeyValueObservingOptionNew context:nil];
        
        [self configShapeLayer];
        [self configCurveView];
        [self configAction];
    }
    
    return self;
}

- (void) dealloc {
    [self removeObserver:self forKeyPath:kX];
    [self removeObserver:self forKeyPath:kY];
}

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:kX] || [keyPath isEqualToString:kY]) {
        [self updateShapeLayerPath];
    }
}

// 1.初始化CAShapeLayer
- (void)configShapeLayer {
    _shapeLayer = [CAShapeLayer layer];
    _shapeLayer.fillColor = [UIColor colorWithRed:57/255.0 green:67/255.0 blue:89/255.0 alpha:1.0].CGColor;
    [self.layer addSublayer:_shapeLayer];
}

// 2.初始化r5点
- (void)configCurveView {
    _curveX = DEVICE_WIDTH / 2.0;
    _curveY = MIN_HEIGHT;
    
    _curveView = [[UIView alloc] initWithFrame:CGRectMake(_curveX, _curveY, 3, 3)];
    _curveView.backgroundColor = [UIColor redColor];
    [self addSubview:_curveView];
}

// 3.添加移动手势&CADisplayLink
- (void)configAction {
    _mHeight = 100;
    _isAnimating = NO;
    
    UIGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanAction:)];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:gesture];
    
    // CADisplayLink默认每秒运行60次calculatePath是算出在运行期间_curveView的坐标，从而确定_shapeLayer的形状
    _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(calculatePath)];
    [_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    _displayLink.paused = YES;
}

// 4.手势解析
- (void)handlePanAction:(UIPanGestureRecognizer *)pan {
    if (_isAnimating) {
        return;
    }
    
    if (pan.state == UIGestureRecognizerStateChanged) {
        // 手势移动时，_shapeLayer跟着手势向下扩大区域
        CGPoint point = [pan translationInView:self];
        
        // 这部分代码使r5红点跟着手势走
        _mHeight = point.y * 0.7 + MIN_HEIGHT;
        self.curveX = DEVICE_WIDTH / 2.0 + point.x;
        self.curveY = _mHeight > MIN_HEIGHT ? _mHeight : MIN_HEIGHT;
        _curveView.frame = CGRectMake(_curveX, _curveY, _curveView.frame.size.width, _curveView.frame.size.height);
        
        
    } else if (pan.state == UIGestureRecognizerStateCancelled ||
               pan.state == UIGestureRecognizerStateEnded ||
               pan.state == UIGestureRecognizerStateFailed) {
        // 手势结束时,_shapeLayer返回原状并产生弹簧动效
        _isAnimating = YES;
        _displayLink.paused = NO;//开启displaylink,会执行方法calculatePath.
        
        // 弹簧效果
        [UIView animateWithDuration:1.0 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            // 曲线点(r5点)是一个view.所以在block中有弹簧效果.然后根据他的动效路径,在calculatePath中计算弹性图形的形状
            _curveView.frame = CGRectMake(DEVICE_WIDTH / 2.0, MIN_HEIGHT, 3, 3);
        } completion:^(BOOL finished) {
            _displayLink.paused = YES;
            _isAnimating = NO;
        }];
    }
}

// 5.根据r5的位置,更新_shapeLayer形状
- (void)updateShapeLayerPath {
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(0, 0)];// r1点
    [path addLineToPoint:CGPointMake(DEVICE_WIDTH, 0)];// r2点
    [path addLineToPoint:CGPointMake(DEVICE_WIDTH, MIN_HEIGHT)];// r4点
    // r3,r4,r5确定的一个弧线
    [path addQuadCurveToPoint:CGPointMake(0, MIN_HEIGHT) controlPoint:CGPointMake(_curveX, _curveY)];
    [path closePath];
    
    _shapeLayer.path = path.CGPath;
}


// 6.计算弹簧效果坐标
- (void)calculatePath {
    // 由于手势结束时,r5执行了一个UIView的弹簧动画,把这个过程的坐标记录下来,并相应的画出_shapeLayer形状
    CALayer *layer = _curveView.layer.presentationLayer;
    self.curveX = layer.position.x;
    self.curveY = layer.position.y;
}

@end
