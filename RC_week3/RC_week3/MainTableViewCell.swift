//
//  MainTableViewCell.swift
//  RC_week3
//
//  Created by 권유정 on 2022/10/07.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var cellMenuName: UILabel!
    @IBOutlet weak var cellMenuDetail: UILabel!
    @IBOutlet weak var cellMenuSum: UILabel!
    @IBOutlet weak var cellMenuImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func getMenu(data: Setting){
        cellMenuName.text = data.name
        cellMenuDetail.text = data.detail
        cellMenuSum.text = data.sum
        cellMenuImg.image = data.img
    }
    
}
