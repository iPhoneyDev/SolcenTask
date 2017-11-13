//
//  CategoriesViewController.swift
//  SolcenTask
//
//  Created by DhanuSH on 13/11/17.
//  Copyright © 2017 Dhanunjaya. All rights reserved.
//

import UIKit

class CategoriesViewController: BaseViewController {

    var groupCategoriesArray = Array<Int>()
    var categoriesArray = [[String : Any]]()
    @IBOutlet weak var categoryTableView: UITableView!
    let SEGUE_IDENTIFIER = "categoriesToAchievements"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Regisetering the custom tableview cell with tableview
        categoryTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")

        callCategoriesAPI()
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
            let categoriesVC = segue.destination as! AchievementsViewController
            let achivements = sender as! Array<Int>
            debugPrint(achivements)
            categoriesVC.categoryAchievementsArray = achivements
        }
    }
 
    
    //Call categories API
    func callCategoriesAPI(){
        
        var categoryIds = ""
        for cateogoryId in groupCategoriesArray{
            categoryIds += "\(cateogoryId)" + ","
        }
        categoryIds = String(categoryIds.characters.dropLast())
        
        let url = Constants.APIs.CATEGORIES + categoryIds
        print(url)
        apiModel.callAPI(url: url)
    }

    //Override methods from Base calss
    override func didApiSuccess(response: Any) {
        
        categoriesArray = response as! [[String : Any]]
        print(categoriesArray)
        categoryTableView.reloadData()
    }
    override func didApiFailure(error: String) {
        print(error)
        Utilities.infoAlert(error, viewController: self)
    }
}

// MARK: - Table view data source and delgates
extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesArray.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        
        let category = categoriesArray[indexPath.row]
        cell.nameLabel.text = category["name"] as? String ?? ""
        cell.descLabel.text = category["description"] as? String ?? ""
        let image_url = category["icon"] as? String ?? ""
        cell.c_imageView?.af_setImage(withURL: URL(string: image_url)!)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = categoriesArray[indexPath.row]
        let achivements = category["achievements"] as! Array<Int>
        self.performSegue(withIdentifier: SEGUE_IDENTIFIER, sender: achivements)
    }
}



