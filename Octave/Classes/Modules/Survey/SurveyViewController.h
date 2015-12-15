//
//  SurveyViewController.h
//  Octave
//
//  Created by Sujeet Sinha on 13/12/15.
//  Copyright (c) 2015 Sujeet Sinha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SurveyViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
	NSMutableArray *arrSurveyFinalResult;
	__weak IBOutlet UITableView *tblSurvey;
	__weak IBOutlet UIPageControl *pageControlSurvey;
}


@end
