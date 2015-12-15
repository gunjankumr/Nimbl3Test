//
//  SurveyTableViewCell.m
//  Octave
//
//  Created by Sujeet on 12/14/15.
//  Copyright © 2015 Sujeet Sinha. All rights reserved.
//

#import "SurveyTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "Survey.h"

@implementation SurveyTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.btnTakeSurvey.layer.masksToBounds = YES;
    self.btnTakeSurvey.layer.cornerRadius = 14.0;
    [self.btnTakeSurvey setBackgroundColor:[UIColor redColor]];

}

- (void)resetUIWithSurvey:(Survey *)survey {
    
    self.btnTakeSurvey.tag = survey.surveyId;
    self.lblTitle.text = survey.title;
    self.lblDesc.text = survey.desc;
    
    [self.imgViewSurvey sd_setImageWithURL:[NSURL URLWithString:survey.coverImage] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {//... completion code here ...
        
        self.imgViewSurvey.image = image;
        self.lblTitle.layer.zPosition = 1;
        self.lblDesc.layer.zPosition = 1;
        self.btnTakeSurvey.layer.zPosition = 1;
    }];
}

#pragma mark - Action Methods
- (IBAction)moveToNewSurveyScreen:(id)sender {
    
    if(self.delegate && [(UIViewController *)self.delegate respondsToSelector:@selector(addNewSurvey)]) {
        [self.delegate addNewSurvey];
    }
}

@end
