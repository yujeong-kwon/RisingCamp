//
//  TabViewController.swift
//  RC_week5
//
//  Created by 권유정 on 2022/10/22.
//

import UIKit
import Tabman
import Pageboy

class TabViewController: TabmanViewController{
    
    @IBOutlet weak var tabView: UIView!
   

    var viewControllers: [UIViewController] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstVC = storyboard?.instantiateViewController(withIdentifier: "firstVC") as! firstViewController
       
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as! secondViewController
        
        let thirdVC = storyboard?.instantiateViewController(withIdentifier: "thirdVC") as! thirdViewController
        viewControllers.append(firstVC)
        viewControllers.append(secondVC)
        viewControllers.append(thirdVC)
        self.dataSource = self
        let bar = TMBar.ButtonBar()
        bar.backgroundView.style = .blur(style: .light)
        bar.layout.contentInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        bar.buttons.customize{(button) in
            button.tintColor = .systemGray
            button.selectedTintColor = .black
            
        }
        bar.indicator.weight = .custom(value: 2)
        bar.indicator.tintColor = .orange
        addBar(bar, dataSource: self, at: .custom(view: tabView, layout: nil))
        // Do any additional setup after loading the view.
    }


}

extension TabViewController: PageboyViewControllerDataSource, TMBarDataSource{
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index{
        case 0:
            return TMBarItem(title: "경기도")
        case 1:
            return TMBarItem(title: "부산")
        case 2:
            return TMBarItem(title: "전남")
        default:
            let title = "Page \(index)"
            return TMBarItem(title: title)
        }
    }
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        print(index)
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return .at(index: 0)
    }
}
