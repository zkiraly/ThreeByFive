//
//  TableViewController.h
//  TableViewTest
//
//  Created by Zsolt Kiraly on 10/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StackOfCards.h"


@interface TableViewController : UITableViewController {
	
	StackOfCards *stack;
}

- (void)cardChanged:(NSNotification *)notification;

@end
