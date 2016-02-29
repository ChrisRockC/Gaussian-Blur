//
//  ViewController.m
//  Gaussian-blur
//
//  Created by chenchao on 16/2/29.
//  Copyright © 2016年 iOS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"高斯模糊";
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2"]];
    imageView.frame = CGRectMake(0,200,self.view.frame.size.width,200);
    [self.view addSubview:imageView];
    
    
    [self createBlurBackgroundWithImage:[UIImage imageNamed:@"2"] view:imageView blurRadius:50];
    
}

-(void)createBlurBackgroundWithImage:(UIImage *)image view:(UIView *)view blurRadius:(CGFloat)blurRadius{
    //1. 处理原始的NSData 数据
    CIImage *originImage = [[CIImage alloc] initWithCGImage:image.CGImage];
    
    //2. 创建高斯模糊滤镜
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:originImage forKey:kCIInputImageKey];
    [filter setValue:[NSNumber numberWithFloat:blurRadius] forKey:@"inputRadius"];
    
    //3. 生成模糊图片
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *result = [filter valueForKey:kCIOutputImageKey];
    UIImage *blurImage = [UIImage imageWithCGImage:[context createCGImage:result fromRect:result.extent]];
    
    //4. 将模糊图片加入背景
    CGFloat w = self.view.frame.size.width;
    CGFloat h = self.view.frame.size.height;
    
    UIImageView *blurImageView = [[UIImageView alloc] initWithFrame:CGRectMake(-w/2, -h/2, w*2, h*2)];
    blurImageView.contentMode = UIViewContentModeScaleAspectFill; // 图片填充ImageView
    // 保持原图长宽比
    blurImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    blurImageView.image = blurImage;
    
    // 保证模糊背景在原图片view的下层
    [self.view insertSubview:blurImageView belowSubview:view];
    
    
}
@end
