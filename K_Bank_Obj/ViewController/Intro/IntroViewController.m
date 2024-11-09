//
//  IntroViewController.m
//  K_Bank_Obj
//
//  Created by kiyoul on 11/7/24.
//

#import "IntroViewController.h"
#import "RequestController.h"
#import "ParserClass.h"
#import "IntroDto.h"

@interface IntroViewController ()

@end

@implementation IntroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setHidden:true];
    
    [self checkIntroData];
}

- (void)checkIntroData{
    RequestController *requestController = [[RequestController alloc] init];
    
    [requestController reqWithMethod:@"https://kbank.com/intro" completionHandler:^(NSData *data ,NSString *resultCd ,NSString *error){
        if (error == nil){
            if (data.length > 0){
                [self dataParsing:data];
            }else{
                NSLog(@"파라미터 오류");
            }
        }else{
            NSLog(@"통신 오류");
        }
    }];
    
}

- (void)dataParsing:(NSData *)data{
    ParserClass *parserClass = [[ParserClass alloc] init];
    [parserClass jsonParsingData:data];
    
    if ([parserClass dicData].count > 0){
        [self showViewData:parserClass];
    }
}

- (void)showViewData:(ParserClass *)sender{
    IntroDto *introDto = [[IntroDto alloc] initWithDictionary:sender.dicData];
    [self moveSettingView];
}

- (void)moveSettingView{
    // 업데이트 체크 등
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [self performSegueWithIdentifier:@"SettingViewController" sender:nil];
    });
}

@end
