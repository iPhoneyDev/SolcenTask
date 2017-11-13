//
//  ApiModel.swift
//  SolcenTask
//
//  Created by DhanuSH on 13/11/17.
//  Copyright © 2017 Dhanunjaya. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

protocol ApiModelDelgate: class {
    func didApiSuccess(response: Any)
    func didApiFailure(error: String)
}

class ApiModel: NSObject {
    
    var delegate:ApiModelDelgate?

    func callAPI(url: String){
        Alamofire.request(url).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(_):
                if response.result.value != nil{
                    print(response.result.value!)
                    self.delegate?.didApiSuccess(response: response.result.value as! Any)
                }
                break
            case .failure(_):
                print(response.result.error)
                self.delegate?.didApiFailure(error: (response.error?.localizedDescription)!)
                break
            }
        }
    }
}
