//
//  RequestController.m
//  K_Bank_Obj
//
//  Created by kiyoul on 11/7/24.
//

#import "RequestController.h"

@implementation RequestController

- (void)reqWithMethod:(NSString *)url completionHandler:(NetworkResultBlock)handler {
    
    // 통신 모듈
    NSString *targetUrl = [NSString stringWithFormat:@"%@", url];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:targetUrl]];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *taskData, NSURLResponse *response, NSError *error) {
        NSString *responseStr = [[NSString alloc] initWithData:taskData encoding:NSUTF8StringEncoding];
        NSLog(@">>>>>>>> %@",responseStr);
    
    }];
    [dataTask resume];

    
    // 통신 처리 테스트를 위한 1초 딜레이
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{

        if ([url containsString:@"intro"]){
            NSString *json = @"{\"name\": \"intro\",\"language\": \"swift\",\"userId\": \"kbank\",\"version\": \"1.0.0\"}";
            NSData *data = [json dataUsingEncoding:NSUTF8StringEncoding];
            handler(data,@"",nil);
        }else if ([url containsString:@"setting"]){
            NSString *json = @"[{\"type\":\"title\",\"title\":\"알림설정\"},{\"type\":\"content\",\"title\":\"입출금및서비스피드\"},{\"type\":\"title\",\"title\":\"보기모드\"},{\"type\":\"switch\",\"title\":\"간편홈\"},{\"type\":\"switch\",\"title\":\"통합검색계좌내역\"},{\"type\":\"title\",\"title\":\"로그인\"},{\"type\":\"content\",\"title\":\"아이디.비밀번호변경\"},{\"type\":\"content\",\"title\":\"PC로그인\"},{\"type\":\"title\",\"title\":\"서비스설정\"},{\"type\":\"content\",\"title\":\"오픈뱅킹\"},{\"type\":\"content\",\"title\":\"기가지니\"},{\"type\":\"title\",\"title\":\"앱관리\"},{\"type\":\"content\",\"title\":\"앱버전(1.0.0)\"},{\"type\":\"content\",\"title\":\"캐시\"},{\"type\":\"content\",\"title\":\"회원탈퇴\"}]";
            NSData *data = [json dataUsingEncoding:NSUTF8StringEncoding];
            handler(data,@"",nil);
        }else if ([url containsString:@"push"]){
            NSString *json = @"[{\"title\":\"금융혜택\",\"subtitle\":\"금융상품 추천, 이벤트 등 다양한 소식 안내\"},{\"title\":\"머니톡\",\"subtitle\":\"돈되는 이야기 무료 구독하기\"},{\"title\":\"예적금 만기일\",\"subtitle\":\"만기 하루 전 알림 안내\"},{\"title\":\"자동이체 종료일\",\"subtitle\":\"설정한 자동이제 종료 전일 알림 안내\"},{\"title\":\"자동납부, 결제 출금\",\"subtitle\":\"설정한 자동납부, 결제 금액 관련 안내\"},{\"title\":\"보안 및 중요사항\",\"subtitle\":\"비밀번호 변경 및 휴대폰 OTP등 보안 안내\"},{\"title\":\"내 신용관리\",\"subtitle\":\"내 신용정보 변동사항 안내\"},{\"title\":\"우리집 변동알림\",\"subtitle\":\"시세 및 등기정보 관련 변동사항 안내\"}]";
            NSData *data = [json dataUsingEncoding:NSUTF8StringEncoding];
            handler(data,@"",nil);
        }
    });
    
    
    
}


@end
