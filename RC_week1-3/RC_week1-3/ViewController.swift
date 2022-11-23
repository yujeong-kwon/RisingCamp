//
//  ViewController.swift
//  RC_week1-3
//
//  Created by 권유정 on 2022/09/22.
//

import UIKit

var images = ["page_add1.jpeg", "page_add2.jpeg",  "page_add3.jpeg", "page_add4.jpeg", "page_add5.jpeg", "page_add6.jpeg", "page_add7.jpeg", "page_add8.jpeg", "page_add9.jpeg", "page_add10.jpeg"]
class ViewController: UIViewController {

    
    @IBOutlet var pageControlAd: UIPageControl!
    @IBOutlet var imgViewAd: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControlAd.currentPage = 0
        // Do any additional setup after loading the view.
    }

    @IBAction func pageChangeAd(_ sender: UIPageControl) {
        imgViewAd.image = UIImage(named: images[pageControlAd.currentPage])
    }
    
    
}

