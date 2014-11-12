#import <UIKit/UIKit.h>
#import "ASYCandy.h"
#import "ASYStarView.h"

@interface ASYCustomViewController : UIViewController
@property (strong, nonatomic) ASYCandy *detailItem;
@property (weak, nonatomic) IBOutlet ASYStarView *starView;
@property (weak, nonatomic) IBOutlet UINavigationItem *detailDescriptionLabel;
@end


