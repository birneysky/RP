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
@property (weak, nonatomic) IBOutlet UIButton *rbtn;
@property (nonatomic,strong) VideoCapturer* capture;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tvCenterXConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tvCenterYConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tvHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tvWidthConstraint;

@property (nonatomic,assign) UIDeviceOrientation preDeviceOrientation;
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
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    self.tvCenterXConstraint.constant = screenBounds.size.width / 2 - self.tvWidthConstraint.constant / 2;
    self.tvHeightConstraint.constant = screenBounds.size.height;
    // Do any additional setup after loading the view, typically from a nib.
    AppDelegate* appDelegate = [[UIApplication sharedApplication] delegate];
    //self.player.frame = [UIScreen mainScreen].bounds;
    //[appDelegate.window addSubview:self.player];
    
   /* CGRect screenBundls = [UIScreen mainScreen].bounds;
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    view.center = CGPointMake(screenBundls.size.width / 2, screenBundls.size.height / 2);
    view.backgroundColor = [UIColor redColor];
    [appDelegate.window addSubview:view];*/

    self.preDeviceOrientation = [UIDevice currentDevice].orientation;
    //[self.capture start];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //self.toolView.translatesAutoresizingMaskIntoConstraints = NO;
//    [UIView animateWithDuration:5.0f animations:^{
//        self.ttView.transform  = CGAffineTransformMakeRotation(M_PI / 2);
//    }];
//    NSLog(@"toolViewe  %p",self.toolView);
//    NSLog(@"self.view %p",self.view);
//    NSLog(@"bottomLayoutGuide %p",self.bottomLayoutGuide);
//    NSLog(@"topLayoutGuide %p",self.topLayoutGuide);
//    for (NSLayoutConstraint* constraint in self.view.constraints) {
//        //NSLog(@"%@",constraint);
//        //if ([constraint isMemberOfClass:[NSLayoutConstraint class]]) {
//            NSLog(@"first  %p  second %p  identifier %@ constraint %@",constraint.firstItem,constraint.secondItem,constraint.identifier,constraint);
//        //}
//        if (constraint.firstItem == self.toolView || constraint.secondItem == self.toolView) {
//            //[self.view removeConstraint:constraint];
//        }
//    }
//    NSLog(@"self.toolView frame %@",NSStringFromCGRect(self.toolView.frame));
//    NSLog(@"self.toolView.translateAutoresizeingMaskIntoConstraints %d",self.view.translatesAutoresizingMaskIntoConstraints);
//    self.view.translatesAutoresizingMaskIntoConstraints = NO;
//    self.toolView.translatesAutoresizingMaskIntoConstraints = YES;
    //self.toolView.frame = CGRectMake(0, 0, 84, 1024);
    //[self.toolView setNeedsUpdateConstraints];
    //[self.view removeConstraints:self.view.constraints];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientationDidChanged:) name:UIDeviceOrientationDidChangeNotification object:nil];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceOrientationDidChangeNotification object:nil];
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
    
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    UIDeviceOrientation orientation = [UIDevice currentDevice].orientation;
    if (UIDeviceOrientationLandscapeLeft == orientation) {
        NSLog(@"tool  begin frame %@",NSStringFromCGRect(self.toolView.frame));
        
        [UIView animateWithDuration:0.5  animations:^{
            self.toolView.transform = CGAffineTransformMakeRotation(M_PI / 2);
            self.tvCenterXConstraint.constant = 0;
            self.tvCenterYConstraint.constant = screenBounds.size.height / 2 - self.tvWidthConstraint.constant / 2;
            self.tvHeightConstraint.constant = screenBounds.size.width;
            [self.toolView layoutIfNeeded];
            //self.toolView.frame = CGRectMake(0, screenBunds.size.height - 84, screenBunds.size.width, 84);
        } completion:^(BOOL finished) {
           //[self.toolView setNeedsUpdateConstraints];
            //[self.rbtn setNeedsUpdateConstraints];
            //self.toolView.transform=CGAffineTransformIdentity;
             NSLog(@"tool end frame %@",NSStringFromCGRect(self.toolView.frame));
        }];

       
        //
        //self.toolView.frame = CGRectMake(0, 0, 84, screenBunds.size.width);
    }
}

#pragma mark - *** Oriention ***

//- (BOOL)shouldAutorotate
//{
//    return NO;
//}
//
//- (UIInterfaceOrientationMask)supportedInterfaceOrientations
//{
//    return UIInterfaceOrientationMaskPortrait;
//}
//
//- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
//{    
//    return UIInterfaceOrientationPortrait;
//}
//
//
//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
//    return YES;
//}
//
//
//- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
//{
//
//}

@end
