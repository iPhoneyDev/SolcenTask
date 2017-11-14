//
//  AchievmentViewController.swift
//  SolcenTask
//
//  Created by DhanuSH on 14/11/17.
//  Copyright © 2017 Dhanunjaya. All rights reserved.
//

import UIKit

class AchievmentDetailsViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var flagsLabel: UILabel!
    @IBOutlet weak var tiersLabel: UILabel!
    @IBOutlet weak var rewardsLabel: UILabel!
    var achievmentDict = [String : Any]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        debugPrint(achievmentDict)
        nameLabel.text = achievmentDict["name"] as? String ?? ""
        descLabel.text = achievmentDict["requirement"] as? String ?? ""
        prepareFlags(array: achievmentDict["flags"] as! [String])
        prepareTiers(array: achievmentDict["tiers"] as! [[String : Any]])
        prepareRewards(array: achievmentDict["rewards"] as! [[String : Any]])
    }
    
    //Appending text from dictionary and giving to label
    func prepareFlags(array: [String]){
        var flags = ""
        for flag in array{
            flags += "\(flag)" + "\n"
        }
        flags = String(flags.characters.dropLast())
        flagsLabel.text = "\(Constants.FixedValues.FLAGS): \n" + flags
    }
    //Appending text from dictionary and giving to label
    func prepareTiers(array: [[String : Any]]){
        var tiers = ""
        for tier in array{
            let count = "\(Constants.FixedValues.COUNT): \(tier["count"] as? Int ?? 0) \n"
            let points = "\(Constants.FixedValues.POINTS): \(tier["points"] as? Int ?? 0) \n"
            tiers += count + points + "\n"
        }
        tiersLabel.text = "\(Constants.FixedValues.TIERS): \n\n" + tiers
    }
    //Appending text from dictionary and giving to label
    func prepareRewards(array: [[String : Any]]){
        var rewards = ""
        for reward in array{
            let type = reward["type"] as? String ?? ""
            let region = reward["region"] as? String ?? ""
            rewards += "\(Constants.FixedValues.TYPE): " + type + "\n \(Constants.FixedValues.REGION):" + region + "\n"
        }
        rewardsLabel.text = "\(Constants.FixedValues.REGION): \n\n" + rewards
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
