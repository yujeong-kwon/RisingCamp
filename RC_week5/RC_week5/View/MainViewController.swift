//
//  MainViewController.swift
//  RC_week5
//
//  Created by 권유정 on 2022/10/21.
//

import UIKit
import Alamofire


class MainViewController: UIViewController {


    @IBOutlet weak var test: UILabel!
   
    private var first: SettingFirstList = SettingFirstList.shared
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }
    
   
    /*
    func test(ketword: String, completion: @escaping ((Response?) -> Void)){
        let url = "https://openapi.gg.go.kr/PlaceThatDoATasteyFoodSt"
        let parametaers: [String: Any] = ["KEY": "fa074a0da35a4364910b0403a2c8a064",
                                          "Type":"json","pIndex":1,"pSize":100,"SIGUN_NM":ketword]
        Alamofire.request(url, method: .get, parametaers: parametaers).responseJSON {[weak self] (response) in
            guard let self = self else {return}
            if let value = response.value{
                if let Response: Response = self.toJson(object: value){
                    completion(Response)
                }else{
                    print("error)
                }
            }
        }
        
    }

                          */
}
