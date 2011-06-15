//
//  ZenView.h
//  Zen
//
//  Created by Geoff Pado on 6/14/11.
//  Copyright 2011 Cocoatype, LLC. All rights reserved.
//

#import <ScreenSaver/ScreenSaver.h>

@interface ZenView : ScreenSaverView
{
	NSImageView *desktopImageView;
}

@property (retain) NSImageView *desktopImageView;

@end
