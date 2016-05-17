//
//  VideoPlayer.m
//  RP
//
//  Created by zhangguang on 16/5/17.
//  Copyright © 2016年 birneysky. All rights reserved.
//

#import "PreviewPlayer.h"


@implementation PreviewPlayer


- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        AVSampleBufferDisplayLayer* layer = (AVSampleBufferDisplayLayer*)self.layer;
        layer.videoGravity = AVLayerVideoGravityResizeAspect;
        layer.backgroundColor = [UIColor blackColor].CGColor;
    }
    return self;
}

+ (Class)layerClass{
    return [AVSampleBufferDisplayLayer class];
}

- (void)displaySampleBuffer:(CMSampleBufferRef)sample
{
    [(AVSampleBufferDisplayLayer*)self.layer  enqueueSampleBuffer:sample];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
