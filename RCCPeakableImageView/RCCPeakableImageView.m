// Header
#import "RCCPeakableImageView.h"

@interface RCCPeakableImageView ()

@property (nonatomic, strong, readwrite) UIImageView *RCC_imageView;

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
    self.RCC_imageView.image = image;

    // Update padding
    [self setPadding:self.padding];
}

- (void)setPadding:(CGPoint)padding
{
    // Store padding value
    _padding = padding;
    [self setNeedsLayout];
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    // Remove exising motion effects
    for (UIMotionEffect *effect in [self.RCC_imageView motionEffects]) {
        [self.RCC_imageView removeMotionEffect:effect];
    }

    // Add motion effects if there is any image.
    UIImage *image = self.RCC_imageView.image;
    if (image)
    {
        // Grow image view
        CGRect frame = self.bounds;
        CGRect paddingFrame = CGRectInset(frame, -ABS(self.padding.x), -ABS(self.padding.y));
        self.RCC_imageView.frame = paddingFrame;
        
        // Calculate offsets for motion effect
        UIImage *image = self.RCC_imageView.image;
        CGFloat horRatio = self.RCC_imageView.bounds.size.width / image.size.width;
        CGFloat vertRatio = self.RCC_imageView.bounds.size.height / image.size.height;
        CGFloat ratio = MAX(horRatio, vertRatio);
        CGSize aspectFillSize = CGSizeMake(image.size.width * ratio, image.size.height * ratio);
        CGFloat horPading =
        ABS((self.RCC_imageView.bounds.size.width - aspectFillSize.width) / 2.0f);
        horPading = horPading + ABS(self.padding.x / 2.0f);
        CGFloat vertPading =
        ABS((self.RCC_imageView.bounds.size.height - aspectFillSize.height) / 2.0f);
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
        [self.RCC_imageView addMotionEffect:horizMotionEffect];
        [self.RCC_imageView addMotionEffect:vertMotionEffect];
    }
}

# pragma mark - Priavte helpers (Setup)

- (void)RCC_setupView
{
  // Clip subviews
  self.clipsToBounds = YES;
  
  // Add image subview
  self.RCC_imageView = [[UIImageView alloc] initWithFrame:self.bounds];
  self.RCC_imageView.contentMode = UIViewContentModeScaleAspectFill;
  self.RCC_imageView.clipsToBounds = NO;
  [self addSubview:self.RCC_imageView];
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
