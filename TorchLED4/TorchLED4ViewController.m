//
//  TorchLED4ViewController.m
//  TorchLED4
//
//  Created by Jesus Guerra Rosas on 6/20/11.
//  Copyright 2011 Nearsoft. All rights reserved.
//

#import "TorchLED4ViewController.h"

@implementation TorchLED4ViewController
@synthesize imageBackground,isTorch,powerButton,whiteView;

- (void)dealloc
{
    [super dealloc];
    [whiteView release];
    [powerButton release];
    [imageBackground release];
}

- (void)setTorch: (BOOL) on
{
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ([device hasTorch]) {
        [device lockForConfiguration:nil];
        [device setTorchMode: on ? AVCaptureTorchModeOn : AVCaptureTorchModeOff];
        [device unlockForConfiguration];
    }
}

-(IBAction)turnTorchOn {
    
        
        if (!isTorch) {
         
            [imageBackground setHidden:NO];
            UIImage *image = [UIImage imageNamed:@"turnedONButton.png"];
            UIImage *powerON = [image stretchableImageWithLeftCapWidth:0 topCapHeight:0.0];
            [powerButton setBackgroundImage:powerON forState:UIControlStateNormal];
                        
            isTorch=TRUE;
            [self setTorch:isTorch];
                
         }else{
             UIImage *image = [UIImage imageNamed:@"turnedOffButton.png"];
             UIImage *powerOff = [image stretchableImageWithLeftCapWidth:0 topCapHeight:0.0];
             [powerButton setBackgroundImage:powerOff forState:UIControlStateNormal];

             [imageBackground setHidden:YES];
             isTorch =FALSE;
             [self setTorch:isTorch];
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
    isTorch = FALSE;

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
