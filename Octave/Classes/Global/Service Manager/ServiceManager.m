

#import "ServiceManager.h"
#import "AFNetworking.h"


@implementation ServiceManager


+ (void)service:(NSString *)serviceName Type:(ServiceType)type Param:(NSDictionary *)param Completion:(void (^)(BOOL success, NSArray *response, NSError *error))block {
   
    AFHTTPRequestOperationManager *reqManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseURL]];
    reqManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    if (type == ServiceTypeGET) {
        
        [reqManager GET:serviceName parameters:param success:^void(AFHTTPRequestOperation * op, id responseObject) {
            
            NSArray *resp = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error: nil];
            if (block) block(YES, resp, nil);
            
        } failure:^void(AFHTTPRequestOperation * op, NSError * error) {
             if (block) block(YES, nil, error);
            
        }];
        
    } else if (type == ServiceTypePOST) {
        
        [reqManager POST:serviceName parameters:param constructingBodyWithBlock:nil success:^void(AFHTTPRequestOperation * op, id responseObject) {
            
            NSArray *resp = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error: nil];
            if (block) block(YES, resp, nil);
            
        } failure:^void(AFHTTPRequestOperation * op, NSError * error) {
            
             if (block) block(YES, nil, error);
            
        }];
    }
}

+ (void)postMultipart:(NSData *)data FileType:(NSString *)fileType ServiceName:(NSString *)serviceName Type:(ServiceType)type Param:(NSDictionary *)param Completion:(void (^)(BOOL success, NSArray *response, NSError *error))block {
    
    if(!data) {
        [ServiceManager service:serviceName Type:ServiceTypePOST Param:param Completion:block];
        return;
    }
    
    AFHTTPRequestOperationManager *reqManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseURL]];
    reqManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", nil];
    

    [reqManager POST:serviceName parameters:param constructingBodyWithBlock:^void(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:data name:fileType fileName:@"userName.png" mimeType:@"image/png"];
        
    } success:^void(AFHTTPRequestOperation * op, id response) {
        // call your own block code.

        //NSDictionary *resp = [NSJSONSerialization JSONObjectWithData:response options:0 error: nil];
        
        if (block) {
            block(true, response,nil);
        }
        
    } failure:^void(AFHTTPRequestOperation * op, NSError * error) {

        if (block) {
            block(false, nil,error);

        }
    }];
}
@end
