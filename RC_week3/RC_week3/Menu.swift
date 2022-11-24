//
//  Menu.swift
//  RC_week3
//
//  Created by 권유정 on 2022/10/07.
//

import Foundation
import UIKit

class SettingMenu{
    static let shared = SettingMenu()
    var settingList: [Setting] = []
    init(){
        [
            Setting(name: "생크림 쿠키슈", detail: "부드러운 우유 생크림 듬뿍 :)", sum: "3,300원",img: UIImage(named: "생쿠.PNG")),
            Setting(name: "트리플초코 쿠키슈", detail: "당 떨어질땐 초코범벅 트리플초코로 당충전 :)", sum: "3,800원",img: UIImage(named: "트쿠.PNG")),
            Setting(name: "블루베리 요거트 쿠키슈", detail: "블루베리 요거트 크림이 듬뿍 :)", sum: "3,800원",img: UIImage(named: "블요쿠.PNG")),
            Setting(name: "티라미수 쿠키슈", detail: "리얼 마스카포네 티라미수 크림이 듬뿍 :)", sum: "4,000원",img: UIImage(named: "티쿠.PNG")),
            Setting(name: "말차 쿠키슈", detail: "부드러운 우유 생크림 듬뿍 :)", sum: "4,000원",img: UIImage(named: "말쿠.PNG")),
            Setting(name: "초당옥수수 쿠키슈", detail: "옥수로 달당 초당옥수수크림이 듬뿍 :)", sum: "4,000원",img: UIImage(named: "초쿠.PNG")),
            Setting(name: "초당옥수수 크로플", detail: "옥수로 달당 초당옥수수 크로플 :)", sum: "5,300원",img: UIImage(named: "초크.PNG")),
            Setting(name: "말차 크로플", detail: "부드러운 말차크림에 바삭한 말차크런치를 한번에 :)", sum: "5,300원",img: UIImage(named: "말크.PNG")),
            Setting(name: "초코트리 크로플", detail: "말차크림과 누텔라의 환상조합 달콤한 초콜릿까지 :)", sum: "5,500원",img: UIImage(named: "초코크.PNG")),
            Setting(name: "딸기생크림 크로플", detail: "여름 생 딸기 & 우유 생크림의 조화 :)", sum: "5,500원",img: UIImage(named: "딸기크.PNG")),
            Setting(name: "플레인 크로플", detail: "100% 천연버터 풍미가득~ 겉바속촉 플레인 크로플 :)", sum: "3,500원",img: UIImage(named: "플크.PNG")),
            Setting(name: "생크림 크로플", detail: "부드러운 우유 생크림 듬뿍 :)", sum: "4,500원",img: UIImage(named: "생크.PNG"))
           
        ].forEach{setting in self.settingList.append(setting)
        }
    }
    public func add(){
        //self.settingList.append(Setting(name: "추가된 데이터"))
    }

    public func read(at: Int) -> Setting{
        return settingList[at]
    }

    public func update(at: Int, newValue: Setting){
        settingList[at] = newValue
    }

    public func delete(at: Int){
        settingList.remove(at: at)
    }

    var count: Int { self.settingList.count }
}

struct Setting{
    let name: String
    let detail: String
    let sum: String
    let img: UIImage?
}

