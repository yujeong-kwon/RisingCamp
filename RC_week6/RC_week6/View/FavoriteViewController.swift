//
//  FavoriteViewController.swift
//  RC_week6
//
//  Created by 권유정 on 2022/10/24.
//

import UIKit
enum FavoriteViewConotrollerCellType: String{
    case main = "MovieTableViewCell"
}
class FavoriteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    private var dataModel: SettingMovie = SettingMovie.shared
    let mainID = FavoriteViewConotrollerCellType.main.rawValue
    //var favoriteList: [Welcome] = []
    
    @IBOutlet weak var favoriteTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteTableView.register(UINib(nibName: mainID, bundle: nil), forCellReuseIdentifier: mainID)
        favoriteTableView.delegate = self
        favoriteTableView.dataSource = self
    }
    
    @objc func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var cnt = 0
        for i in 0 ... dataModel.count - 1{
            if(dataModel.list[i].star == true){
                cnt += 1
            }
        }
        return cnt
        
    }
    
    @objc func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: mainID, for: indexPath) as! MovieTableViewCell
        cell.Index = indexPath.row
        
        cell.starImageChangeDelegate = self
        let cellBookMarkData = dataModel.getBookmarkData(at: indexPath.row)
        cell.getList(data: cellBookMarkData)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        // 상세화면 띄우기 구현
        
        
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        
        _ = self.navigationController?.popViewController(animated: true)
    }
}

extension FavoriteViewController: starImageChangeDelegate{
    func updateData(newValue: Movie, index: Int) {
        print(index)
        dataModel.update(newValue: newValue, index: index)
    }
    
    func updateTableViewUI(newValue: Movie, index: Int) {
        favoriteTableView.reloadData()
    }
}
