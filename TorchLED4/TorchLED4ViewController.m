//
//  TorchLED4ViewController.m
//  TorchLED4
//
//  Created by Jesus Guerra Rosas on 6/20/11.
//  Copyright 2011 Nearsoft. All rights reserved.
//

#import "TorchLED4ViewController.h"

@implementation TorchLED4ViewController
@synthesize videoCaptureDevice,imageBackground,isTorch,powerButton,whiteView;

- (void)dealloc
{
    [super dealloc];
    [whiteView release];
    [powerButton release];
    [imageBackground release];
    [captureSession stopRunning];
    [captureSession release];
    [videoCaptureDevice release];
    [videoInput release];
}

-(IBAction)turnTorchOn {
    
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    if ([device hasTorch] && [device hasFlash]){
        
        if (!isTorch) {
         
            videoCaptureDevice.torchMode = AVCaptureTorchModeOn;
           [imageBackground setHidden:NO];
            
            
            UIImage *image = [UIImage imageNamed:@"turnedONButton.png"];
            UIImage *powerON = [image stretchableImageWithLeftCapWidth:0 topCapHeight:0.0];
            [powerButton setBackgroundImage:powerON forState:UIControlStateNormal];
            
           

            
            isTorch=TRUE;
                
         }else{
             UIImage *image = [UIImage imageNamed:@"turnedOffButton.png"];
             UIImage *powerOff = [image stretchableImageWithLeftCapWidth:0 topCapHeight:0.0];
             [powerButton setBackgroundImage:powerOff forState:UIControlStateNormal];
             
            
             
             videoCaptureDevice.torchMode = AVCaptureTorchModeOff;
            [imageBackground setHidden:YES];
                isTorch =FALSE;
                
        }
    }else{ 
        whiteView = [[WhiteScreen alloc] init];
        [self presentModalViewController:whiteView animated:YES];
    }
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
-(void)viewDidAppear:(BOOL)animated{
    videoCaptureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];    
    if ([videoCaptureDevice hasTorch] && [videoCaptureDevice hasFlash]){
        captureSession = [[AVCaptureSession alloc] init];
        
        NSError *error = nil;
        videoInput = [AVCaptureDeviceInput deviceInputWithDevice:videoCaptureDevice error:&error];
        
        [captureSession addInput:videoInput];
        AVCaptureVideoDataOutput* videoOutput = [[AVCaptureVideoDataOutput alloc] init];
        //[videoOutput setSampleBufferDelegate:self queue:dispatch_get_current_queue()];
        [videoCaptureDevice lockForConfiguration:nil];
        [captureSession addOutput:videoOutput];
        
        [captureSession startRunning];
        
        isTorch = FALSE;
        
    }

}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
