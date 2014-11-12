#import "ASYRestaurant.h"

@implementation ASYRestaurant

-(id)initWithName:(NSString *)name location:(NSString *)location{
    if (self = [super init]) {
        self.name = name;
        self.location = location;
    }
    return self;
}

@end
