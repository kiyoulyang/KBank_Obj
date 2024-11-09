//
//  IntroDto.h
//  K_Bank_Obj
//
//  Created by kiyoul on 11/7/24.
//

#import <Foundation/Foundation.h>

@interface IntroDto : NSObject

- (id)initWithDictionary:(NSDictionary *)dictionary ;

@property (nonatomic, strong)NSString *name;
@property (nonatomic, strong)NSString *language;
@property (nonatomic, strong)NSString *userId;
@property (nonatomic, strong)NSString *version;

@end
