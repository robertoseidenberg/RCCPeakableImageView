// Apple
@import UIKit;

@interface RCCPeakableImageView : UIImageView

/**
 * The image displayed in the image view.
 */
@property (nonatomic, strong, readwrite) UIImage *image;

/**
 * Scales the image up by the given padding values.
 * Use this property to apply a slight "peek" value to 
 * an image even if fits perfectly into the view bounds.
 * Default value is (0,0)
 */
@property (nonatomic, assign, readwrite) CGPoint padding;

@end
