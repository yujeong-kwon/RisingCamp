//
//  ViewController.swift
//  RC_week2
//
//  Created by 권유정 on 2022/09/29.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func popup(){
        let popupVC = storyboard?.instantiateViewController(identifier: "popupVC") as! PopupViewController
    
        self.present(popupVC, animated: false, completion: nil)
    }

}

