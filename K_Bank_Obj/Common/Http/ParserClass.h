//
//  ParserClass.h
//  K_Bank_Obj
//
//  Created by kiyoul on 11/7/24.
//

#import <Foundation/Foundation.h>

@interface ParserClass : NSObject

@property (nonatomic, retain)NSDictionary *dicData;
@property (nonatomic, retain)NSArray *arrayData;

- (void)jsonParsingData:(NSData *)sender;

@end
