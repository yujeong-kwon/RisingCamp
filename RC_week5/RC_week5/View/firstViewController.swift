//
//  firstViewController.swift
//  RC_week5
//
//  Created by 권유정 on 2022/10/22.
//

import UIKit
enum ViewControllerCellType: String{
    case main = "firstTableViewCell"
}
class firstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private var first: SettingFirstList = SettingFirstList.shared
    let mainID = ViewControllerCellType.main.rawValue
    @IBOutlet weak var firstTableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("------------")
        //print(first.list[2].name)
        return first.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = firstTableView.dequeueReusableCell(withIdentifier: mainID, for: indexPath) as! firstTableViewCell
        
        let cellData = first.read(at: indexPath.row)
        print(cellData.name)
        cell.getList(data: cellData)
        
        return cell
    }
    
  
    
   

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.test {
            self.setup()
        }

        // Do any additional setup after loading the view.
    }
    
    func test(complition: @escaping () -> ()){
        ResponseRequest().getData(self)
        complition()
    }
    func didSuccess(_ response: Welcome){
        print(response.placeThatDoATasteyFoodSt[1])
        for i in 0 ... 20{
            var name = (response.placeThatDoATasteyFoodSt[1].row?[i].restrtNm)!
            var juso = (response.placeThatDoATasteyFoodSt[1].row?[i].refineRoadnmAddr)!
            var sigun = (response.placeThatDoATasteyFoodSt[1].row?[i].sigunNm)!
            
            first.add(name: name ?? "", juso: juso ?? "", sigun: sigun ?? "")
        }
        
        firstTableView.reloadData()
    }
    func setup(){
        firstTableView.register(UINib(nibName: mainID, bundle: nil),forCellReuseIdentifier: mainID)
        firstTableView.delegate = self
        firstTableView.dataSource = self
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
