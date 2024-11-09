//
//  SettingViewController.h
//  K_Bank_Obj
//
//  Created by kiyoul on 11/7/24.
//

#import <UIKit/UIKit.h>


@interface SettingViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, retain)NSArray *tableList;

@end
