#import "ASYCustomViewController.h"
#import "ASYCustomView.h"

@interface ASYCustomViewController ()
@property (strong, nonatomic) IBOutlet ASYCustomView *customView;
@end

@implementation ASYCustomViewController

- (void)setDetailItem:(ASYRestaurant *)newDetailItem {
    _detailItem = newDetailItem;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.customView setRestaurantName:self.detailItem.name];
}

@end
