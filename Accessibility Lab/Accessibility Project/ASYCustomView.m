#import "ASYCustomView.h"

@interface ASYCustomView ()

@property (weak, nonatomic) IBOutlet UILabel *restaurantNameLabel;

@end

@implementation ASYCustomView

- (void)setRestaurantName:(NSString *)name {
    self.restaurantNameLabel.text = name;
}

@end
