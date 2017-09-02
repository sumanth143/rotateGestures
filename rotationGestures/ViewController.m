//
//  ViewController.m
//  rotationGestures
//
//  Created by student on 9/2/17.
//  Copyright © 2017 student. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

{
    UIPanGestureRecognizer * canvasimageGesture;
    NSInteger x;
    NSInteger y;
    


}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        self.imagepava.image=[UIImage imageNamed:@"download.jpeg"];
        canvasimageGesture=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handleimagepan:)];
        [self.imagepava addGestureRecognizer:canvasimageGesture];
        self.imagepava.userInteractionEnabled= YES;
    
  
}

-(void)handleimagepan:(UIPanGestureRecognizer *)recognizer
{
    CGPoint translation = [recognizer translationInView:self.view];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x, recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
    x=recognizer.view.center.x+translation.x;
    y=recognizer.view.center.y+translation.y;
}

-(IBAction)rotateGestureHandler:(UIRotationGestureRecognizer *)sender
{
    CGFloat netRotation=0.0;
    CGFloat Rotation=[(UIRotationGestureRecognizer *)sender rotation];
    CGAffineTransform transform=CGAffineTransformMakeRotation(Rotation+netRotation);
    sender.view.transform=transform;
    if (sender.state== UIGestureRecognizerStateEnded)
    {
        netRotation+=Rotation;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
