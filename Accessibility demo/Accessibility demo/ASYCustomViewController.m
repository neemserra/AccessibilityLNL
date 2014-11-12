#import "ASYCustomViewController.h"
#import "ASYStarView.h"

@interface ASYCustomViewController ()

@end

@implementation ASYCustomViewController

- (void)loadView {
    [super loadView];
    // You can set the accessibility in the view controller but doing it in the view itself is recommended
    //    [_customView setIsAccessibilityElement:YES];
    //    [_customView setAccessibilityTraits:UIAccessibilityTraitButton];
    //    [_customView setAccessibilityLabel:NSLocalizedString(@"view.label", nil)];
    //    [_customView setAccessibilityHint:NSLocalizedString(@"view.hint", nil)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.starView.notSelectedImage = [UIImage imageNamed:@"empty-star"];
    self.starView.fullSelectedImage = [UIImage imageNamed:@"filled-star"];
    self.starView.rating = self.detailItem.stars;
    self.starView.maxRating = 5;
}

- (void)setDetailItem:(ASYCandy *)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.navigationItem) {
        self.navigationItem.title = self.detailItem.name;
    }
}
@end

