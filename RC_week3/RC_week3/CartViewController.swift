//
//  CartViewController.swift
//  RC_week3
//
//  Created by 권유정 on 2022/10/07.
//

import UIKit

enum CartViewControllerCellType: String{
    case main = "CartTableViewCell"
}

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private var cart: CartMenu = CartMenu.shared
    let mainID = CartViewControllerCellType.main.rawValue
    @IBOutlet weak var cartTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    private func setupTableView(){
        cartTableView.register(UINib(nibName: mainID, bundle: nil), forCellReuseIdentifier: mainID)
        cartTableView.delegate = self
        cartTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cartTableView.dequeueReusableCell(withIdentifier: mainID, for: indexPath) as! CartTableViewCell
        
        let cellData = cart.read(at: indexPath.row)
        cell.getCartName(data: cellData)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

}
