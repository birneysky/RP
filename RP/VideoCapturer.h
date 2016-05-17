//
//  VideoCapturer.h
//  SampleBufferDisplay
//
//  Created by birneysky on 15/12/16.
//  Copyright © 2015年 com.v2tech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@protocol VideoCaptureOutput <NSObject>

- (void)didOutputSampleBuffer:(CMSampleBufferRef)sample;
@end

@interface VideoCapturer : NSObject

@property (nonatomic,weak) id<VideoCaptureOutput> delegate;

- (instancetype)initWithSessionPreset:(NSString*)preset;

- (BOOL)start;

- (BOOL)stop;

- (void)startSend;

- (void)stopSend;

@end
