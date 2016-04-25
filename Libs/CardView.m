//
//  CardView.m
//  YSLDraggingCardContainerDemo
//
//  Created by yamaguchi on 2015/11/09.
//  Copyright © 2015年 h.yamaguchi. All rights reserved.
//

#import "CardView.h"

@implementation CardView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    _imageView = [[UIImageView alloc]init];
    _imageView.backgroundColor = [UIColor clearColor];
    
    _imageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [self addSubview:_imageView];
    
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:_imageView.bounds
                                     byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight)
                                           cornerRadii:CGSizeMake(7.0, 7.0)];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = _imageView.bounds;
    maskLayer.path = maskPath.CGPath;
    _imageView.layer.mask = maskLayer;
    
    _selectedView = [[UIView alloc]init];
    _selectedView.frame = _imageView.frame;
    _selectedView.backgroundColor = [UIColor clearColor];
    _selectedView.alpha = 0.0;
    [_imageView addSubview:_selectedView];
    
}

@end
