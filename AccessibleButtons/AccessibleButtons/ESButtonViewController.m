//
//  ESButtonViewController.m
//  AccessibleButtons
//
//  Created by Doug Russell on 9/11/11.
//  Copyright (c) 2011 Doug Russell. All rights reserved.
//

#import "ESButtonViewController.h"

@implementation ESButtonViewController

- (id)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) 
	{
		
    }
    return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

@end
