//
//  firstTableViewCell.swift
//  RC_week5
//
//  Created by 권유정 on 2022/10/22.
//

import UIKit

class firstTableViewCell: UITableViewCell {

    @IBOutlet weak var sigun: UILabel!
    @IBOutlet weak var juso: UILabel!
    @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    public func getList(data: Setting){
        name.text = data.name
        sigun.text = data.sigun
        juso.text = data.juso
    }
}
