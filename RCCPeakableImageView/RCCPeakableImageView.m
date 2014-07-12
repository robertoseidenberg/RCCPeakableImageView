// Header
#import "RCCPeakableImageView.h"

@interface RCCPeakableImageView ()

@property (nonatomic, strong, readwrite) UIImageView *imageView;

@end

@implementation RCCPeakableImageView

# pragma mark - Init

- (instancetype)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) [self RCC_setupView];
  return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
  self = [super initWithCoder:aDecoder];
  if (self) [self RCC_setupView];
  return self;
}

# pragma mark - Setters

- (void)setImage:(UIImage *)image
{
  // Store image
  self.imageView.image = image;
  
  // Remove exising motion effects
  for (UIMotionEffect *effect in [self.imageView motionEffects]) {
    [self.imageView removeMotionEffect:effect];
  }
  
  // Update padding
  [self setPadding:self.padding];
}

- (void)setPadding:(CGPoint)padding
{
  // Store padding value
  _padding = padding;
  
  // Grow image view
  CGRect frame = self.imageView.bounds;
  CGRect paddingFrame = CGRectInset(frame, -ABS(padding.x), -ABS(padding.y));
  self.imageView.frame = paddingFrame;
  
  // Calculate offsets for motion effect
  UIImage *image = self.imageView.image;
  CGFloat horRatio = self.imageView.bounds.size.width / image.size.width;
  CGFloat vertRatio = self.imageView.bounds.size.height / image.size.height;
  CGFloat ratio = MAX(horRatio, vertRatio);
  CGSize aspectFillSize = CGSizeMake(image.size.width * ratio, image.size.height * ratio);
  CGFloat horPading =
  ABS((self.imageView.bounds.size.width - aspectFillSize.width) / 2.0f);
  horPading = horPading + ABS(self.padding.x / 2.0f);
  CGFloat vertPading =
  ABS((self.imageView.bounds.size.height - aspectFillSize.height) / 2.0f);
  vertPading = vertPading + ABS(self.padding.y / 2.0f);
  
  // Add motion effect to image view
  // Horizontal movement
  UIInterpolatingMotionEffect *horizMotionEffect =
  [self RCC_horizontalEffectWithMinDistance:@(-horPading)
                             andMaxDistance:@(horPading)];
  // Vertical movement
  UIInterpolatingMotionEffect *vertMotionEffect =
  [self RCC_verticalEffectWithMinDistance:@(-vertPading)
                           andMaxDistance:@(vertPading)];
  [self.imageView addMotionEffect:horizMotionEffect];
  [self.imageView addMotionEffect:vertMotionEffect];  
}

# pragma mark - Priavte helpers (Setup)

- (void)RCC_setupView
{
  // Clip subviews
  self.clipsToBounds = YES;
  
  // Add image subview
  self.imageView = [[UIImageView alloc] initWithFrame:self.bounds];
  self.imageView.contentMode = UIViewContentModeScaleAspectFill;
  self.imageView.clipsToBounds = NO;
  self.imageView.backgroundColor = [UIColor clearColor];
  self.imageView.opaque = NO;
  [self addSubview:self.imageView];
}

- (UIInterpolatingMotionEffect *)RCC_horizontalEffectWithMinDistance:(NSNumber *)min
                                                      andMaxDistance:(NSNumber *)max
{
  UIInterpolatingMotionEffect *motionEffect =
  [[UIInterpolatingMotionEffect alloc]
   initWithKeyPath:@"center.x"
   type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
  motionEffect.minimumRelativeValue = min;
  motionEffect.maximumRelativeValue = max;
  
  return motionEffect;
  
}

- (UIInterpolatingMotionEffect *)RCC_verticalEffectWithMinDistance:(NSNumber *)min
                                                    andMaxDistance:(NSNumber *)max
{
  UIInterpolatingMotionEffect *motionEffect =
  [[UIInterpolatingMotionEffect alloc]
   initWithKeyPath:@"center.y"
   type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
  motionEffect.minimumRelativeValue = min;
  motionEffect.maximumRelativeValue = max;
  
  return motionEffect;
}

@end
