//
//  CardViewController.m
//  TableViewTest
//
//  Created by Zsolt Kiraly on 10/7/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CardViewController.h"
#import "CardView.h"


@implementation CardViewController

// single tap: bring up slide add/delete icons. add will give new slide below
// double tap: open keyboard to change text

@synthesize view;

- (id)init
{
	if((self = [super init]))
	{
		view = [[CardView alloc] initCard];
		view.transform = CGAffineTransformMakeScale(0.60, 0.60);
		
	}
	
	return self;
}

- (void)setContentText:(NSString *)newText
{
	self.view.textView.text = newText;
	
	return;	
}

@end
