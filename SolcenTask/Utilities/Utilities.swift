//
//  Utilities.swift
//  SolcenTask
//
//  Created by DhanuSH on 13/11/17.
//  Copyright © 2017 Dhanunjaya. All rights reserved.
//

import UIKit

class Utilities: NSObject {

    //Alert message
    static func infoAlert(_ title:String,viewController:UIViewController) -> Void {
        let actionSheetController: UIAlertController = UIAlertController(title:title, message:nil, preferredStyle: .alert)
        let cancelAction: UIAlertAction = UIAlertAction(title: Constants.FixedValues.OK, style: .cancel) { action -> Void in }
        actionSheetController.addAction(cancelAction)
        viewController.present(actionSheetController, animated: true, completion: nil)
    }
}
