//
//  ESImageViewController.m
//
//  Created by Doug Russell
//  Copyright (c) 2011 Doug Russell. All rights reserved.
//  
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//  
//  http://www.apache.org/licenses/LICENSE-2.0
//  
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//  

#import "ESImageViewController.h"
#import "ESAccessibleImageView.h"

@implementation ESImageViewController

- (id)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) 
	{
		
    }
    return self;
}

#pragma mark - View lifecycle

- (void)loadView
{
	self.view = [[ESAccessibleImageView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	ESAccessibleImageView *imageView = (ESAccessibleImageView *)self.view;
	[imageView setImage:[UIImage imageNamed:@"1004"]];
	[imageView addAccessibilityElement:@"Left Ear" hint:nil frame:CGRectMake(200, 10, 100, 180)];
	[imageView addAccessibilityElement:@"Right Ear" hint:nil frame:CGRectMake(510, 10, 100, 180)];
	[imageView addAccessibilityElement:@"Left Eye" hint:nil frame:CGRectMake(300, 230, 100, 70)];
	[imageView addAccessibilityElement:@"Left Eye" hint:nil frame:CGRectMake(450, 230, 100, 70)];
	
	//Uncomment to test clearing elements
	/*double delayInSeconds = 4.0;
	dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
	dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
		[imageView clearAccessibilityElements];
	});*/
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
