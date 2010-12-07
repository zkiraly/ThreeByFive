//
//  StackOfCards.h
//  TableViewTest
//
//  Created by Zsolt Kiraly on 10/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface StackOfCards : NSObject {
	NSMutableArray *stack;

}

- (int)count;
- (NSString *)cardAtIndex:(int)index;
- (void)insertCard:(id)card atIndex:(int)index;
- (void)removeCardAtIndex:(int)index;
- (void)createSampleStack;

@end
