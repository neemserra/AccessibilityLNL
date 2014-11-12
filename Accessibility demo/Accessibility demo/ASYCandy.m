#import "ASYCandy.h"

@implementation ASYCandy

-(id)initWithName:(NSString *)name type:(NSString *)type stars:(NSInteger)stars {
    if (self = [super init]) {
        self.name = name;
        self.type = type;
        self.stars = stars;
    }
    return self;
}

@end
