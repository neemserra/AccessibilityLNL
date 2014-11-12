#import <UIKit/UIKit.h>

@class ASYStarView;

@interface ASYStarView : UIView

@property (strong, nonatomic) UIImage *notSelectedImage;
@property (strong, nonatomic) UIImage *fullSelectedImage;
@property (assign, nonatomic) float rating;
@property (strong) NSMutableArray * imageViews;
@property (assign, nonatomic) int maxRating;
@property (assign) int midMargin;
@property (assign) int leftMargin;
@property (assign) CGSize minImageSize;


@end