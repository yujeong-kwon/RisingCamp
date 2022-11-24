//
//  first.swift
//  RC_week5
//
//  Created by 권유정 on 2022/10/22.
//

import Foundation

class SettingFirstList{
    static let shared = SettingFirstList()
    var list: [Setting] = []
    private init(){
        [
        
            Setting(name: "test", juso: "Test", sigun: "test")
           
        ].forEach{setting in self.list.append(setting)
        }
    }
    public func add(name: String, juso: String, sigun: String){
        self.list.append(Setting(name: name, juso: juso, sigun: sigun))
        //print(list)
    }
    public func read(at: Int) -> Setting{
        return list[at]
    }
    var count: Int {self.list.count}
}

struct Setting{
    let name: String
    let juso: String
    let sigun: String
}

