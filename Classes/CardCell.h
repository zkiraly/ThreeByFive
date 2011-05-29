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
@class CardHUDView;

@interface CardCell : UITableViewCell {
	
	int row; // the row number, which is the same as the card number
	CardView *cardView; // this is the card that is displayed
    
    // the HUD for the card
    // it's only displayed when the cell is selected
    CardHUDView *hudView; 
    IBOutlet UIView *hud;

}

- (void)setContentText:(NSString *)text;
- (void)setData:(NSDictionary *)dict ;

@property int row;
@property (nonatomic, assign) UIView *hud;

@end
