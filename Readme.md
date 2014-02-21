## RCCPeakableImageView

Implementation of a "peekable" thumbnail image as shown 
at the [Flag Kickstarter Project](https://www.kickstarter.com/projects/1306413684/flag-the-app-that-prints-and-mails-your-photos-for)

![ ](Documentation/images/imageview.gif)

#### Features

Automatically fills the image view with the image and adjusts "peeking" according to the image size. "Peeking" means: remaining potions of the image will be scrolled to the visible view area as you tilt your phone.

Build and run the sample app to see it in action.

#### Usage

```
	// Load image
    UIImage *image = [UIImage imageNamed:@"myImage.jpg"];

    // Setup "peekable" image view
    RCCPeakableImageView *view = [[RCCPeakableImageView alloc] initWithFrame:frame];
    view.image = image;
    
    // Optinally add somme default "peek" 
    // this prevents the image from beeing static
    // even if it fits perfectly inside the view bounds
    view.padding = CGPointMake(20.0f, 20.0f);

```

#### Requirements

* iOS 7.0
* "Reduce Motion" disabled in Settings > General > Accessibility
* ARC

#### Acknowledgements

All images used in the sample app found at [Unsplash](http://unsplash.com/)