//
//  SettingCell.h
//  K_Bank_Obj
//
//  Created by kiyoul on 11/7/24.
//

#import <UIKit/UIKit.h>

@interface SettingCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *subtitle;
@property (weak, nonatomic) IBOutlet UILabel *detailBtn;

@property (weak, nonatomic) IBOutlet UILabel *mainTitle;
@property (weak, nonatomic) IBOutlet UISwitch *switchBt;



@end
