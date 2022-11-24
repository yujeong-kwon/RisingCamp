//
//  ViewController.swift
//  RC_week5
//
//  Created by 권유정 on 2022/10/20.
//

import UIKit
import KakaoSDKUser

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var kakaoView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        kakaoView.layer.cornerRadius = 30
        
       
    }

    @IBAction func kakaoLogin(_ sender: UITapGestureRecognizer) {
        if (UserApi.isKakaoTalkLoginAvailable()){
            UserApi.shared.loginWithKakaoTalk{(oauthToken, error) in
                if let error = error{
                    print(error)
                }
                else{
                    print("loginWithKakaoTalk() success.")
                    
                    _ = oauthToken
                    
                    let accessToken = oauthToken?.accessToken
                    
                    self.setUserInfo()
                    
                }
                
            }
        }
      
        
    }
    @IBAction func next(_ sender: UIButton) {
        let main = self.storyboard?.instantiateViewController(withIdentifier: "mainVC") as! MainViewController
        
        self.present(main, animated: false, completion: nil)
    }
    func setUserInfo(){
        UserApi.shared.me() {(user, error) in
            if let error = error{
                print(error)
            }
            else{
                print("me() success.")
                _ = user
                self.name.text = user?.kakaoAccount?.profile?.nickname
                              
                if let url = user?.kakaoAccount?.profile?.profileImageUrl,
                   let data = try? Data(contentsOf: url) {
                    self.image.image = UIImage(data: data)
                }
                //이미지랑 이름 바꾸기
            }
            
        }
    }
   
}

