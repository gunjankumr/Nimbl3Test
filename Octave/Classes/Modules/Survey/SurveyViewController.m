//
//  SurveyViewController.m
//  Octave
//
//  Created by Sujeet Sinha on 13/12/15.
//  Copyright (c) 2015 Sujeet Sinha. All rights reserved.
//

#import "SurveyViewController.h"
#import "ServiceManager.h"
#import "NewSurveyViewController.h"
#import "AppDelegate.h"
#import "SurveyTableViewCell.h"
#import "Survey.h"
#import <SDWebImage/UIImageView+WebCache.h>

#define KEY @"6eebeac3dd1dc9c97a06985b6480471211a777b39aa4d0e03747ce6acc4a3369"

@interface SurveyViewController () <SurveyTableViewCellDelegate>

@end

@implementation SurveyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    arrSurveyFinalResult = [[NSMutableArray alloc] init];
    
    [self initUI];
    [self getAllSurveys];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

-(void)viewDidLayoutSubviews
{
	if ([tblSurvey respondsToSelector:@selector(setSeparatorInset:)]) {
		[tblSurvey setSeparatorInset:UIEdgeInsetsZero];
	}
	
	if ([tblSurvey respondsToSelector:@selector(setLayoutMargins:)]) {
		[tblSurvey setLayoutMargins:UIEdgeInsetsZero];
	}
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
	if (arrSurveyFinalResult) {
		arrSurveyFinalResult = nil;
	}
}

#pragma mark - Private Methods

- (void)initUI {
    self.title = @"SURVEYS";
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:16.0/255.0 green:19.0/255.0 blue:36.0/255.0 alpha:1.0];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    self.navigationController.navigationBar.translucent = NO;
    CGAffineTransform rotateTable = CGAffineTransformMakeRotation(M_PI_2);
    
    pageControlSurvey.transform = rotateTable;
    pageControlSurvey.numberOfPages = 0;

}

- (void)getAllSurveys {
    [arrSurveyFinalResult removeAllObjects];
    
	AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
	[appDelegate showHUDWithTitle:NSLocalizedString(@"Loading...", nil) withSubTitle:NSLocalizedString(@"Please wait...", nil)];
    NSDictionary *param = [NSDictionary dictionaryWithObject:KEY forKey:@"access_token"];
    
    [ServiceManager service:kAllSurveys Type:ServiceTypeGET Param:param Completion:^(BOOL success, NSArray *response, NSError *error) {

        [appDelegate killHUD];
        
        for (NSDictionary *dict in response)
            [arrSurveyFinalResult addObject:[Survey surveyWithDictionary:dict]];

		pageControlSurvey.numberOfPages = [arrSurveyFinalResult count];
		[tblSurvey reloadData];
    }];
	
}


#pragma mark - Action Methods
- (IBAction)refreshSurvey:(id)sender {
    [self getAllSurveys];
}

#pragma mark UITableView delegate methods
#pragma mark-
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
		// Return the number of sections.
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [arrSurveyFinalResult count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	NSLog(@"Frame %f",self.view.frame.size.height+self.view.frame.origin.y);
	return self.view.frame.size.height+self.view.frame.origin.y;
	
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	pageControlSurvey.currentPage = indexPath.row;
	static NSString *cellIdentifier = @"SurveyTableViewCell";
	
	SurveyTableViewCell *cell = (SurveyTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	if (cell == nil) {
		
		UIViewController *controller = [[UIViewController alloc] initWithNibName:cellIdentifier bundle:nil];
		cell = (SurveyTableViewCell *)controller.view;
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	}
    cell.delegate = self;
	
    Survey *survey = [arrSurveyFinalResult objectAtIndex:indexPath.row];
 
    survey.surveyId = indexPath.row;
    [cell resetUIWithSurvey:survey];
    
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	return cell;
}


-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
	if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
		[cell setSeparatorInset:UIEdgeInsetsZero];
	}
	
	if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
		[cell setLayoutMargins:UIEdgeInsetsZero];
	}
}


#pragma mark - SurveyTableViewCellDelegate
- (void)addNewSurvey {
    NewSurveyViewController *newS = [self.storyboard instantiateViewControllerWithIdentifier:@"NewSurveyViewController"];
    [self.navigationController pushViewController:newS animated:YES];
}

@end
