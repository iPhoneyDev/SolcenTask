//
//  AchievementsViewController.swift
//  SolcenTask
//
//  Created by DhanuSH on 13/11/17.
//  Copyright © 2017 Dhanunjaya. All rights reserved.
//

import UIKit

class AchievementsViewController: BaseViewController {

    var categoryAchievementsArray = Array<Int>()
    var achievmentsArray = [[String : Any]]()
    @IBOutlet weak var achievmentTableView: UITableView!
    let SEGUE_IDENTIFIER = "achievementsToDetails"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //Regisetering the custom tableview cell with tableview
        achievmentTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")

        callAchievementsAPI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Call Achivements API
    func callAchievementsAPI(){
        
        var achievmentsIds = ""
        for achievementId in categoryAchievementsArray{
            achievmentsIds += "\(achievementId)" + ","
        }
        achievmentsIds = String(achievmentsIds.characters.dropLast())
        
        let url = Constants.APIs.ACHIEVEMENTS + achievmentsIds
        print(url)
        apiModel.callAPI(url: url)
    }
    
    //Override methods from Base calss
    override func didApiSuccess(response: Any) {
        
        achievmentsArray = response as! [[String : Any]]
        print(achievmentsArray)
        achievmentTableView.reloadData()
    }
    override func didApiFailure(error: String) {
        print(error)
        Utilities.infoAlert(error, viewController: self)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == SEGUE_IDENTIFIER{
            let detaislVC = segue.destination as! AchievmentDetailsViewController
            let achivements = sender as! [String : Any]
            detaislVC.achievmentDict = achivements
        }
    }
    

}
// MARK: - Table view data source and delgates
extension AchievementsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return achievmentsArray.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        
        let category = achievmentsArray[indexPath.row]
        cell.nameLabel.text = category["name"] as? String ?? ""
        cell.descLabel.text = category["description"] as? String ?? ""
        cell.imageViewWidthConstraint.constant = 0
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let achievment = achievmentsArray[indexPath.row]
        
        self.performSegue(withIdentifier: SEGUE_IDENTIFIER, sender: achievment)
    }
}
