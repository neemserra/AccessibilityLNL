#import "ASYTableViewController.h"
#import "ASYCandy.h"
#import "ASYCustomViewController.h"
@interface ASYTableViewController ()
@property (nonatomic, strong) NSArray *candyList;
@end

@implementation ASYTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self generateCandyList];
    self.customViewController = (ASYCustomViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)generateCandyList {
    ASYCandy *twix = [[ASYCandy alloc] initWithName:@"Twix" type:@"Chocolate" stars:3];
    ASYCandy *twizzlers = [[ASYCandy alloc] initWithName:@"Twizzlers" type:@"Chewy Candy" stars:2];
    ASYCandy *jollyRanchers = [[ASYCandy alloc] initWithName:@"Jolly Ranchers" type:@"Hard Candy" stars:4];
    ASYCandy *gobStoppers = [[ASYCandy alloc] initWithName:@"Gob Stoppers" type:@"Hard Candy" stars:3];
    ASYCandy *snickers = [[ASYCandy alloc] initWithName:@"Snickers" type:@"Chocolate" stars:3];
    ASYCandy *kitkat = [[ASYCandy alloc] initWithName:@"Kitkat" type:@"Chocolate" stars:5];
    ASYCandy *doubleBubble = [[ASYCandy alloc] initWithName:@"Double Bubble" type:@"Gum" stars:1];
    self.candyList = [NSArray arrayWithObjects:twix, twizzlers, jollyRanchers, gobStoppers, snickers, kitkat, doubleBubble, nil];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.candyList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    ASYCandy *candy = [self.candyList objectAtIndex:indexPath.row];
    cell.textLabel.text = candy.name;
    cell.detailTextLabel.text = candy.type;

    cell.accessibilityLabel = [NSString stringWithFormat:@"%@, %@", candy.name, candy.type];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        ASYCandy *candy = [self.candyList objectAtIndex:indexPath.row];
        self.customViewController.detailItem = candy;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ASYCandy *candy = [self.candyList objectAtIndex:indexPath.row];
        [[segue destinationViewController] setDetailItem:candy];
    }
}

@end
