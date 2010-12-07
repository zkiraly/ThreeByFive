//
//  CardViewController.h
//  TableViewTest
//
//  Created by Zsolt Kiraly on 10/7/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CardView;


@interface CardViewController : NSObject {
	CardView *view;
}

- (void)setContentText:(NSString *)newText;

@property (nonatomic, retain) CardView *view;

@end
