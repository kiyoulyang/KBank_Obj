//
//  SettingDto.h
//  K_Bank_Obj
//
//  Created by kiyoul on 11/7/24.
//

#import <Foundation/Foundation.h>

@interface SettingDto : NSObject

- (id)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, strong)NSString *type;
@property (nonatomic, strong)NSString *title;


@end
