//
//  ViewController.swift
//  RC_week6
//
//  Created by 권유정 on 2022/10/23.
//

import UIKit

enum ViewConotrollerCellType: String{
    case main = "MovieTableViewCell"
}
class ViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    
    private var dataModel: SettingMovie = SettingMovie.shared
    
    let mainID = ViewConotrollerCellType.main.rawValue
    var movieList : [Welcome] = []
    @IBOutlet weak var tableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: mainID, for: indexPath) as! MovieTableViewCell
        
        let cellData = dataModel.read(at: indexPath.row)
        //let cellBookMarkData = dataModel.getBookmarkData(at: indexPath.row)
        
        cell.Index = indexPath.row
        cell.starImageChangeDelegate = self
        cell.getList(data: cellData)
        //tableView.reloadData()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: mainID, for: indexPath) as! MovieTableViewCell
        
        cell.contentView.isUserInteractionEnabled = true
        let cellData = dataModel.read(at: indexPath.row)

        let VC = self.storyboard?.instantiateViewController(withIdentifier: "webVC") as! webViewController
        
        VC.titleWeb = cellData.title
        VC.direcWeb = cellData.director
        VC.actorWeb = cellData.actor
        VC.imageWeb = cellData.image
        VC.userRWeb = cellData.userRating
        VC.starWeb = cellData.star
        VC.urlWeb = cellData.link
        
        self.navigationController?.pushViewController(VC, animated: true)
        
        
    }
    

    @IBOutlet weak var upperView: UIView!
    
    @IBOutlet weak var btnView: UIView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
    func load(completion: @escaping () -> ()){
        var search = searchBar.text!
        ResponseRequest().getData(self, keyword: search ?? "")
        completion()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        dataModel.reload()
        self.load {
            self.setup()
        }
        
    }
    func setup(){
        tableView.register(UINib(nibName: mainID, bundle: nil), forCellReuseIdentifier: mainID)
        tableView.delegate = self
        tableView.dataSource = self
    }
    func didSuccess(_ response: Welcome){
    
        movieList.append(response)
        for i in 0 ... response.items.count - 1{
            var title = response.items[i].title
            title = title.components(separatedBy: ["<","/","b",">"]).joined()
            var image = response.items[i].image
            var direc = response.items[i].director
            direc = direc.trimmingCharacters(in: ["|"])
            direc = direc.replacingOccurrences(of: "|", with: ", ")
            var actor = response.items[i].actor
            actor = actor.trimmingCharacters(in: ["|"])
            actor = actor.replacingOccurrences(of: "|", with: ", ")
            var userR = response.items[i].userRating
            var link = response.items[i].link
            dataModel.add(title: title, image: image, director: direc, actor: actor, userRating: userR, star: false, link: link)
        }
        
        tableView.reloadData()
        
    }
    func initView(){
        //상단 뷰 아래 테두리
        navigationController?.isNavigationBarHidden = true
        
        let border = UIView()
        
        border.backgroundColor = .systemGray5
        border.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        border.frame = CGRect(x: 0, y: upperView.frame.height - 0.5 , width: upperView.frame.width, height: 0.5)
        upperView.addSubview(border)
        
        //즐겨찾기 버튼 테두리
        btnView.layer.borderWidth = 0.5
        btnView.layer.borderColor = UIColor.systemGray5.cgColor
        
        //searchBar 테두리 없애기
        self.searchBar.searchBarStyle = .minimal
        
    }
    
    @IBAction func favoriteBtn(_ sender: UITapGestureRecognizer) {
        let favoriteVC = storyboard?.instantiateViewController(withIdentifier: "favoriteVC") as! FavoriteViewController
        self.navigationController?.pushViewController(favoriteVC, animated: true)
    }
    
    
}

extension ViewController: starImageChangeDelegate{
    
    func updateData(newValue: Movie, index: Int) {
        dataModel.update(newValue: newValue, index: index)
    }
    
    func updateTableViewUI(newValue: Movie, index: Int) {
        //dataModel.update(newValue: newValue, index: index)
        tableView.reloadData()
       // dataModel.list[index].star = newValue.star
    }
}
