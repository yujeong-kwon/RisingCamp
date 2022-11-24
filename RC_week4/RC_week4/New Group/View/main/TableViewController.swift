//
//  TableViewController.swift
//  RC_week4
//
//  Created by 권유정 on 2022/10/13.
//

import UIKit

enum ViewControllerCellType: String{
    case main = "AnimalTableViewCell"
}
class TableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var animal: SettingAnimal = SettingAnimal.shared
    let mainID = ViewControllerCellType.main.rawValue
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
    }
    private func setupTableView(){
        tableView.register(UINib(nibName: mainID, bundle: nil), forCellReuseIdentifier: mainID)
        tableView.delegate = self
        tableView.dataSource = self
    }


}

extension TableViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animal.settingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: mainID, for: indexPath) as! AnimalTableViewCell
        
        let cellData = animal.read(at: indexPath.row)
        cell.Index = indexPath.row
        cell.get(data: cellData)
        
        return cell
    }
    
    
    
}
