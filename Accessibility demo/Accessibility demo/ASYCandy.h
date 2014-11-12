#import <Foundation/Foundation.h>

@interface ASYCandy : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *type;
@property NSInteger stars;

-(id)initWithName:(NSString *)name type:(NSString *)type stars:(NSInteger)stars;

@end
