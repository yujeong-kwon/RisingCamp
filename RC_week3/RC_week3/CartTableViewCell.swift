//
//  CartTableViewCell.swift
//  RC_week3
//
//  Created by 권유정 on 2022/10/07.
//

import UIKit


class CartTableViewCell: UITableViewCell {

    
    @IBOutlet weak var menuName: UILabel!
    
    @IBOutlet weak var menuAmount: UILabel!
    
    @IBOutlet weak var menuImg: UIImageView!
    @IBOutlet weak var remove: UIButton!
    @IBOutlet weak var menuSum: UILabel!
    
    @IBAction func removeBtn(_ sender: UIButton) {
        var cart: CartMenu = CartMenu.shared
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        remove.setTitleColor(.black, for: .normal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func getCartName(data: Cart){
        menuName.text = data.name
        menuSum.text = data.sum
        menuImg.image = data.img
    }
}
