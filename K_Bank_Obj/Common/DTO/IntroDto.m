//
//  IntroDto.m
//  K_Bank_Obj
//
//  Created by kiyoul on 11/7/24.
//

#import "IntroDto.h"

@implementation IntroDto


- (id)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.name = [dictionary objectForKey:@"name"];
        self.language = [dictionary objectForKey:@"language"];
        self.userId = [dictionary objectForKey:@"userId"];
        self.version = [dictionary objectForKey:@"version"];
    
    }
    return self;
}

@end
