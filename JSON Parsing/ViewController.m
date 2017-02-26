//
//  ViewController.m
//  JSON Parsing
//
//  Created by Raj Dhakate on 06/02/17.
//  Copyright © 2017 CodeBlood. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self parseJSON];
}



#pragma mark - For Creating Session for retriving data
- (void) downloadDataFromURL:(NSURL*)url withCompletionHandler:(void(^)(NSData* data))completionHandler
{
    
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
    {
        
        [[NSOperationQueue mainQueue]addOperationWithBlock:^{
            completionHandler(data);
        }];
        
    }];
    
    
    [task resume];
    
}



#pragma mark - Parsing Data
- (void) parseJSON
{
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.geonames.org/postalCodeCountryInfoJSON?formatted=true&&username=demo&style=full"]];
    
    [self downloadDataFromURL:url withCompletionHandler:^(NSData *data) {
        if (data != nil)
        {
            
            NSError *error;
            NSMutableDictionary *countrysDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
            
            
            NSMutableArray *countrysArray = countrysDictionary[@"geonames"];
            
            NSLog(@"%@", countrysArray);
            
            
            for (NSDictionary *countryDetailsDictionary in countrysArray)
            {
                NSLog(@"%@ : %@", countryDetailsDictionary[@"countryName"], countryDetailsDictionary[@"countryCode"] );
                
            }
             
        }
    }];
}




@end
