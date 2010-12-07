//
//  HeaderCell.m
//  TableViewTest
//
//  Created by Zsolt Kiraly on 10/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "HeaderCell.h"


@implementation HeaderCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        // Initialization code

		CGRect frame = CGRectMake(0.0, 0.0, 320.0, 134.0);
		UIView *view = [[UIView alloc] initWithFrame:frame];
		view.backgroundColor = [UIColor colorWithRed:0.33 green:0.33 blue:0.33 alpha:1.0];
		
		[self.contentView addSubview:view];

		
	}
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)dealloc {
    [super dealloc];
}


@end
