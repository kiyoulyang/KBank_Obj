//
//  PushViewController.m
//  K_Bank_Obj
//
//  Created by kiyoul on 11/7/24.
//

#import "PushViewController.h"
#import "RequestController.h"
#import "ParserClass.h"
#import "PushCell.h"
#import "PushDto.h"

@interface PushViewController ()

@end

@implementation PushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setHidden:true];
    
    [self requestPushData];
}

- (void)requestPushData{
    RequestController *requestController = [[RequestController alloc] init];
    
    [requestController reqWithMethod:@"https://kbank.com/push" completionHandler:^(NSData *data ,NSString *resultCd ,NSString *error){
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
    
    if ([parserClass arrayData].count > 0){
        [self showViewData:parserClass];
    }
}
- (void)showViewData:(ParserClass *)sender{
    NSMutableArray *parsingList = [[NSMutableArray alloc] init];
    
    for (NSDictionary *data in sender.arrayData) {
        PushDto *pushDto = [[PushDto alloc] initWithDictionary:data];
        [parsingList addObject:pushDto];
    }
    
    self.tableList = [[NSArray alloc] initWithArray:parsingList];
    [self.tableView reloadData];
    NSLog(@"show push");
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80.0f;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[self tableList] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"PushCell";
    PushCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];

    if (cell == nil) {
        cell = [[PushCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }

    PushDto *pushDto   = [[self tableList] objectAtIndex:indexPath.row];
    cell.mainTitle.text     = [pushDto title];
    cell.subtitle.text      = [pushDto subtitle];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
