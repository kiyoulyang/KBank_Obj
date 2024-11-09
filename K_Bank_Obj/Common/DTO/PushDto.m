//
//  PushDto.m
//  K_Bank_Obj
//
//  Created by kiyoul on 11/7/24.
//

#import "PushDto.h"

@implementation PushDto

- (id)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.title = [dictionary objectForKey:@"title"];
        self.subtitle = [dictionary objectForKey:@"subtitle"];
 
    
    }
    return self;
}

@end
