//
//  ESAccessibleImageView.m
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

#import "ESAccessibleImageView.h"

@interface ESAccessibleImageView ()
@property (nonatomic, strong) NSMutableArray *accessibilityElements;
@end

@implementation ESAccessibleImageView
@synthesize accessibilityElements=_accessibilityElements;

#pragma mark - Accessors

- (BOOL)isAccessibilityElement
{
	return NO;
}

- (NSMutableArray *)accessibilityElements
{
	if (_accessibilityElements == nil)
		_accessibilityElements = [NSMutableArray new];
	return _accessibilityElements;
}

#pragma mark - UIAccessibilityContainer

- (NSInteger)accessibilityElementCount
{
	return self.accessibilityElements.count;
}

- (id)accessibilityElementAtIndex:(NSInteger)index
{
	return [self.accessibilityElements objectAtIndex:index];
}

- (NSInteger)indexOfAccessibilityElement:(id)element
{
	return [self.accessibilityElements indexOfObject:element];
}

#pragma mark - Public

- (void)addAccessibilityElement:(NSString *)label hint:(NSString *)hint frame:(CGRect)frame
{
	//UIAccessibilityElement is the class that is designed for this purpose, 
	//but it doesn't behave well with transforms, so we simply use UIView instances
	if (!label.length)
		return;
	UIView *view = [[UIView alloc] initWithFrame:frame];
	view.isAccessibilityElement = YES;
#if DEBUG
	view.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.1];
#else
	view.backgroundColor = [UIColor clearColor];
#endif
	view.accessibilityLabel = label;
	view.accessibilityHint = hint;
	view.accessibilityTraits = UIAccessibilityTraitStaticText;
	[self.accessibilityElements addObject:view];
	[self addSubview:view];
}

- (void)clearAccessibilityElements
{
	[self.accessibilityElements makeObjectsPerformSelector:@selector(removeFromSuperview)];
	[self.accessibilityElements removeAllObjects];
}

@end
