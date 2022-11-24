//
//  ViewController.swift
//  RC_week3
//
//  Created by 권유정 on 2022/10/07.
//

import UIKit
enum ViewControllerCellType: String{
    case main = "MainTableViewCell"
}
class ViewController: UIViewController {
    
    private var menu: SettingMenu = SettingMenu.shared
    let mainID = ViewControllerCellType.main.rawValue
    @IBOutlet weak var tableView: UITableView!
    //var sectionHeader = ["쿠키슈", "크로플"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        // Do any additional setup after loading the view.
    }
    
    private func setupTableView(){
        tableView.register(UINib(nibName: mainID, bundle: nil), forCellReuseIdentifier: mainID)
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: mainID, for: indexPath) as! MainTableViewCell
        
        let cellData = menu.read(at: indexPath.row)
        cell.getMenu(data: cellData)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //터치이벤트
        performSegue(withIdentifier: "detail", sender: indexPath.row)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "detail"{
            let destination = segue.destination as? detailViewController
            if let selectedIndex = sender as? Int{
                destination?.name = menu.settingList[selectedIndex].name
                destination?.sum = menu.settingList[selectedIndex].sum
                destination?.Img = menu.settingList[selectedIndex].img
            }
        }
        
    }
    
    /*
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionHeader.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionHeader[section]
    }
    */
}

