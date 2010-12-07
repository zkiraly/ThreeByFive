//
//  TableViewTestAppDelegate.h
//  TableViewTest
//
//  Created by Zsolt Kiraly on 10/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TableViewTestViewController;
@class TableViewController;

@interface TableViewTestAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TableViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
//@property (nonatomic, retain) IBOutlet TableViewTestViewController *viewController;
@property (nonatomic, retain) IBOutlet TableViewController *viewController;

@end

