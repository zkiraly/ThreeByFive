//
//  StackOfCards.m
//  TableViewTest
//
//  Created by Zsolt Kiraly on 10/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "StackOfCards.h"


@implementation StackOfCards

- (id)init
{
	if((self = [super init]))
	{
		// create the stack with space for 10 cards initially
		stack = [[NSMutableArray alloc] initWithCapacity:10];
		
	}
	
	return self;
}

- (int)count
{
	// return the number of cards in the stack
	return [stack count];
}

- (NSString *)cardAtIndex:(int)index
{
	// return the card at the requested index
	if ( index > ([self count]) ) { // but check if the index is valid
		NSLog(@"stack: tried to request a card from a location greater than count");
		return nil;
	}
	return [stack objectAtIndex:index];
}

- (void)insertCard:(id)card atIndex:(int)index
{
	// insert a new card into the stack
	if (index > [self count]) { // but check if the index is valid
		NSLog(@"stack: tried to insert at a location greater than count");
		return;
	}
	[stack insertObject:card atIndex:index];
}

- (void)removeCardAtIndex:(int)index
{
	// remove the card at the requested index
	if ( index > ([self count]-1) ) { // but check if the index is valid
		NSLog(@"stack: tried to remove a card from a location greater than count-1");
		return;
	}
	[stack removeObjectAtIndex:index];
	return;
}

- (void)createSampleStack
{
	// create five cards, insert into stack
	NSString *card = @"This is the first card.";
	[stack addObject:card];
	card = @"This is the second card";
	[stack addObject:card];
	card = @"This is the third card";
	[stack addObject:card];
	card = @"This is the fourth card";
	[stack addObject:card];
	card = @"This is the fifth card";
	[stack addObject:card];
	
	return;
}



@end
