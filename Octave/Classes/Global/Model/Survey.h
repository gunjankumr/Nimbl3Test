//
//  Survey.h
//  Octave
//
//  Created by Sujeet Sinha on 15/12/15.
//  Copyright © 2015 Sujeet Sinha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Survey : NSObject


@property (nonatomic, assign) NSInteger surveyId;
@property (nonatomic, strong) NSString *coverImage;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *title;

+(Survey *)surveyWithDictionary:(NSDictionary *)dict ;

@end
