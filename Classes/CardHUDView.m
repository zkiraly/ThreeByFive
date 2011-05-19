//
//  CardHUDView.m
//  3x5
//
//  Created by Zsolt Kiraly on 1/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CardHUDView.h"


@implementation CardHUDView

- (id)initHud
{
	NSLog(@"CardHUDView: initHud");
	CGRect frame = CGRectMake(0.0, 0.0, 320.0, 212.0);
    
    //NSLog(@"CardHUDView loaded from %@", [self nibName]);
    
	return [self initWithFrame:frame];
}

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}
*/

- (void)dealloc {
    [super dealloc];
}

//
// nibName
//
// returns the name of the nib file from which the cell is loaded.
//
+ (NSString *)nibName
{
	return @"CardHUD";
}


@end
