#import "ASYContainerView.h"

@interface ASYContainerView()
@property (nonatomic, strong) NSMutableArray *accessibleElements;

@end

@implementation ASYContainerView
- (NSArray *)accessibleElements {
    if ( _accessibleElements != nil )
    {
        return _accessibleElements;
    }
    _accessibleElements = [[NSMutableArray alloc] init];
	
    /* Create an accessibility element to represent the first contained element and initialize it as a component of MultiFacetedView. */
    UIAccessibilityElement *element1 = [[UIAccessibilityElement alloc] initWithAccessibilityContainer:self];
	
    /* Set attributes of the first contained element here. */
    [_accessibleElements addObject:element1];
	
    /* Perform similar steps for the second contained element. */
    UIAccessibilityElement *element2 = [[UIAccessibilityElement alloc] initWithAccessibilityContainer:self];
	
    /* Set attributes of the second contained element here. */
    [_accessibleElements addObject:element2];
	
    return _accessibleElements;
}

/* The container itself is not accessible, so should return NO in isAccessiblityElement. */
- (BOOL)isAccessibilityElement {
    return NO;
}

/* The following methods are implementations of UIAccessibilityContainer protocol methods. */
- (NSInteger)accessibilityElementCount {
    return [[self accessibleElements] count];
}

- (id)accessibilityElementAtIndex:(NSInteger)index {
    return [[self accessibleElements] objectAtIndex:index];
}

- (NSInteger)indexOfAccessibilityElement:(id)element {
    return [[self accessibleElements] indexOfObject:element];
}

@end