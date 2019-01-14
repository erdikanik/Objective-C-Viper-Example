//
//  ILNetworkManager.m
//  ImageLister
//
//  Created by Erdi Kanik on 19.11.2017.
//  Copyright © 2017 Erdi Kanik. All rights reserved.
//

#import "ILNetworkManager.h"
#import "ILRequestProtocol.h"
#import "ILResponseProtocol.h"

static NSString *kAppUrl = @"https://s3-eu-west-1.amazonaws.com/developer-application-test";
static NSString *kRequestMethod = @"GET";

@interface ILNetworkManager()<NSURLSessionDelegate>

@property (strong, nonatomic) NSURLSessionDataTask *dataTask;

@end

@implementation ILNetworkManager

+ (instancetype)sharedManager
{
    static ILNetworkManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[ILNetworkManager alloc] init];
    });
    return sharedManager;
}

- (void)connectWithGETMethod:(id<ILRequestProtocol>)request
               responseClass:(Class)responseClass
                  completion:(void(^)(id<ILResponseProtocol>, NSError *))completion
{
    NSURL *url = [NSURL URLWithString:[kAppUrl stringByAppendingString:request.requestUrl]];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];

    [urlRequest setHTTPMethod:kRequestMethod];
    [urlRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [urlRequest setValue:@"application/json" forHTTPHeaderField:@"Accept"];

    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];

    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    self.dataTask = [session dataTaskWithRequest: urlRequest
                               completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable urlResponse, NSError * _Nullable error) {

        if (completion != nil)
        {
            id<ILResponseProtocol> response = [[responseClass alloc] init];

            NSError *error;
            NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            [response loadObjectDictionary:dictionary];
            completion(response, error);
        }
    }];
    [self.dataTask resume];
}

@end
