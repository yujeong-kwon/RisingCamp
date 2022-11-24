//
//  Setting.swift
//  TableView Example
//
//  Created by 김우성 on 2022/10/01.
//

import Foundation

/// 데이터를 추가 / 읽기 / 수정 / 삭제 (CRUD)
class SettingService {
    // 싱글톤
    static let shared = SettingService()
    
    var settingList: [Setting] = []
    
    init() {
        [
            Setting(name: "에어플레인모드", onOff: true),
            Setting(name: "Wi-Fi", onOff: true),
            Setting(name: "Bluetooth", onOff: true),
            Setting(name: "셀룰러", onOff: true),
            Setting(name: "개인용 핫스팟", onOff: true),
            Setting(name: "VPN", onOff: true),
            Setting(name: "알림", onOff: true),
            Setting(name: "사운드 및 햅틱", onOff: true),
            Setting(name: "집중 모드", onOff: true),
            Setting(name: "스크린 타임", onOff: true),
            Setting(name: "에어플레인모드", onOff: true),
            Setting(name: "Wi-Fi", onOff: true),
            Setting(name: "Bluetooth", onOff: true),
            Setting(name: "셀룰러", onOff: true),
            Setting(name: "개인용 핫스팟", onOff: true),
            Setting(name: "VPN", onOff: true),
            Setting(name: "알림", onOff: true),
            Setting(name: "사운드 및 햅틱", onOff: true),
            Setting(name: "집중 모드", onOff: true),
            Setting(name: "스크린 타임", onOff: true),
            Setting(name: "에어플레인모드", onOff: true),
            Setting(name: "Wi-Fi", onOff: true),
            Setting(name: "Bluetooth", onOff: true),
            Setting(name: "셀룰러", onOff: true),
            Setting(name: "개인용 핫스팟", onOff: true),
            Setting(name: "VPN", onOff: true),
            Setting(name: "알림", onOff: true),
            Setting(name: "사운드 및 햅틱", onOff: true),
            Setting(name: "집중 모드", onOff: true),
            Setting(name: "스크린 타임", onOff: true),
            Setting(name: "에어플레인모드", onOff: true),
            Setting(name: "Wi-Fi", onOff: true),
            Setting(name: "Bluetooth", onOff: true),
            Setting(name: "셀룰러", onOff: true),
            Setting(name: "개인용 핫스팟", onOff: true),
            Setting(name: "VPN", onOff: true),
            Setting(name: "알림", onOff: true),
            Setting(name: "사운드 및 햅틱", onOff: true),
            Setting(name: "집중 모드", onOff: true),
            Setting(name: "스크린 타임", onOff: true),
            Setting(name: "에어플레인모드", onOff: true),
            Setting(name: "Wi-Fi", onOff: true),
            Setting(name: "Bluetooth", onOff: true),
            Setting(name: "셀룰러", onOff: true),
            Setting(name: "개인용 핫스팟", onOff: true),
            Setting(name: "VPN", onOff: true),
            Setting(name: "알림", onOff: true),
            Setting(name: "사운드 및 햅틱", onOff: true),
            Setting(name: "집중 모드", onOff: true),
            Setting(name: "스크린 타임", onOff: true),
        ].forEach { setting in
            self.settingList.append(setting)
        }
    }
    
    // Create
    public func add() {
       // self.settingList.append(Setting(name: "추가된 데이터"))
    }
    
    // Read
    public func read(at: Int) -> Setting {
        return settingList[at]
    }
    
    // Update
    public func update(at: Int, newValue: Setting) {
        settingList[at] = newValue
    }
    
    // Delete
    public func delete(at: Int) {
        settingList.remove(at: at)
    }
    
    // count
    var count: Int { self.settingList.count }
}


struct Setting {
    let name: String
    var onOff: Bool
}
