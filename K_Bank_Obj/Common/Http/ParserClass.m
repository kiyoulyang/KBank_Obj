//
//  ParserClass.m
//  K_Bank_Obj
//
//  Created by kiyoul on 11/7/24.
//

#import "ParserClass.h"

@implementation ParserClass

- (void)jsonParsingData:(NSData *)sender{
    
    self.dicData = [[NSDictionary alloc] init];
    self.arrayData = [[NSArray alloc] init];
    
    NSString* str = [[NSString alloc] initWithData:sender encoding:NSUTF8StringEncoding];
    NSLog(@"data : %@",str);
    
    NSError *e = nil;
    id jsonData = [NSJSONSerialization JSONObjectWithData: sender options: NSJSONReadingMutableContainers error: &e];

    if ([jsonData isKindOfClass:[NSArray class]]){
        self.arrayData = jsonData;
    }else if ([jsonData isKindOfClass:[NSDictionary class]]){
        self.dicData = jsonData;
    }else{
        NSLog(@"ERROR");
    }
}


@end
