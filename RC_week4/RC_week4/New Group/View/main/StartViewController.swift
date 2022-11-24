//
//  StartViewController.swift
//  RC_week4
//
//  Created by 권유정 on 2022/10/12.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    @IBAction func start(_ sender: UITapGestureRecognizer) {
        let start = storyboard?.instantiateViewController(withIdentifier: "mainVC") as! MainViewController
        
        self.present(start, animated: false, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
