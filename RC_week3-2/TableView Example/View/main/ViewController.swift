//
//  ViewController.swift
//  TableView Example
//
//  Created by 김우성 on 2022/10/01.
//

import UIKit


enum ViewControllerCellType: String {
    case main = "MainTableViewCell"
}

class ViewController: UIViewController {
    // MARK: - Properties
    private var service: SettingService = SettingService.shared
    let mainID = ViewControllerCellType.main.rawValue
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        // 1 셀 등록하기
        tableView.register(
            UINib(nibName: mainID, bundle: nil),
            forCellReuseIdentifier: mainID
        )
        
        // 2 Delegate
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// 3 프로토콜을 채택하여 구현
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    // 몇 개를 만들지
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        // 데이터 전달
        return service.count
        
    }
    
    // UI
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 셀 구성
        let cell = tableView.dequeueReusableCell(
            withIdentifier: mainID,
            for: indexPath) as! MainTableViewCell
        
        // 데이터 전달
        //cell.switch.isOn = service.settingList[indexPath.row].onOff
        //service.update(at: indexPath.row, newValue: )
        let cellData = service.read(at: indexPath.row)
        cell.Index = indexPath.row
        cell.switchOffDelegate = self
        cell.get(data: cellData)
        
        return cell
    }
}
extension ViewController: SwitchOffDelegate{
    func switchChange(index: Int, switchIs: Bool) {
        service.settingList[index].onOff = switchIs
    }
}
