//
//  AnimalTableViewCell.swift
//  RC_week4
//
//  Created by 권유정 on 2022/10/13.
//

import UIKit

class AnimalTableViewCell: UITableViewCell {
    
    var Index: Int = 0
    private var animal: SettingAnimal = SettingAnimal.shared
    
    @IBOutlet weak var animalName: UILabel!
    @IBOutlet weak var animalDotori: UILabel!
    @IBOutlet weak var animalImg: UIImageView!
    
    //var changeDelegate: changeDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //change()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    public func get(data: Setting){
        animalImg.image = data.img
        animalName.text = data.name
        animalDotori.text = String(data.dotori)
    }
    
    
}
