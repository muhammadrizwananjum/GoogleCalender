//
//  HarvestHiveApp-Bridging-Header.h
//  HarvestHiveApp
//
//  Created by Tecocraft Tech on 16/12/17.
//  Copyright © 2017 Tecocraft Tech. All rights reserved.
//

#ifndef HarvestHiveApp_Bridging_Header_h
#define HarvestHiveApp_Bridging_Header_h

#define REGEX_Phone_Validate @"^\\d{3}-\\d{3}-\\d{4}$"
#define REGEX_GigName_LIMIT @"^.{0,255}$"
#define REGEX_Zipcode_LIMIT @"[0-9]{5}$"
#define REGEX_Licence_LIMIT @"[0-9]{8}$"
#define REGEX_USER_NAME_LIMIT @"^.{3,10}$"
#define REGEX_USER_NAME @"[A-Za-z0-9]{3,10}"
#define REGEX_EMAIL @"[A-Z0-9a-z._%+-]{3,}+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
#define REGEX_PASSWORD_LIMIT @"^.{6,20}$"
#define REGEX_PASSWORD @"[A-Za-z0-9]{6,20}"
#define REGEX_PHONE_DEFAULT @"\\([0-9]{3}\\)\\ [0-9]{3}\\-[0-9]{4}"

#import "Reachability.h"
#import "UIImageView+WebCache.h"
#import "SVProgressHUD.h"
#import "BEMCheckBox.h"
#import "TextFieldValidator.h"
#endif /* HarvestHiveApp_Bridging_Header_h */
