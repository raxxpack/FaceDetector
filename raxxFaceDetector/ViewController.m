//
//  ViewController.m
//  raxxFaceDetector
//
//  Created by Rahim Mitha on 1/29/2014.
//  Copyright (c) 2014 Rahim Mitha. All rights reserved.
//

#import "ViewController.h"
#import <CoreImage/CoreImage.h>
#import <QuartzCore/QuartzCore.h>
#import "UIImage+raxxFaceDetection.h"

@interface ViewController ()

@property (nonatomic, strong) UIImageView* imageView;
@property (nonatomic, strong) UIView* markedAreasView;
@property (nonatomic, assign) BOOL isHighlightedState;

@end

@implementation ViewController

- (void)viewDidLoad {
	
	[super viewDidLoad];
	self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"facedetectionpic.jpg"]];
	self.imageView.frame = (CGRect) {
		.origin = CGPointMake(self.imageView.frame.origin.x, 100),
		.size = self.imageView.image.size
	};
	[self.view addSubview:self.imageView];
	
	self.markedAreasView = [[UIView alloc] init];
	
	UIBarButtonItem *bbi = [[UIBarButtonItem alloc]
							initWithTitle:@"Mark Faces" style:UIBarButtonItemStyleBordered target:self action:@selector(markFaces:)];
	[[self navigationItem] setRightBarButtonItem:bbi];
	UIBarButtonItem *leftButton =[[UIBarButtonItem alloc]
								  initWithTitle:@"Pick Image" style:UIBarButtonItemStyleBordered target:self action:@selector(selectImage:)];
	[[self navigationItem] setLeftBarButtonItem:leftButton];

	
}

- (void)markFaces:(id)sender {
	
	if (!self.isHighlightedState) {
		self.markedAreasView = [self.imageView.image markFaces:self.imageView];
		[self.view addSubview:self.markedAreasView];
		self.isHighlightedState = YES;
	} else {
		[self.markedAreasView removeFromSuperview];
		self.isHighlightedState = NO;
	}
	

}

- (void)selectImage:(id)sender {
	
}


@end

