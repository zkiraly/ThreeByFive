//
//  CardView.h
//  TableViewTest
//
//  Created by Zsolt Kiraly on 10/7/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CardView : UIView <UITextViewDelegate>
{
	UITextView *textView;
	UIImageView *backgroundImage;
	int row;

}

- (id)initCard;

- (void)handleDoubleTap:(UIGestureRecognizer *)sender;
- (void)handleSingleTap:(UIGestureRecognizer *)sender;

- (void)dismissKeyboard:(id)sender;
- (void)setCardData:(NSDictionary *)cardData;
- (void)textEditingEnded:(NSNotification *)notification;

@property (nonatomic, retain) UITextView *textView;
@property int row;

@end
