//
//  HomeViewController.swift
//  RC_week2
//
//  Created by 권유정 on 2022/09/29.
//

import UIKit

class HomeViewController: UIViewController{
    let MaxTopHeight: CGFloat = 250
    let MinTopHeight: CGFloat = 80
    
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
            scrollView.contentInset = UIEdgeInsets(top: MaxTopHeight, left: 0, bottom: 0, right: 0)
        }
    }
    @IBOutlet weak var upperHeaderView: UIView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var homeTopViewHeight: NSLayoutConstraint!{
        didSet{
            homeTopViewHeight.constant = MaxTopHeight
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

}


extension HomeViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        
        
        if scrollView.contentOffset.y < 0 {
            homeTopViewHeight.constant = max(abs(scrollView.contentOffset.y), MinTopHeight)
        }else{
            homeTopViewHeight.constant = MinTopHeight
        }
        
        let offset = -scrollView.contentOffset.y
        let percentage = (offset-170)/100
        //let percentage = (offset-(MaxTopHeight-40))/100
        //let percentage = offset / 20
        upperHeaderView?.alpha = percentage
    }
}

