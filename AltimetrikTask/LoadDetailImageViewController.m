//
//  LoadDetailImageViewController.m
//  AltimetrikTask
//
//  Created by ANKUR on 13/12/14.
//  Copyright (c) 2014 ANKUR SHIVANI. All rights reserved.
//

#import "LoadDetailImageViewController.h"

@interface LoadDetailImageViewController () {
    IBOutlet UIImageView *fullImage;
}

@end

@implementation LoadDetailImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"Fullsize Image";
    [self loadImageOnScreen];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadImageOnScreen {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://s10.postimg.org/52vthezud/static_Image.png"]]];
        if (imgData) {
            UIImage *image = [UIImage imageWithData:imgData];
            if (image) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    fullImage.image = image;
                });
            }
        }
    });
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
