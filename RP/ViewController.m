//
//  ViewController.m
//  RP
//
//  Created by birneysky on 16/5/14.
//  Copyright © 2016年 birneysky. All rights reserved.
//

#import "ViewController.h"
#import "PreviewPlayer.h"
#import "VideoCapturer.h"
#import "AppDelegate.h"

@interface ViewController () <VideoCaptureOutput>

@property (weak, nonatomic) IBOutlet PreviewPlayer *player;
@property (nonatomic,strong) VideoCapturer* capture;

@end

@implementation ViewController

#pragma mark - *** Properties***
- (VideoCapturer*) capture
{
    if (!_capture) {
        _capture = [[VideoCapturer alloc] initWithSessionPreset:AVCaptureSessionPreset640x480];
        _capture.delegate = self;
    }
    return _capture;
}


#pragma mark - *** Initializers ***
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    AppDelegate* appDelegate = [[UIApplication sharedApplication] delegate];
//    self.player.frame = [UIScreen mainScreen].bounds;
//    [appDelegate.window addSubview:self.player];
//    [self.capture start];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - *** VideoCaptureOutput ***
- (void)didOutputSampleBuffer:(CMSampleBufferRef)sample
{
    [self.player displaySampleBuffer:sample];
}


#pragma mark - *** Oriention ***

- (BOOL)shouldAutorotate
{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscapeLeft;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{    
    return UIInterfaceOrientationPortrait;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    return YES;
}


- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{

}

@end
