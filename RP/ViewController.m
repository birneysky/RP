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

@property (weak, nonatomic) IBOutlet UIView *toolView;
@property (weak, nonatomic) IBOutlet PreviewPlayer *player;
@property (nonatomic,strong) VideoCapturer* capture;

@property (weak, nonatomic) IBOutlet UIView *ttView;
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
    AppDelegate* appDelegate = [[UIApplication sharedApplication] delegate];
    //self.player.frame = [UIScreen mainScreen].bounds;
    //[appDelegate.window addSubview:self.player];
    
   /* CGRect screenBundls = [UIScreen mainScreen].bounds;
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    view.center = CGPointMake(screenBundls.size.width / 2, screenBundls.size.height / 2);
    view.backgroundColor = [UIColor redColor];
    [appDelegate.window addSubview:view];*/
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientationDidChanged:) name:UIDeviceOrientationDidChangeNotification object:nil];

//    [self.capture start];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //self.toolView.translatesAutoresizingMaskIntoConstraints = NO;
    [UIView animateWithDuration:5.0f animations:^{
        self.ttView.transform  = CGAffineTransformMakeRotation(M_PI / 2);
    }];
    
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

#pragma mark - *** NSNotification Selector ***
- (void)deviceOrientationDidChanged:(NSNotification*)notification{
    NSLog(@"deviceOrientationDidChanged => %d",[UIDevice currentDevice].orientation);
    
    CGRect screenBunds = [UIScreen mainScreen].bounds;
    UIDeviceOrientation orientation = [UIDevice currentDevice].orientation;
    if (UIDeviceOrientationLandscapeLeft == orientation) {
        NSLog(@"tool  begin frame %@",NSStringFromCGRect(self.toolView.frame));
        
        [UIView animateWithDuration:0.25  animations:^{
            self.toolView.transform = CGAffineTransformMakeRotation(M_PI / 2);
            self.toolView.frame = CGRectMake(0, screenBunds.size.height - 84, screenBunds.size.width, 84);
        } completion:^(BOOL finished) {
           //[self.toolView setNeedsUpdateConstraints];
        }];

        NSLog(@"tool end frame %@",NSStringFromCGRect(self.toolView.frame));
        //
        //self.toolView.frame = CGRectMake(0, 0, 84, screenBunds.size.width);
    }
}

#pragma mark - *** Oriention ***

- (BOOL)shouldAutorotate
{
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
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
