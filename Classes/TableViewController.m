//
//  TableViewController.m
//  TableViewTest
//
//  Created by Zsolt Kiraly on 10/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TableViewController.h"
#import "CardCell.h"
#import "HeaderCell.h"
#import "CardView.h"


@implementation TableViewController



#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
	NSLog(@"TableViewController: viewDidLoad");
	
	
	// subscribe to cardChanged
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(cardChanged:)
												 name:@"cardChanged" object:nil];
	
	
	
}

- (StackOfCards *)stack
{
	if (!stack) {
		stack = [[StackOfCards alloc] init];
	}
	return stack;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
	
	[[self stack] createSampleStack];
	
}



/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)cardChanged:(NSNotification *)notification
{
	CardView *card = [notification object];
	
	NSLog(@"TableViewController: cardChanged, card %d", card.row);
	
	[stack removeCardAtIndex:card.row];
	[stack insertCard:card.textView.text atIndex:card.row];
	
	return;
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 3;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
	if (section == 0 || section == 2)
	{
		return 1;
	}
	
	//tableView.rowHeight = 212;
    return [[self stack] count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"CardCell";
	
	
	NSUInteger section = [indexPath indexAtPosition:0];
	NSUInteger row = [indexPath indexAtPosition:1];
	NSLog(@"TableViewController: cellForRowAtIndexPath, section %d, row %d", section, row);
	
	if( section == 0 || section == 2 )
	{
		
		CellIdentifier = @"HeaderCell";
		
		HeaderCell *cell = (HeaderCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
		if (cell == nil) {
			cell = [[[HeaderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		}
		
		// Configure the cell...
		
		return cell;
	}
	
	CellIdentifier = @"CardCell"; // CardCell UITableViewCell
    
	// I need a subclass of UITableViewCell here, would be more MVC.
    CardCell *cardCell = (CardCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cardCell == nil) 
	{
        cardCell = [[[CardCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...

	cardCell.row = row;
	[cardCell setContentText:[[self stack] cardAtIndex:row]];
	 	
	UIImage *rowBackground = [UIImage imageNamed:@"320x212card.png"];
	UIImageView *rowBackgroundView = [[UIImageView alloc] initWithImage:rowBackground];
	UIImage *selectionBackground = [UIImage imageNamed:@"320x212card.png"];
	UIImageView *selectedBackgroundView = [[UIImageView alloc] initWithImage:selectionBackground];
	
	cardCell.backgroundView = rowBackgroundView;
	cardCell.selectedBackgroundView = selectedBackgroundView;
	[selectedBackgroundView release];
	[rowBackgroundView release];
	
    return cardCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSUInteger section = [indexPath indexAtPosition:0];
	if( section == 0 || section == 2)
	{
		return 134.0;
	}
	
	return 212.0;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	/*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 */
	NSLog(@"TableViewController: didSelectRow: row %d", [indexPath row]);
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
	NSLog(@"TableViewController dealloc!!!");
	
    [super dealloc];
}


@end

