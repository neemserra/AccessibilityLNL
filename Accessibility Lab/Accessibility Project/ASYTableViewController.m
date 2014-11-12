#import "ASYTableViewController.h"
#import "ASYRestaurant.h"
#import "ASYCustomViewController.h"

@interface ASYTableViewController ()
@property (nonatomic, strong) NSArray *restaurantList;
@end

@implementation ASYTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self generateRestaurantList];
}

#pragma mark - Table view data source

- (void)generateRestaurantList {
    ASYRestaurant *flyingSaucer = [[ASYRestaurant alloc] initWithName:@"Flying Saucer" location:@"Downtown"];
    ASYRestaurant *baileys = [[ASYRestaurant alloc] initWithName:@"Bailey's Range" location:@"Downtown"];
    ASYRestaurant *joeBucks = [[ASYRestaurant alloc] initWithName:@"Joe Bucks" location:@"Downtown"];
    ASYRestaurant *noodles = [[ASYRestaurant alloc] initWithName:@"Noodles and Company" location:@"Delmar Loop"];
    ASYRestaurant *cheeseology = [[ASYRestaurant alloc] initWithName:@"Cheeseology" location:@"Delmar Loop"];
    ASYRestaurant *mortons = [[ASYRestaurant alloc] initWithName:@"Morton's Steakhouse" location:@"Clayton"];
    self.restaurantList = [NSArray arrayWithObjects:flyingSaucer, baileys, joeBucks, noodles, cheeseology, mortons, nil];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.restaurantList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    ASYRestaurant *restaurant = [self.restaurantList objectAtIndex:indexPath.row];
    cell.textLabel.text = restaurant.name;
    cell.detailTextLabel.text = restaurant.location;
    
    cell.accessibilityLabel = [NSString stringWithFormat:@"%@, %@", restaurant.name, restaurant.location];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    ASYRestaurant *restaurant = [self.restaurantList objectAtIndex:indexPath.row];
    ASYCustomViewController *destinationViewController = [segue destinationViewController];
    [destinationViewController setDetailItem:restaurant];
}

@end