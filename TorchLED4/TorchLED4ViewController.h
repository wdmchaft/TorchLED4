//
//  TorchLED4ViewController.h
//  TorchLED4
//
//  Created by Jesus Guerra Rosas on 6/20/11.
//  Copyright 2011 Nearsoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WhiteScreen.h"
#import <AVFoundation/AVFoundation.h>

@interface TorchLED4ViewController : UIViewController {
    
    BOOL isTorch;
    AVCaptureSession *captureSession;
    AVCaptureDevice *videoCaptureDevice;
    AVCaptureDeviceInput *videoInput;
    
    IBOutlet UIImageView *imageBackground;
    
    IBOutlet UIButton *powerButton;
    WhiteScreen *whiteView;
    
}
@property(nonatomic,retain) AVCaptureDevice *videoCaptureDevice;
@property(nonatomic,retain) UIImageView *imageBackground;
@property(nonatomic,retain) UIButton *powerButton;
@property(nonatomic,retain) WhiteScreen *whiteView;
@property(nonatomic,readwrite) BOOL isTorch;


@end
