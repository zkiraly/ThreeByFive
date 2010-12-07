//
//  CardCell.h
//  TableViewTest
//
//  Created by Zsolt Kiraly on 10/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
//@class CardViewController;

@class CardView;

@interface CardCell : UITableViewCell {
	
	int row; // the row number, which is the same as the card number
	CardView *cardView;

}

- (void)setContentText:(NSString *)text;
- (void)setData:(NSDictionary *)dict ;

@property int row;

@end
