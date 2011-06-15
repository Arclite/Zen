//
//  ZenView.m
//  Zen
//
//  Created by Geoff Pado on 6/14/11.
//  Copyright 2011 Cocoatype, LLC. All rights reserved.
//

#import "ZenView.h"
#import "NSImage+MGCropExtensions.h"

@implementation ZenView

@synthesize desktopImageView;

+ (BOOL)performGammaFade { return NO; }

- (id)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/30.0];

		//create the image view that holds the desktop image
		desktopImageView = [[NSImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, [self frame].size.width, [self frame].size.height)];
		[self addSubview:desktopImageView];
    }
    return self;
}

- (void)viewWillMoveToWindow:(NSWindow *)newWindow
{
	if (newWindow != nil) {
		NSWorkspace *mainWorkspace = [NSWorkspace sharedWorkspace];
		//find out what screen we're on
		NSScreen *desktopScreen = [newWindow screen];
		
		//get the desktop image
		NSURL *desktopImageURL = [mainWorkspace desktopImageURLForScreen:desktopScreen];
		NSImage *desktopImage = [[[NSImage alloc] initWithContentsOfURL:desktopImageURL] autorelease];
		desktopImage = [desktopImage imageCroppedToFitSize:[self bounds].size];
		
		//make sure our image view scales correctly
		[[self desktopImageView] setImageScaling:[[[mainWorkspace desktopImageOptionsForScreen:desktopScreen] objectForKey:NSWorkspaceDesktopImageScalingKey] unsignedIntegerValue]];
		
		//set the desktop image to our image view
		[[self desktopImageView] setImage:desktopImage];
	}
}

- (void)startAnimation
{
	[super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
}

- (void)animateOneFrame
{
    return;
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

@end
