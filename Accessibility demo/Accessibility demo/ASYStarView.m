#import "ASYStarView.h"

@implementation ASYStarView

- (void)baseInit {
    _notSelectedImage = nil;
    _fullSelectedImage = nil;
    _rating = 0;
    _imageViews = [[NSMutableArray alloc] init];
    _maxRating = 5;
    _midMargin = 5;
    _leftMargin = 0;
    _minImageSize = CGSizeMake(5, 5);
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self baseInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        [self baseInit];
    }
    return self;
}

- (NSString *)accessibilityLabel {
    /* _starCount is an instance variable that contains how many stars to draw. */
    NSInteger starCount = self.rating;
	NSString *ratingString = [[NSString alloc] init];

    if ( starCount == 1 )
    {
        ratingString = NSLocalizedString(@"star", nil); // here, ratingString is "star"
    }

    else
    {
        ratingString = NSLocalizedString(@"stars", nil); // here, ratingString is "stars"
    }

    return [NSString stringWithFormat:@"%ld %@", (long)starCount, ratingString];
}


- (void)refresh {
    for(int i = 0; i < self.imageViews.count; ++i) {
        UIImageView *imageView = [self.imageViews objectAtIndex:i];
        if (self.rating >= i+1) {
            imageView.image = self.fullSelectedImage;
        } else {
            imageView.image = self.notSelectedImage;
        }
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.notSelectedImage == nil) return;
    
    float desiredImageWidth = (self.frame.size.width - (self.leftMargin*2) - (self.midMargin*self.imageViews.count)) / self.imageViews.count;
    float imageWidth = MAX(self.minImageSize.width, desiredImageWidth);
    float imageHeight = MAX(self.minImageSize.height, self.frame.size.height);
    
    for (int i = 0; i < self.imageViews.count; ++i) {
        
        UIImageView *imageView = [self.imageViews objectAtIndex:i];
        CGRect imageFrame = CGRectMake(self.leftMargin + i*(self.midMargin+imageWidth), 0, imageWidth, imageHeight);
        imageView.frame = imageFrame;
    }
}

- (void)setMaxRating:(int)maxRating {
    _maxRating = maxRating;
    
    // Remove old image views
    for(int i = 0; i < self.imageViews.count; ++i) {
        UIImageView *imageView = (UIImageView *) [self.imageViews objectAtIndex:i];
        [imageView removeFromSuperview];
    }
    [self.imageViews removeAllObjects];
    
    // Add new image views
    for(int i = 0; i < maxRating; ++i) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.imageViews addObject:imageView];
        [self addSubview:imageView];
    }
    
    // Relayout and refresh
    [self setNeedsLayout];
    [self refresh];
}

- (void)setNotSelectedImage:(UIImage *)image {
    _notSelectedImage = image;
    [self refresh];
}

- (void)setFullSelectedImage:(UIImage *)image {
    _fullSelectedImage = image;
    [self refresh];
}

- (void)setRating:(float)rating {
    _rating = rating;
    [self refresh];
}
@end

