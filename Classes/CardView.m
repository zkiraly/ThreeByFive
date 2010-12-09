//
//  CardView.m
//  TableViewTest
//
//  Created by Zsolt Kiraly on 10/7/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "CardView.h"


@implementation CardView

@synthesize textView, row;

- (id)initCard
{
	NSLog(@"CardView: initCard");
	CGRect frame = CGRectMake(0.0, 0.0, 480.0, 300.0);
	return [self initWithFrame:frame];
}


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
		NSLog(@"CardView: initWithFrame");
		// add text view
		
		CGRect frame = CGRectMake(0.0, 0.0, 480.0, 300.0);
		textView = [[UITextView alloc] initWithFrame:frame];
		[textView setTextColor:[UIColor blackColor]];
		[textView setFont:[UIFont systemFontOfSize:24]];
		// might use the non-clear textview after all
		[textView setBackgroundColor:[UIColor colorWithRed:0.95 green:0.95 blue:0.7 alpha:1.0]];
		//[textView setBackgroundColor:[UIColor clearColor]];
		textView.editable = true;
		textView.text = @"Default text";
		textView.delegate = self;
		textView.opaque = YES;
		
		// to recognize the double tap b/c that's when we want to start editing text
		UITapGestureRecognizer *singleFingerDTap = [[UITapGestureRecognizer alloc]
													initWithTarget:self action:@selector(handleDoubleTap:)];
		singleFingerDTap.numberOfTapsRequired = 2;
		
		[self addGestureRecognizer:singleFingerDTap];
		
		[singleFingerDTap release];
		
#if false // was used for debugging when the views did not line up properly
		self.layer.borderColor = [UIColor blueColor].CGColor;
		self.layer.borderWidth = 2.0;
		
		textView.layer.borderColor = [UIColor greenColor].CGColor;
		textView.layer.borderWidth = 2.0;
#endif
		
		
#if false // uses quartz to calculate shadows. kinda slow, but maybe save as image and then use?
		self.layer.shadowColor = [UIColor blackColor].CGColor;
		self.layer.shadowOpacity = 1.0;
		self.layer.shadowRadius = 5.0;
		self.layer.shadowOffset = CGSizeMake(0.0, 3.0);
#endif
		//NSString *shadowPath = [[NSBundle mainBundle] pathForResource:@"320x212 card shadow" ofType:@"png"];
		//NSString *shadowPath = [[NSBundle mainBundle] pathForResource:@"320x212 card shadow" ofType:@"png"];
		//UIImage *shadowImage = [[UIImage alloc] initWithContentsOfFile:shadowPath];
		//backgroundImage = [[UIImageView alloc] initWithImage:shadowImage];
		//CGPoint center1 = backgroundImage.center;
		
		//backgroundImage.transform = CGAffineTransformMakeScale(1.0/0.60, 1.0/0.60);
		//backgroundImage.center = CGPointMake(center1.x+30, center1.y+16);
		
		//[self addSubview:backgroundImage];
		
		self.clipsToBounds = NO;
		
		[self addSubview:textView];
		NSLog(@"initCard: textView: %@", [textView description]);
		
		[textView release];
		//[shadowImage release];
		//[backgroundImage release];
		
		// subscribe to UITextViewTextDidEndEditingNotification
		[[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(textEditingEnded:)
													 name:@"UITextViewTextDidEndEditingNotification" object:nil];
		
		
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)layoutSubviews
{
	NSLog(@"CardView: layoutSubviews");
	[super layoutSubviews];
#if false
	CGPoint center = self.center;
		
	textView.center = center;
#endif
	NSLog(@"CardView: layoutSubviews: textView: %@", [textView description]);
	
	
}

// override hittest to prevent the textview from eating touches
- (UIView*)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
	
	
#if true // to prevent touch events from reaching subviews
	return self;
#else // the usual implementation
	UIView *hitView = [super hitTest:point withEvent:event];
	
    if (hitView == self)
		
        return [[self subviews] lastObject];
	
    else
		
        return hitView;
	
#endif
	
}


- (void)handleDoubleTap:(UIGestureRecognizer *)sender
{
	NSLog(@"TextView was double tapped!");
	CGPoint location = [sender locationInView:self];
	NSLog(@"   Location: %f, %f", location.x, location.y);
	
	if (location.x >=0 && location.x < 480 && location.y >=0 && location.y < 300) {
		NSLog(@"It was in the textview.");
		[textView becomeFirstResponder];
	}
	else {
		NSLog(@" It was outside the textView");
	}

	
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)aTextView {
	
	NSLog(@"CardTextView: textViewShouldBeginEditing");
	
	UIToolbar *keyboardToolbar = nil;
    
	NSLog(@"CardTextView: Received keyboardWillShow notification");
	
	if(keyboardToolbar == nil) 
	{
		// create the toolbar to go above the keyboard
		keyboardToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0, 0.0, 100.0, 20.0)];
		keyboardToolbar.barStyle = UIBarStyleBlackTranslucent;
		
		UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] 
									  initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace 
									  target:nil 
									  action:nil];
		UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] 
									 initWithTitle:@"Done" 
									 style:UIBarButtonItemStyleBordered 
									 target:self 
									 action:@selector(dismissKeyboard:)];
		NSArray *items = [[NSArray alloc] initWithObjects:flexSpace, doneItem, nil];
		[keyboardToolbar setItems:items];	
		[items release];	
		[flexSpace release];
		[doneItem release];
	}				
	
	[keyboardToolbar removeFromSuperview];
	keyboardToolbar.frame = CGRectMake(0, 0, 640, 30);
	textView.inputAccessoryView = keyboardToolbar;
	[keyboardToolbar release];
	
	
	
	return YES;
}

- (void)dismissKeyboard:(id)sender
{
	// Animate the card back to the centered position.
	
	NSLog(@"CardTextView: Dismissing keyboard");
	[textView resignFirstResponder];
	
	// send notification that this card changed with self as object
	// the subscriber will take a look and read the new content
	[[NSNotificationCenter defaultCenter]
				postNotificationName:@"cardChanged" object:self];
}

- (void)setCardData:(NSMutableDictionary *)cardData
{
	//textView.text = [cardData objectForKey:@"title"];
	//textView.text = [cardData content];
	
	return;
}

- (void)textEditingEnded:(NSNotification *)notification
{
	NSLog(@"Text editing ended"); // this is getting called 4 times when the editing ends.. why?
	// So I'll just go with dismissKeyboard for now.
	
	return;
}

- (void)dealloc {
	[textView release];
    [super dealloc];
}


@end
