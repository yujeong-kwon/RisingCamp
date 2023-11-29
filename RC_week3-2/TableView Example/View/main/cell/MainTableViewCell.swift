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
    private var service: SettingService = SettingService.shared
    var switchOffDelegate: SwitchOffDelegate?
    var Index: Int = 0
    
    @IBOutlet weak var cellTitleLabel: UILabel!
    
    @IBOutlet weak var switchBtn: UISwitch!
    
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        //if switchBtn.isOn{
            //self.switchOffDelegate?.switchChange(index: Index, switchIs: true)
       // }else{
            //self.switchOffDelegate?.switchChange(index: Index, switchIs: false)
       // }
        service.settingList[Index].onOff = switchBtn.isOn
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
        switchBtn.isOn = data.onOff
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        switchBtn.isOn = true
    }
}
