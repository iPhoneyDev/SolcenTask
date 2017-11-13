//
//  ViewController.swift
//  SolcenTask
//
//  Created by DhanuSH on 08/11/17.
//  Copyright © 2017 Dhanunjaya. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {

    @IBOutlet weak var groupButton: UIButton!
    
    let SEGUE_IDENTIFIER = "homeToCategories"
    var categoriesArray = Array<Int>()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        callGroupsAPI()
    }
    @IBAction func groupButtonClicked(_ sender: Any) {
        self.performSegue(withIdentifier: SEGUE_IDENTIFIER, sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
        if segue.identifier == SEGUE_IDENTIFIER{
            let categoriesVC = segue.destination as! CategoriesViewController
            categoriesVC.groupCategoriesArray = categoriesArray
        }
     }
    
    func callGroupsAPI(){
        let url = Constants.APIs.GROUPS + "/" + Constants.FixedValues.GROUPS_ID
        self.apiModel.callAPI(url: url)
    }

    //Override methods from Base calss
    override func didApiSuccess(response: Any) {
        print(response)
        let dict = response as! [String : Any]
        let groupName = dict["name"] as? String ?? ""
        groupButton.setTitle(groupName, for: .normal)
        
        categoriesArray = dict["categories"] as! Array<Int>
        
    }
    override func didApiFailure(error: String) {
        print(error)
        Utilities.infoAlert(error, viewController: self)
        groupButton.setTitle(Constants.FixedValues.TRY_AGAIN, for: .normal)
    }

}

