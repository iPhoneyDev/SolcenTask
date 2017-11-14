//
//  Constants.swift
//  SolcenTask
//
//  Created by DhanuSH on 13/11/17.
//  Copyright © 2017 Dhanunjaya. All rights reserved.
//

import UIKit

class Constants: NSObject {

    struct APIs {
        static let BASE_COMMAN_URL =  "https://api.guildwars2.com/v2/achievements"
        static let GROUPS  = BASE_COMMAN_URL + "/groups/"
        static let CATEGORIES  = BASE_COMMAN_URL + "/categories?ids="
        static let ACHIEVEMENTS  = BASE_COMMAN_URL + "?ids="
    }
    
    struct FixedValues {
        static let GROUPS_ID  = "65B4B678-607E-4D97-B458-076C3E96A810"
        static let OK  = "OK"
        static let TRY_AGAIN  = "Try Again"
        static let COUNT  = "count"
        static let POINTS  = "points"
        static let TYPE  = "Type"
        static let REWARDS  = "Rewards"
        static let REGION  = "Region"
        static let FLAGS  = "Flags"
        static let TIERS  = "Tiers"        
    }
}
