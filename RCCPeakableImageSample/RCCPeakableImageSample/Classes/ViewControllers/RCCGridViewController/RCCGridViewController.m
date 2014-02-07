// Header
#import "RCCGridViewController.h"

// Vendor
// Views
#import "RCCPeakableImageView.h"

@interface RCCGridViewController ()

# pragma mark - Private properties (IBOutlets)

@property (nonatomic, strong, readwrite) IBOutlet UIScrollView *scrollView;

@end

@implementation RCCGridViewController

# pragma mark - Template methods

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self RCC_setupView];
}

# pragma mark - Private helpers (View setup)

- (void)RCC_setupView
{
  // Fill scrollview with "peekable" thumbnails
  NSUInteger index;
  for (index = 0; index < 26; ++index) {
    
    // Setup image name
    NSString *name = [NSString stringWithFormat:@"Thumb%03ld.jpg", (unsigned long)index];
    UIImage *image = [UIImage imageNamed:name];
    
    // Setup image view frame
    BOOL indexIsOdd = (index % 2);
    CGRect frame = CGRectMake((indexIsOdd ? 160.0f : 0.0f),
                              (indexIsOdd ? ((index-1)/2.0f * 160.0f) : (index/2.0f * 160.0f)),
                              160.0f,
                              160.0f);
    
    // Setup left image view
    RCCPeakableImageView *view = [[RCCPeakableImageView alloc] initWithFrame:frame];
    view.image = image;
    view.padding = CGPointMake(20.0f, 20.0f); // Add padding to get some vertical "peek"
    [self.scrollView addSubview:view];
  }
  
  // Set scrollview content size
  self.scrollView.contentSize = CGSizeMake(320.0f, index * (160.0f / 2.0f));
}

@end
