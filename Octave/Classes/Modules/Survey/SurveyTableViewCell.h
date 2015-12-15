//
//  SurveyTableViewCell.h
//  Octave
//
//  Created by Sujeet on 12/14/15.
//  Copyright © 2015 Sujeet Sinha. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SurveyTableViewCellDelegate

@optional
- (void)addNewSurvey;

@end

@class Survey;

@interface SurveyTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgViewSurvey;
@property (weak, nonatomic) IBOutlet UIButton *btnTakeSurvey;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblDesc;
@property (weak, nonatomic) id <SurveyTableViewCellDelegate> delegate;


- (void)resetUIWithSurvey:(Survey *)survey ;

@end
