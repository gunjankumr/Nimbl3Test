
#import <Foundation/Foundation.h>
#import "APIPath.h"


// Enum (globaly used).
typedef enum {
    ServiceTypePOST = 0,
    ServiceTypeGET
} ServiceType;

@interface ServiceManager : NSObject

+ (void)service:(NSString *)serviceName Type:(ServiceType)type Param:(NSDictionary *)param Completion:(void (^)(BOOL success, NSArray *response, NSError *error))block ;

+ (void)postMultipart:(NSData *)data FileType:(NSString *)fileType ServiceName:(NSString *)serviceName Type:(ServiceType)type Param:(NSDictionary *)param Completion:(void (^)(BOOL success, NSArray *response, NSError *error))block  ;
@end
