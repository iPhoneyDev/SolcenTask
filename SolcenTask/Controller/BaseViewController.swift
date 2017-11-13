//
//  BaseViewController.swift
//  SolcenTask
//
//  Created by DhanuSH on 13/11/17.
//  Copyright © 2017 Dhanunjaya. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController,ApiModelDelgate {

    let apiModel = ApiModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        apiModel.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //API delegate methods
    func didApiSuccess(response: Any) {
        //Subclasses can override this method
    }
    func didApiFailure(error: String) {
        //Subclasses can override this method
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
