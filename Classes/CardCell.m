//
//  CardCell.m
//  TableViewTest
//
//  Created by Zsolt Kiraly on 10/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CardCell.h"
#import "CardViewController.h"
#import "CardView.h"


@implementation CardCell

@synthesize row;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        // Initialization code
		NSLog(@"CardCell: initWithStyle");
		
#if true		
		// do it with CardView
		cardView = [[CardView alloc] initCard];
		cardView.transform = CGAffineTransformMakeScale(0.60, 0.60);
		[self.contentView addSubview:cardView];
		// CGPoint center = cardCell.contentView.center;
		cardView.center = CGPointMake(160.0, 106.0);
		//cardView.tag = CARD_VIEW_TAG;
		[cardView autorelease];
		[self.contentView addSubview:cardView];
		
		self.selectionStyle = UITableViewCellSelectionStyleNone;

#endif

    }
    return self;
}

- (void)layoutSubviews
{
	[super layoutSubviews];
	NSLog(@"CardCell: layoutSubviews");
	[cardView setNeedsLayout];
	
	return;
}

- (void)setHighlighted: (BOOL)highlighted animated: (BOOL)animated
{
    // don't highlight
	//[super setSelected:selected animated:animated];
	
    // Configure the view for the highlighted state
	NSLog(@"CardCell: setHighlighted: %d", highlighted);
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    //[super setSelected:selected animated:animated];

    // Configure the view for the selected state
	NSLog(@"CardCell: setSelected: %d", selected);
}

- (void)setContentText:(NSString *)text
{
	NSLog(@"CardCell: setContentText: %@", text);
	//[cardView setContentText:text];
	cardView.textView.text = text;
	cardView.row = self.row;
	return;
}

-(void)setData:(NSDictionary *)dict 
{
	// Not implemented yet
	return;
}



- (void)dealloc 
{
	NSLog(@"CardCell: dealloc");
	[cardView release];
	
    [super dealloc];
}


@end
