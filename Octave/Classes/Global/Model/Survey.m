//
//  Survey.m
//  Octave
//
//  Created by Sujeet Sinha on 15/12/15.
//  Copyright © 2015 Sujeet Sinha. All rights reserved.
//

#import "Survey.h"

@implementation Survey

+(Survey *)surveyWithDictionary:(NSDictionary *)dict {
    
    Survey *sur = [[Survey alloc] init];
    sur.coverImage = [dict valueForKey:@"cover_image_url"];
    sur.desc = [dict valueForKey:@"description"];
    sur.title = [dict valueForKey:@"title"];

    return sur;
}

@end
