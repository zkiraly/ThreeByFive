//
//  FooterCell.m
//  TableViewTest
//
//  Created by Zsolt Kiraly on 10/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "FooterCell.h"


@implementation FooterCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        // Initialization code
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
