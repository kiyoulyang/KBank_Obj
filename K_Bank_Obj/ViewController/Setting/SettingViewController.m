//
//  SettingViewController.m
//  K_Bank_Obj
//
//  Created by kiyoul on 11/7/24.
//

#import "SettingViewController.h"
#import "RequestController.h"
#import "ParserClass.h"
#import "SettingCell.h"
#import "SettingDto.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setHidden:true];

    [self requestSettingData];
}

- (void)requestSettingData{
    // 서버통신 모듈
    RequestController *requestController = [[RequestController alloc] init];
    [requestController reqWithMethod:@"https://kbank.com/setting" completionHandler:^(NSData *data ,NSString *resultCd ,NSString *error){
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
    // 서버 통신 파싱
    ParserClass *parserClass = [[ParserClass alloc] init];
    [parserClass jsonParsingData:data];
    
    if ([parserClass arrayData].count > 0){
        [self showViewData:parserClass];
    }
}

- (void)showViewData:(ParserClass *)sender{
    //통신데이터를 파싱후 처리
    NSMutableArray *parsingList = [[NSMutableArray alloc] init];
    for (NSDictionary *data in sender.arrayData) {
        SettingDto *settingDto = [[SettingDto alloc] initWithDictionary:data];
        [parsingList addObject:settingDto];
    }
    self.tableList = [[NSArray alloc] initWithArray:parsingList];
    [self.tableView reloadData];
    NSLog(@"show setting");
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80.0f;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSLog(@"%lu",(unsigned long)[[self tableList] count]);
    
    return [[self tableList] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"SettingCell";
    SettingCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];

    if (cell == nil) {
        cell = [[SettingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }

    [cell.mainTitle setHidden:true];
    [cell.subtitle setHidden:true];
    [cell.switchBt setHidden:true];
    [cell.detailBtn setHidden:true];

    SettingDto *settingDto = [[self tableList] objectAtIndex:indexPath.row];
    
    if ([[settingDto type] isEqual:@"title"]){
        [cell.mainTitle setHidden:false];
        cell.mainTitle.text = [settingDto title];
    }else if ([[settingDto type] isEqual:@"content"]){
        [cell.subtitle setHidden:false];
        [cell.detailBtn setHidden:false];
        cell.subtitle.text = [settingDto title];
    }else if ([[settingDto type] isEqual:@"switch"]){
        [cell.subtitle setHidden:false];
        [cell.switchBt setHidden:false];
        cell.subtitle.text = [settingDto title];
    }

    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self performSegueWithIdentifier:@"PushViewController" sender:nil];
}



@end

