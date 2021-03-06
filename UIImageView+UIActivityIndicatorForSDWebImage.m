//
//  UIImageView+UIActivityIndicatorForSDWebImage.m
//  UIActivityIndicator for SDWebImage
//
//  Created by Giacomo Saccardo.
//  Copyright (c) 2013 Giacomo Saccardo. All rights reserved.
//

#import "UIImageView+UIActivityIndicatorForSDWebImage.h"
#import <AFNetworking/AFNetworkActivityIndicatorManager.h>

#define TAG_ACTIVITY_INDICATOR 149462

@interface UIImageView (Private)

-(void)createActivityIndicatorWithStyle:(UIActivityIndicatorViewStyle) activityStyle;
-(void)removeActivityIndicator;

@end


@implementation UIImageView (UIActivityIndicatorForSDWebImage)

-(void) createActivityIndicatorWithStyle:(UIActivityIndicatorViewStyle) activityStyle {
    
    UIActivityIndicatorView *activityIndicator = (UIActivityIndicatorView *)[self viewWithTag:TAG_ACTIVITY_INDICATOR];
    if (activityIndicator == nil) {
        activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:activityStyle];
        activityIndicator.translatesAutoresizingMaskIntoConstraints = NO;
        activityIndicator.hidesWhenStopped = YES;
        activityIndicator.tag = TAG_ACTIVITY_INDICATOR;
        [self addSubview:activityIndicator];
        
        // center it
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                         attribute:NSLayoutAttributeCenterX
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:activityIndicator
                                                         attribute:NSLayoutAttributeCenterX
                                                        multiplier:1
                                                          constant:0]];
                                                          
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                         attribute:NSLayoutAttributeCenterY
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:activityIndicator
                                                         attribute:NSLayoutAttributeCenterY
                                                        multiplier:1
                                                          constant:0]];
    }
    
    [activityIndicator startAnimating];

    [[AFNetworkActivityIndicatorManager sharedManager] incrementActivityCount];
}

-(void) removeActivityIndicator {
    
    UIActivityIndicatorView *activityIndicator = (UIActivityIndicatorView *)[self viewWithTag:TAG_ACTIVITY_INDICATOR];
    if (activityIndicator) {
        [activityIndicator removeFromSuperview];
    }

    [[AFNetworkActivityIndicatorManager sharedManager] decrementActivityCount];    
}

#pragma mark - Methods


-(void) setImageWithURL:(NSURL *)url usingActivityIndicatorStyle:(UIActivityIndicatorViewStyle)activityStyle {
    
    [self createActivityIndicatorWithStyle:activityStyle];
    
    __weak typeof(self) weakSelf = self;
    [self sd_setImageWithURL:url
                   completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                       [weakSelf removeActivityIndicator];
                   }
     ];
}

-(void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder usingActivityIndicatorStyle:(UIActivityIndicatorViewStyle)activityStye {
    
    [self createActivityIndicatorWithStyle:activityStye];
    
    __weak typeof(self) weakSelf = self;
    [self sd_setImageWithURL:url
            placeholderImage:placeholder
                   completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                       [weakSelf removeActivityIndicator];
                   }
     ];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options usingActivityIndicatorStyle:(UIActivityIndicatorViewStyle)activityStyle{

    [self createActivityIndicatorWithStyle:activityStyle];
    
    __weak typeof(self) weakSelf = self;
    [self sd_setImageWithURL:url
            placeholderImage:placeholder
                     options:options
                   completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                       [weakSelf removeActivityIndicator];
                   }
    ];
}

- (void)setImageWithURL:(NSURL *)url completed:(SDWebImageCompletionBlock)completedBlock usingActivityIndicatorStyle:(UIActivityIndicatorViewStyle)activityStyle {

    [self createActivityIndicatorWithStyle:activityStyle];
    
    __weak typeof(self) weakSelf = self;
    [self sd_setImageWithURL:url
                   completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                       completedBlock(image, error, cacheType, imageURL);
                       [weakSelf removeActivityIndicator];
                   }
    ];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(SDWebImageCompletionBlock)completedBlock usingActivityIndicatorStyle:(UIActivityIndicatorViewStyle)activityStyle {

    [self createActivityIndicatorWithStyle:activityStyle];
    
    __weak typeof(self) weakSelf = self;
    [self sd_setImageWithURL:url
            placeholderImage:placeholder
                   completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                       completedBlock(image, error, cacheType, imageURL);
                       [weakSelf removeActivityIndicator];
                   }
    ];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options completed:(SDWebImageCompletionBlock)completedBlock usingActivityIndicatorStyle:(UIActivityIndicatorViewStyle)activityStyle {

    [self createActivityIndicatorWithStyle:activityStyle];
    
    __weak typeof(self) weakSelf = self;
    [self sd_setImageWithURL:url
            placeholderImage:placeholder
                     options:options
                   completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                       completedBlock(image, error, cacheType, imageURL);
                       [weakSelf removeActivityIndicator];
                   }
    ];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options progress:(SDWebImageDownloaderProgressBlock)progressBlock completed:(SDWebImageCompletionBlock)completedBlock usingActivityIndicatorStyle:(UIActivityIndicatorViewStyle)activityStyle {

    [self createActivityIndicatorWithStyle:activityStyle];
    
    __weak typeof(self) weakSelf = self;
    [self sd_setImageWithURL:url
            placeholderImage:placeholder
                     options:options
                    progress:progressBlock
                   completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                       completedBlock(image, error, cacheType, imageURL);
                       [weakSelf removeActivityIndicator];
                   }
    ];
}


@end
