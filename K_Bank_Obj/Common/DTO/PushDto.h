//
//  PushDto.h
//  K_Bank_Obj
//
//  Created by kiyoul on 11/7/24.
//

#import <Foundation/Foundation.h>

@interface PushDto : NSObject

- (id)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, strong)NSString *title;
@property (nonatomic, strong)NSString *subtitle;

@end
