//
//  detailViewController.swift
//  RC_week3
//
//  Created by 권유정 on 2022/10/07.
//

import UIKit

enum DetailViewControllerCellType: String{
    case main = "CartTableViewCell"
}

class detailViewController: UIViewController {

    var cart: CartMenu = CartMenu.shared
    let mainID = DetailViewControllerCellType.main.rawValue
    
    @IBOutlet weak var detailImg: UIImageView!
    @IBOutlet weak var detailName: UILabel!
    @IBOutlet weak var detailSum: UILabel!
    
    @IBOutlet weak var nameView: UIView!
    
    var name: String?
    var sum: String?
    var Img: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
        nameView.layer.borderColor = UIColor.lightGray.cgColor
        nameView.layer.borderWidth = 1.5
        nameView.layer.cornerRadius = 10
    }
    func updateUI(){
      
        detailName.text = name
        detailSum.text = sum
        detailImg.image = Img
        
        
    }

    @IBAction func addCart(_ sender: UIButton) {
        cart.add(name: name ?? "", sum: sum ?? "", img: (Img ?? UIImage(named: "딸크.PNG"))!)
    
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
