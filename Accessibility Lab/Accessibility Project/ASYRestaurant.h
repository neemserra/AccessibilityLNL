#import <Foundation/Foundation.h>

@interface ASYRestaurant : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *location;

-(id)initWithName:(NSString *)name location:(NSString *)location;

@end
