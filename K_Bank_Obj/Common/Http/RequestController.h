//
//  RequestController.h
//  K_Bank_Obj
//
//  Created by kiyoul on 11/7/24.
//

#import <Foundation/Foundation.h>

typedef void (^NetworkResultBlock)(NSData *data, NSString *resultCd, NSString *error);

@interface RequestController : NSObject

- (void)reqWithMethod:(NSString *)url completionHandler:(NetworkResultBlock)handler;

@end
