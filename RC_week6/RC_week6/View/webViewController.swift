//
//  webViewController.swift
//  Pods
//
//  Created by 권유정 on 2022/10/24.
//

import UIKit
import WebKit

class webViewController: UIViewController {

    var titleWeb: String = ""
    var direcWeb: String = ""
    var actorWeb: String = ""
    var userRWeb: String = ""
    var imageWeb: String = ""
    var starWeb: Bool = false
    var urlWeb: String = ""
    
    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var direcView: UILabel!
    @IBOutlet weak var actorView: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var starBtn: UIButton!
    @IBOutlet weak var userRView: UILabel!
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        
        titleView.text = titleWeb
        direcView.text = direcWeb
        actorView.text = actorWeb
        userRView.text = userRWeb
        if starWeb == true{
            starBtn.setImage(UIImage(named: "starSelected.png"), for: .normal)
        }else{
            starBtn.setImage(UIImage(named: "star.png"), for: .normal)
        }
        let imageURL = URL(string: imageWeb)
        imageView.loadWeb(url: imageURL!)
        var url = URL(string: urlWeb)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func back(_ sender: UIButton) {
        _ = self.navigationController?.popViewController(animated: true)
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
extension UIImageView{
    func loadWeb(url: URL){
        DispatchQueue.global().async{
            [weak self] in
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async{
                        self?.image = image
                    }
                }
            }
        }
    }
}
