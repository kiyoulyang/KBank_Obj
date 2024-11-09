//
//  SettingDto.m
//  K_Bank_Obj
//
//  Created by kiyoul on 11/7/24.
//

#import "SettingDto.h"

@implementation SettingDto

- (id)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.type = [dictionary objectForKey:@"type"];
        self.title = [dictionary objectForKey:@"title"];
    
    }
    return self;
}

@end
