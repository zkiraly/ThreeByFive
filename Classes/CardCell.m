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
#import "CardHUDView.h"


@implementation CardCell

@synthesize row;
@synthesize hud;

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
		//[self.contentView addSubview:cardView];
#endif		
        
#if true 
        // well this does not work right now
        // lets add the HUD to the content as top view
        // but make it invisible: alpha = 0
        
        NSArray *nibViews = [[NSBundle mainBundle] loadNibNamed:@"CardHUD" owner:self options:nil];
        
        NSLog(@"nibViews count: %d", [nibViews count]);
        //hudView = [nibViews objectAtIndex:0];
        
        //hudView = [[CardHUDView alloc] initHud];
        hud.alpha = 0.0;
        hud.hidden = false;
		//hudView.transform = CGAffineTransformMakeScale(0.60, 0.60);
		[self.contentView addSubview:hud];
		// CGPoint center = cardCell.contentView.center;
		hud.center = CGPointMake(160.0, 106.0);
		//hudView.tag = HUD_VIEW_TAG;
		//[hudView autorelease];
        [self.contentView bringSubviewToFront:hud];
		//[self.contentView addSubview:cardView];
#endif
#if true
        // TODO: add gesture recognizer for single tap, for showing the card HUD
        // but this takes over the single tap completely i.e
        // the table view does not get notified.
        UITapGestureRecognizer *singleFingerSingleTap = [[UITapGestureRecognizer alloc]
                                                         initWithTarget:self action:@selector(handleSingleTap:)];
		singleFingerSingleTap.numberOfTapsRequired = 1;
        //[singleFingerSingleTap requireGestureRecognizerToFail:singleFingerDTap];
		
		[self.contentView addGestureRecognizer:singleFingerSingleTap];
		
		[singleFingerSingleTap release];
#endif

		self.selectionStyle = UITableViewCellSelectionStyleNone;



    }
    return self;
}

// handle the single tap by showing the HUD for that card.
// (ToDo: maybe scroll the card to the center too?)
- (void)handleSingleTap:(UIGestureRecognizer *)sender
{
    NSLog(@"CardCell: handleSingleTap: card got single tapped.");
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.1];
    [UIView setAnimationDelay:0.0];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    if(hud.alpha == 0.0)
    {
        hud.alpha = 1.0;
    }
    else
    {
        hud.alpha = 0.0;
    }
    [UIView commitAnimations];
    
    return;
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
    
#if false // 
    // tell the cardView that we have been selected
    // i.e. show the HUD for the cell
    if (selected) {
        NSLog(@"This card has been selected");
        hudView.alpha = 1.0; // make the HUD visible
    } else {
        NSLog(@"This card has been un-selected");
        hudView.alpha = 0.0; // make the HUD invisible
    }
#endif
    return;
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
