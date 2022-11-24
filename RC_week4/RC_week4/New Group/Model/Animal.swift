//
//  Animal.swift
//  RC_week4
//
//  Created by 권유정 on 2022/10/13.
//

import Foundation
import UIKit

class SettingAnimal{
    //싱글톤
    static let shared = SettingAnimal()
    
    var settingList: [Setting] = []
    
    init(){
        [ Setting(img: UIImage(named: "냐옹.png"), name: "냐옹", dotoriImg: UIImage(named: "도토리.png"), dotori: 2),
        Setting(img: UIImage(named: "댕이.png"), name: "댕이", dotoriImg: UIImage(named: "도토리.png"), dotori: 3),
        Setting(img: UIImage(named: "지지.png"), name: "지지", dotoriImg: UIImage(named: "도토리.png"), dotori: 5),
          Setting(img: UIImage(named: "우피 그림자.png"), name: "주인을 터치해서 초대하세요", dotoriImg: UIImage(named: "도토리.png"), dotori: 0),
          Setting(img: UIImage(named: "다람이 그림자.png"), name: "주인을 터치해서 초대하세요", dotoriImg: UIImage(named: "도토리.png"), dotori: 0),
          Setting(img: UIImage(named: "토로리 그림자.png"), name: "주인을 터치해서 초대하세요", dotoriImg: UIImage(named: "도토리.png"), dotori: 0),
       ].forEach{setting in self.settingList.append(setting)}
        
    }
    public func add(){
       // self.settingList.append()
        
    }
    public func read(at: Int) -> Setting{
        return settingList[at]
    }
    public func update(at: Int, newImg: UIImage?, newName: String, newDotori: Int){
        settingList[at].img = newImg
        settingList[at].name = newName
        settingList[at].dotori = newDotori
    }
    public func delete(name: String){
        print(name)
        if let removeIndex = settingList.firstIndex(where: { $0.name == name}){
            settingList.remove(at: removeIndex)
        }
    }
}
struct Setting{
    var img: UIImage?
    var name: String
    let dotoriImg: UIImage?
    var dotori: Int
    
    
}
