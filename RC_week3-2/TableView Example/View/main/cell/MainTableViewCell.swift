//
//  MainTableViewCell.swift
//  TableView Example
//
//  Created by 김우성 on 2022/10/01.
//

import UIKit


protocol SwitchOffDelegate{
    func switchChange(index: Int, switchIs: Bool)
}
class MainTableViewCell: UITableViewCell {

    var switchOffDelegate: SwitchOffDelegate?
    var Index: Int = 0
    
    @IBOutlet weak var cellTitleLabel: UILabel!
    
    @IBOutlet weak var `switch`: UISwitch!
    
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        if self.switch.isOn{
            self.switchOffDelegate?.switchChange(index: Index, switchIs: true)
        }else{
            self.switchOffDelegate?.switchChange(index: Index, switchIs: false)
        }
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        //self.switch.isOn = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func get(data: Setting) {
        cellTitleLabel.text = data.name
        self.switch.isOn = data.onOff
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        //self.switch.isOn = true
    }
}
