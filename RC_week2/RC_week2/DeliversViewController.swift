//
//  DeliversViewController.swift
//  RC_week2
//
//  Created by 권유정 on 2022/09/30.
//

import UIKit

class DeliversViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    self.navigationController?.setNavigationBarHidden(false, animated: animated)
        
   
        
    }
    var menu: String = ""
    @IBOutlet weak var menu1: UILabel!
    @IBAction func viewDidTap1(_ sender: UITapGestureRecognizer) {
        
        let didDeliversVC = storyboard?.instantiateViewController(identifier: "didDeliversVC") as! DidDeliversViewController
        didDeliversVC.menu = menu1.text ?? ""
        self.present(didDeliversVC, animated: false, completion: nil)
        
    }
    
    @IBOutlet weak var menu2: UILabel!
    
    @IBAction func viewDidTap2(_ sender: UITapGestureRecognizer) {
        let didDeliversVC = storyboard?.instantiateViewController(identifier: "didDeliversVC") as! DidDeliversViewController
        didDeliversVC.menu = menu2.text ?? ""
        self.present(didDeliversVC, animated: false, completion: nil)
    }
    
    @IBOutlet weak var menu3: UILabel!
    @IBAction func viewDidTap3(_ sender: UITapGestureRecognizer) {
        let didDeliversVC = storyboard?.instantiateViewController(identifier: "didDeliversVC") as! DidDeliversViewController
        didDeliversVC.menu = menu3.text ?? ""
        self.present(didDeliversVC, animated: false, completion: nil)
    }
    
    @IBOutlet weak var menu4: UILabel!
    @IBAction func viewDidTap4(_ sender: UITapGestureRecognizer) {
        let didDeliversVC = storyboard?.instantiateViewController(identifier: "didDeliversVC") as! DidDeliversViewController
        didDeliversVC.menu = menu4.text ?? ""
        self.present(didDeliversVC, animated: false, completion: nil)
    }
    
    @IBOutlet weak var menu5: UILabel!
    @IBAction func viewDidTap5(_ sender: UITapGestureRecognizer) {

        let didDeliversVC = storyboard?.instantiateViewController(identifier: "didDeliversVC") as! DidDeliversViewController
        didDeliversVC.menu = menu5.text ?? ""
        self.present(didDeliversVC, animated: false, completion: nil)
    }
    
    @IBOutlet weak var menu6: UILabel!
    @IBAction func viewDidTap6(_ sender: UITapGestureRecognizer) {
        
        let didDeliversVC = storyboard?.instantiateViewController(identifier: "didDeliversVC") as! DidDeliversViewController
        didDeliversVC.menu = menu6.text ?? ""
        self.present(didDeliversVC, animated: false, completion: nil)
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
