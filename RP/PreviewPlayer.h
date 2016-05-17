//
//  VideoPlayer.h
//  RP
//
//  Created by zhangguang on 16/5/17.
//  Copyright © 2016年 birneysky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface PreviewPlayer : UIView

- (void)displaySampleBuffer:(CMSampleBufferRef)sample;

@end
