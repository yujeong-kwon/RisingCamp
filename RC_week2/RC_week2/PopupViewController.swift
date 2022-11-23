//
//  PopupViewController.swift
//  RC_week2
//
//  Created by 권유정 on 2022/09/30.
//

import UIKit

class PopupViewController: UIViewController {

    
    
    @IBOutlet weak var menuName: UILabel!
    var menu:String = "메뉴"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.menuName.text = menu
        print(menu)
    }
    

}
